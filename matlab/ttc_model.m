function ttc_s = ttc_model(target_distance_m, relative_speed_kmh)
% TTC_MODEL
% Calculates Time To Collision using target distance and relative speed.
%
% Formula:
%   TTC = target_distance / relative_speed
%
% Inputs:
%   target_distance_m: distance to target [m]
%   relative_speed_kmh: closing speed [km/h]
%
% Output:
%   ttc_s: time to collision [s]
%
% Note:
%   If relative speed is zero or negative, TTC is set to Inf.

    relative_speed_mps = relative_speed_kmh ./ 3.6;

    ttc_s = zeros(size(target_distance_m));

    for i = 1:numel(target_distance_m)
        if relative_speed_mps(i) <= 0
            ttc_s(i) = Inf;
        else
            ttc_s(i) = target_distance_m(i) ./ relative_speed_mps(i);
        end
    end
end