function concept_results = concept_selection_model(concepts)
% CONCEPT_SELECTION_MODEL
% Selects the best low-speed urban EV concept using normalized scores.
%
% Most scores are calculated from model outputs.
% Feasibility score is a qualitative engineering judgement from CSV.

    range_results = range_estimation_model(concepts);

    wet_mu = 0.45;
    delay_s = 0.20;

    braking_distance_m = braking_distance_model( ...
        concepts.max_speed_kmh, ...
        wet_mu .* ones(height(concepts), 1), ...
        delay_s .* ones(height(concepts), 1));

    target_motor_kw = 12;

    range_score = 10 .* range_results.estimated_range_km ./ max(range_results.estimated_range_km);
    braking_score = 10 .* min(braking_distance_m) ./ braking_distance_m;
    mass_score = 10 .* min(concepts.mass_kg) ./ concepts.mass_kg;

    motor_adequacy_score = 10 .* ...
        (1 - abs(concepts.motor_kw - target_motor_kw) ./ target_motor_kw);

    motor_adequacy_score = max(0, motor_adequacy_score);

    feasibility_score = concepts.feasibility_score;

    w_range = 0.30;
w_braking = 0.20;
w_mass = 0.10;
w_motor = 0.20;
w_feasibility = 0.20;

    total_score = ...
        w_range .* range_score + ...
        w_braking .* braking_score + ...
        w_mass .* mass_score + ...
        w_motor .* motor_adequacy_score + ...
        w_feasibility .* feasibility_score;

    decision = strings(height(concepts), 1);
    decision(:) = "Not selected";

    [~, best_idx] = max(total_score);
    decision(best_idx) = "Selected";

    concept_results = range_results;
    concept_results.wet_braking_distance_m = braking_distance_m;
    concept_results.range_score = range_score;
    concept_results.braking_score = braking_score;
    concept_results.mass_score = mass_score;
    concept_results.motor_adequacy_score = motor_adequacy_score;
    concept_results.total_score = total_score;
    concept_results.decision = decision;
end