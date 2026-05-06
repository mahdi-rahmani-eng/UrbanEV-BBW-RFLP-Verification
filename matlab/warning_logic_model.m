function warning_state = warning_logic_model(target_distance_m, stopping_distance_m, ttc_s)
% WARNING_LOGIC_MODEL
% Classifies risk into SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE.
%
% Priority:
% SAFE < CAUTION < WARNING < EMERGENCY_BRAKE
%
% The most severe triggered state is selected.

    warning_state = strings(size(target_distance_m));

    for i = 1:numel(target_distance_m)

        if target_distance_m(i) <= 0.8 * stopping_distance_m(i) || ttc_s(i) <= 1.5
            warning_state(i) = "EMERGENCY_BRAKE";

        elseif target_distance_m(i) <= stopping_distance_m(i) || ttc_s(i) <= 2.5
            warning_state(i) = "WARNING";

        elseif target_distance_m(i) <= 1.3 * stopping_distance_m(i) || ttc_s(i) <= 4.0
            warning_state(i) = "CAUTION";

        else
            warning_state(i) = "SAFE";
        end
    end
end