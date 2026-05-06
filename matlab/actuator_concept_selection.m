function actuator_results = actuator_concept_selection(actuators)
% ACTUATOR_CONCEPT_SELECTION
% Selects a concept-level actuator candidate using weighted criteria.
%
% This is not a detailed production actuator design.

    w_feasibility = 0.30;
    w_response_time = 0.25;
    w_integration = 0.20;
    w_cost_complexity = 0.15;
    w_low_speed_ev = 0.10;

    total_score = ...
        w_feasibility .* actuators.feasibility + ...
        w_response_time .* actuators.response_time + ...
        w_integration .* actuators.integration_simplicity + ...
        w_cost_complexity .* actuators.cost_complexity + ...
        w_low_speed_ev .* actuators.low_speed_ev_suitability;

    decision = strings(height(actuators), 1);
    decision(:) = "Not selected";

    [~, best_idx] = max(total_score);
    decision(best_idx) = "Selected";

    actuator_results = actuators;
    actuator_results.total_score = total_score;
    actuator_results.decision = decision;
end