function scenario_results = bbw_emergency_braking_controller(scenarios)
% BBW_EMERGENCY_BRAKING_CONTROLLER
% Concept-level emergency brake-request logic.
%
% This is not a production brake-by-wire controller.
% It combines stopping distance, TTC, warning state, and brake request.

    stopping_distance_m = braking_distance_model( ...
        scenarios.ego_speed_kmh, ...
        scenarios.mu, ...
        scenarios.actuator_delay_s);

    ttc_s = ttc_model( ...
        scenarios.target_distance_m, ...
        scenarios.relative_speed_kmh);

    warning_state = warning_logic_model( ...
        scenarios.target_distance_m, ...
        stopping_distance_m, ...
        ttc_s);

    brake_request = double(warning_state == "EMERGENCY_BRAKE");

    expected_state = string(scenarios.expected_state);
    state_match = warning_state == expected_state;

    verification_result = strings(height(scenarios), 1);
    verification_comment = strings(height(scenarios), 1);

    for i = 1:height(scenarios)
        if state_match(i)
            verification_result(i) = "Pass";
            verification_comment(i) = "Warning state follows the defined threshold logic.";
        else
            verification_result(i) = "Check";
            verification_comment(i) = "Warning state differs from expected label; review scenario assumptions or thresholds.";
        end
    end

    scenario_results = scenarios;
    scenario_results.stopping_distance_m = stopping_distance_m;
    scenario_results.ttc_s = ttc_s;
    scenario_results.warning_state = warning_state;
    scenario_results.brake_request = brake_request;
    scenario_results.verification_result = verification_result;
    scenario_results.verification_comment = verification_comment;
end