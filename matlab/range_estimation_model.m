function range_results = range_estimation_model(concepts)
% RANGE_ESTIMATION_MODEL
% Simplified physics-based range estimation for low-speed urban EV concepts.
%
% This is a concept-level model, not a high-fidelity vehicle energy model.
%
% Inputs:
%   concepts: table containing vehicle concept parameters
%
% Outputs:
%   range_results: table including estimated range and energy consumption

    % Constants and assumptions
    g = 9.81;                    % gravity [m/s^2]
    rho = 1.225;                 % air density [kg/m^3]
    eta_drivetrain = 0.85;       % drivetrain efficiency [-]
    usable_battery_factor = 0.90;
    urban_factor = 1.25;         % simplified stop-go urban correction factor [-]
    average_speed_kmh = 30;      % low-speed urban average speed [km/h]
    average_speed_mps = average_speed_kmh / 3.6;
    auxiliary_power_kw = 0.4;    % simplified auxiliary electrical load [kW]

    % Rolling and aerodynamic forces
    F_roll = concepts.mass_kg .* g .* concepts.Crr;
    F_aero = 0.5 .* rho .* concepts.CdA .* average_speed_mps.^2;

    % Power demand
    P_wheel_kw = ((F_roll + F_aero) .* average_speed_mps) ./ 1000;
    P_battery_kw = P_wheel_kw ./ eta_drivetrain + auxiliary_power_kw;

    % Energy consumption and range
    energy_per_km_kwh = urban_factor .* P_battery_kw ./ average_speed_kmh;
    usable_battery_kwh = concepts.battery_kwh .* usable_battery_factor;
    estimated_range_km = usable_battery_kwh ./ energy_per_km_kwh;

    % Output table
    range_results = concepts;
    range_results.estimated_range_km = estimated_range_km;
    range_results.energy_per_km_kwh = energy_per_km_kwh;
    range_results.P_battery_kw = P_battery_kw;
end
