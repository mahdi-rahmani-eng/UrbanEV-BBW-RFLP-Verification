function stopping_distance_m = braking_distance_model(speed_kmh, mu, delay_s)
% BRAKING_DISTANCE_MODEL
% Calculates simplified stopping distance with controller/actuator delay.
%
% Model:
%   d_stop = v * t_delay + v^2 / (2 * mu * g)
%
% Inputs:
%   speed_kmh: vehicle speed [km/h]
%   mu: road friction coefficient [-]
%   delay_s: controller + actuator delay [s]
%
% Output:
%   stopping_distance_m: stopping distance [m]
%
% Note:
%   This is a concept-level stopping-distance model, not a validated
%   production braking model.

    g = 9.81;

    speed_mps = speed_kmh ./ 3.6;

    delay_distance_m = speed_mps .* delay_s;

    braking_distance_m = speed_mps.^2 ./ (2 .* mu .* g);

    stopping_distance_m = delay_distance_m + braking_distance_m;
end