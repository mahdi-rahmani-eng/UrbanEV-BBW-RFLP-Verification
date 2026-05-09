%% scenario_batch_verification.m
% Batch verification for ODD-constrained parameterized scenarios.
% This script is concept-level and uses simplified MATLAB verification logic.

clear; clc;

root = fileparts(fileparts(mfilename('fullpath')));
dataFolder = fullfile(root, 'data');
resultsFolder = fullfile(root, 'results');
figFolder = fullfile(root, 'figures');

if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end

if ~exist(figFolder, 'dir')
    mkdir(figFolder);
end

inFile = fullfile(dataFolder, 'parameterized_scenarios.csv');

if ~isfile(inFile)
    error('parameterized_scenarios.csv not found. Run generate_parameterized_scenarios first.');
end

T = readtable(inFile);

n = height(T);
stopping_distance_m = zeros(n,1);
ttc_s = zeros(n,1);
calculated_state = strings(n,1);
brake_request = zeros(n,1);
verification_result = strings(n,1);
verification_comment = strings(n,1);

for i = 1:n
    speed_kmh = T.ego_speed_kmh(i);
    target_distance_m = T.target_distance_m(i);
    relative_speed_kmh = T.relative_speed_kmh(i);
    mu = T.mu(i);
    delay_s = T.actuator_delay_s(i);

    [d_stop, ttc, state, request] = local_verify_logic(speed_kmh, target_distance_m, relative_speed_kmh, mu, delay_s);

    stopping_distance_m(i) = round(d_stop, 3);
    ttc_s(i) = round(ttc, 3);
    calculated_state(i) = state;
    brake_request(i) = request;

    expected = string(T.expected_state(i));

    if calculated_state(i) == expected
        verification_result(i) = 'Pass';
        verification_comment(i) = 'Calculated state matches expected state.';
    else
        verification_result(i) = 'Fail';
        verification_comment(i) = 'Calculated state does not match expected state.';
    end
end

Result = T;
Result.stopping_distance_m = stopping_distance_m;
Result.ttc_s = ttc_s;
Result.calculated_state = calculated_state;
Result.brake_request = brake_request;
Result.verification_result = verification_result;
Result.verification_comment = verification_comment;

outFile = fullfile(resultsFolder, 'parameterized_scenario_results.csv');
writetable(Result, outFile);

numPass = sum(verification_result == 'Pass');
numFail = sum(verification_result == 'Fail');
passRate = 100 * numPass / n;

fprintf('Parameterized scenario batch verification completed.\\n');
fprintf('Total scenarios: %d\\n', n);
fprintf('Pass: %d\\n', numPass);
fprintf('Fail: %d\\n', numFail);
fprintf('Pass rate: %.2f %%\\n', passRate);
fprintf('Saved results to: %s\\n', outFile);

% Figure 1: pass/fail summary
figure;
bar([numPass numFail]);
set(gca, 'XTickLabel', {'Pass','Fail'});
ylabel('Number of Scenarios');
title('Parameterized Scenario Verification Summary');
grid on;
figFile1 = fullfile(figFolder, 'parameterized_verification_summary.png');
saveas(gcf, figFile1);
fprintf('Saved figure to: %s\\n', figFile1);

% Figure 2: warning-state distribution
states = categorical(calculated_state);
stateCounts = countcats(states);
stateNames = categories(states);

figure;
bar(stateCounts);
set(gca, 'XTickLabel', stateNames);
ylabel('Number of Scenarios');
title('Calculated Warning State Distribution');
grid on;
figFile2 = fullfile(figFolder, 'parameterized_warning_state_distribution.png');
saveas(gcf, figFile2);
fprintf('Saved figure to: %s\\n', figFile2);

function [d_stop, ttc, state, brake_request] = local_verify_logic(speed_kmh, target_distance_m, relative_speed_kmh, mu, delay_s)
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
