%% robustness_monte_carlo_analysis.m
% Monte Carlo robustness analysis for concept-level emergency brake-request logic.
% This script checks whether warning-state logic remains stable under input uncertainty.
% It is concept-level and does not claim production validation.

clear; clc;
rng(7);

root = fileparts(fileparts(mfilename('fullpath')));
resultsFolder = fullfile(root, 'results');
figFolder = fullfile(root, 'figures');

if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end

if ~exist(figFolder, 'dir')
    mkdir(figFolder);
end

N = 500;

% Base robustness cases
case_id = {'ROB-01_SAFE_DRY'; 'ROB-02_WARNING_WET'; 'ROB-03_EMERGENCY_DRY'; 'ROB-04_DELAY_WET'};
case_name = {'Safe dry following'; 'Wet-road warning case'; 'Emergency dry obstacle'; 'Delay-sensitive wet case'};

base_speed_kmh = [20; 30; 40; 30];
base_distance_m = [25; 9; 10; 8.8];
base_relative_speed_kmh = [5; 15; 40; 10];
base_mu = [0.75; 0.45; 0.75; 0.45];
base_delay_s = [0.20; 0.20; 0.20; 0.20];
expected_state = {'SAFE'; 'WARNING'; 'EMERGENCY_BRAKE'; 'WARNING'};

% Uncertainty assumptions
speed_sigma_kmh = 1.0;
distance_sigma_m = 0.75;
relative_speed_sigma_kmh = 1.0;
mu_sigma = 0.04;
delay_sigma_s = 0.04;

numCases = numel(base_speed_kmh);
total_samples = zeros(numCases,1);
expected_count = zeros(numCases,1);
expected_rate_percent = zeros(numCases,1);
emergency_brake_rate_percent = zeros(numCases,1);
false_emergency_rate_percent = zeros(numCases,1);
dominant_state = strings(numCases,1);
result_comment = strings(numCases,1);

all_case = strings(0,1);
all_state = strings(0,1);
all_speed = [];
all_distance = [];
all_mu = [];
all_delay = [];

for c = 1:numCases

    states = strings(N,1);
    brake_requests = zeros(N,1);

    for k = 1:N
        speed_kmh = base_speed_kmh(c) + speed_sigma_kmh * randn();
        target_distance_m = base_distance_m(c) + distance_sigma_m * randn();
        relative_speed_kmh = base_relative_speed_kmh(c) + relative_speed_sigma_kmh * randn();
        mu = base_mu(c) + mu_sigma * randn();
        delay_s = base_delay_s(c) + delay_sigma_s * randn();

        speed_kmh = max(0, min(50, speed_kmh));
        target_distance_m = max(1, target_distance_m);
        relative_speed_kmh = max(0.1, relative_speed_kmh);
        mu = max(0.30, min(0.85, mu));
        delay_s = max(0.05, min(0.40, delay_s));

        [~, ~, state, request] = local_warning_logic(speed_kmh, target_distance_m, relative_speed_kmh, mu, delay_s);

        states(k) = string(state);
        brake_requests(k) = request;

        all_case(end+1,1) = string(case_id{c});
        all_state(end+1,1) = string(state);
        all_speed(end+1,1) = speed_kmh;
        all_distance(end+1,1) = target_distance_m;
        all_mu(end+1,1) = mu;
        all_delay(end+1,1) = delay_s;
    end

    expected = string(expected_state{c});

    total_samples(c) = N;
    expected_count(c) = sum(states == expected);
    expected_rate_percent(c) = 100 * expected_count(c) / N;
    emergency_brake_rate_percent(c) = 100 * sum(states == "EMERGENCY_BRAKE") / N;

    if expected == "SAFE" || expected == "CAUTION"
        false_emergency_rate_percent(c) = emergency_brake_rate_percent(c);
    else
        false_emergency_rate_percent(c) = 0;
    end

    cats = categorical(states);
    counts = countcats(cats);
    names = categories(cats);
    [~, idx] = max(counts);
    dominant_state(c) = string(names{idx});

    if expected_rate_percent(c) >= 90
        result_comment(c) = "Stable under uncertainty";
    elseif expected_rate_percent(c) >= 75
        result_comment(c) = "Moderately stable under uncertainty";
    else
        result_comment(c) = "Sensitive to uncertainty";
    end
end

Results = table(string(case_id), string(case_name), string(expected_state), total_samples, expected_count, expected_rate_percent, emergency_brake_rate_percent, false_emergency_rate_percent, dominant_state, result_comment);
Results.Properties.VariableNames = {'case_id','case_name','expected_state','total_samples','expected_count','expected_rate_percent','emergency_brake_rate_percent','false_emergency_rate_percent','dominant_state','result_comment'};

outFile = fullfile(resultsFolder, 'robustness_results.csv');
writetable(Results, outFile);

SampleResults = table(all_case, all_state, all_speed, all_distance, all_mu, all_delay);
SampleResults.Properties.VariableNames = {'case_id','calculated_state','sampled_speed_kmh','sampled_target_distance_m','sampled_mu','sampled_actuator_delay_s'};
writetable(SampleResults, fullfile(resultsFolder, 'robustness_sample_points.csv'));

fprintf('Robustness Monte Carlo analysis completed.\n');
fprintf('Samples per case: %d\n', N);
fprintf('Saved results to: %s\n', outFile);

% Figure 1: expected-state pass rate
figure;
bar(Results.expected_rate_percent);
set(gca, 'XTickLabel', Results.case_id);
xtickangle(25);
ylabel('Expected State Rate [%]');
title('Robustness Expected-State Rate');
ylim([0 105]);
grid on;
figFile1 = fullfile(figFolder, 'robustness_pass_rate.png');
saveas(gcf, figFile1);
fprintf('Saved figure to: %s\n', figFile1);

% Figure 2: threshold sensitivity map
stateNumeric = double(categorical(all_state));
figure;
scatter(all_speed, all_distance, 18, stateNumeric, 'filled');
grid on;
xlabel('Sampled Ego Speed [km/h]');
ylabel('Sampled Target Distance [m]');
title('Threshold Sensitivity Map Under Input Variation');
cb = colorbar;
cb.Label.String = 'Calculated Warning State Category';
figFile2 = fullfile(figFolder, 'threshold_sensitivity_map.png');
saveas(gcf, figFile2);
fprintf('Saved figure to: %s\n', figFile2);

function [d_stop, ttc, state, brake_request] = local_warning_logic(speed_kmh, target_distance_m, relative_speed_kmh, mu, delay_s)
    g = 9.81;
    v = speed_kmh / 3.6;
    rel_v = relative_speed_kmh / 3.6;

    d_stop = v * delay_s + (v^2) / (2 * mu * g);

    if rel_v > 0
        ttc = target_distance_m / rel_v;
    else
        ttc = inf;
    end

    if target_distance_m <= 0.8 * d_stop || ttc <= 1.5
        state = 'EMERGENCY_BRAKE';
    elseif target_distance_m <= d_stop || ttc <= 2.5
        state = 'WARNING';
    elseif target_distance_m <= 1.3 * d_stop || ttc <= 4.0
        state = 'CAUTION';
    else
        state = 'SAFE';
    end

    if strcmp(state, 'EMERGENCY_BRAKE')
        brake_request = 1;
    else
        brake_request = 0;
    end
end
