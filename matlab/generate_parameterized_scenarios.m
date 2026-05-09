%% generate_parameterized_scenarios.m
% Generate an ODD-constrained parameterized scenario set.
% This script is concept-level and does not implement ASAM OpenSCENARIO.

clear; clc;

root = fileparts(fileparts(mfilename('fullpath')));
dataFolder = fullfile(root, 'data');
figFolder  = fullfile(root, 'figures');

if ~exist(dataFolder, 'dir')
    mkdir(dataFolder);
end

if ~exist(figFolder, 'dir')
    mkdir(figFolder);
end

g = 9.81;

speedLevels_kmh = [10 20 30 40 50];
roadConditions = {'dry','wet'};
delayLevels_s = [0.10 0.20 0.30];
scenarioFamilies = {'NORMAL_FOLLOWING','CLOSE_TARGET','HIGH_CLOSING_RISK','SUDDEN_OBSTACLE'};

scenario_id = strings(0,1);
scenario_family = strings(0,1);
ego_speed_kmh = [];
target_distance_m = [];
relative_speed_kmh = [];
road_condition = strings(0,1);
mu_values = [];
actuator_delay_s = [];
target_type = strings(0,1);
expected_state = strings(0,1);
odd_status = strings(0,1);

counter = 1;

for s = 1:numel(speedLevels_kmh)
    for r = 1:numel(roadConditions)
        for d = 1:numel(delayLevels_s)
            for f = 1:numel(scenarioFamilies)

                speed_kmh = speedLevels_kmh(s);
                v = speed_kmh / 3.6;
                delay_s = delayLevels_s(d);

                if strcmp(roadConditions{r}, 'dry')
                    mu = 0.75;
                else
                    mu = 0.45;
                end

                d_stop = v * delay_s + (v^2) / (2 * mu * g);
                family = scenarioFamilies{f};

                switch family
                    case 'NORMAL_FOLLOWING'
                        dist_m = max(25, 2.5 * d_stop);
                        rel_kmh = 5;
                        tgt_type = 'lead_vehicle';

                    case 'CLOSE_TARGET'
                        dist_m = max(5, 1.15 * d_stop);
                        rel_kmh = max(5, min(20, dist_m));
                        tgt_type = 'lead_vehicle';

                    case 'HIGH_CLOSING_RISK'
                        dist_m = max(4, 0.95 * d_stop);
                        rel_kmh = max(8, min(35, (dist_m / 2.0) * 3.6));
                        tgt_type = 'lead_vehicle';

                    case 'SUDDEN_OBSTACLE'
                        dist_m = max(3, 0.70 * d_stop);
                        rel_kmh = speed_kmh;
                        tgt_type = 'stationary_obstacle';
                end

                state = local_warning_state(speed_kmh, dist_m, rel_kmh, mu, delay_s);

                scenario_id(end+1,1) = sprintf('P-SCN-%03d', counter);
                scenario_family(end+1,1) = string(family);
                ego_speed_kmh(end+1,1) = speed_kmh;
                target_distance_m(end+1,1) = round(dist_m, 3);
                relative_speed_kmh(end+1,1) = round(rel_kmh, 3);
                road_condition(end+1,1) = string(roadConditions{r});
                mu_values(end+1,1) = mu;
                actuator_delay_s(end+1,1) = delay_s;
                target_type(end+1,1) = string(tgt_type);
                expected_state(end+1,1) = state;
                odd_status(end+1,1) = 'inside_ODD';

                counter = counter + 1;
            end
        end
    end
end

T = table(scenario_id, scenario_family, ego_speed_kmh, target_distance_m, relative_speed_kmh, road_condition, mu_values, actuator_delay_s, target_type, expected_state, odd_status);
T.Properties.VariableNames = {'scenario_id','scenario_family','ego_speed_kmh','target_distance_m','relative_speed_kmh','road_condition','mu','actuator_delay_s','target_type','expected_state','odd_status'};

outFile = fullfile(dataFolder, 'parameterized_scenarios.csv');
writetable(T, outFile);

fprintf('Generated %d parameterized scenarios.\\n', height(T));
fprintf('Saved to: %s\\n', outFile);

% Simple parameter-space figure
figure;
states = categorical(T.expected_state);
scatter(T.ego_speed_kmh, T.target_distance_m, 45, double(states), 'filled');
grid on;
xlabel('Ego Speed [km/h]');
ylabel('Target Distance [m]');
title('Parameterized Scenario Space');
cb = colorbar;
cb.Label.String = 'Warning State Category';

figFile = fullfile(figFolder, 'scenario_parameter_space.png');
saveas(gcf, figFile);
fprintf('Saved figure to: %s\\n', figFile);

function state = local_warning_state(speed_kmh, target_distance_m, relative_speed_kmh, mu, delay_s)
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
end
