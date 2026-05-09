# 16 - Scenario Taxonomy and Parameterized Scenario Space

## Purpose

This document defines the scenario taxonomy used to extend the project beyond six manually defined scenarios.

The goal is to create an ODD-constrained parameterized scenario space for concept-level MATLAB verification.

This is a lightweight academic scenario taxonomy. It is not a formal ASAM OpenSCENARIO file, ISO 34502 compliance document, or industrial scenario database.

---

## Why Scenario Taxonomy Is Added

The original project includes six representative scenarios.

These scenarios are useful, but they are manually defined.

The scenario taxonomy improves the project by defining scenario families and parameters that can generate many repeatable dry-road, wet-road, and delay-sensitive cases.

---

## Scenario Parameters

The parameterized scenario space is generated using the following parameters:

| Parameter | Meaning | Example Values |
|---|---|---|
| ego_speed_kmh | Ego vehicle speed | 10, 20, 30, 40, 50 km/h |
| road_condition | Road surface condition | dry, wet |
| friction_mu | Road friction coefficient | dry = 0.75, wet = 0.45 |
| actuator_delay_s | Controller and actuator delay assumption | 0.10, 0.20, 0.30 s |
| scenario_family | Type of risk situation | NORMAL, CLOSE, WARNING, EMERGENCY |
| target_distance_m | Distance to lead vehicle or obstacle | Generated from stopping-distance logic |
| relative_speed_kmh | Closing speed between ego and target | Generated based on scenario family |
| target_type | Type of target | lead_vehicle or stationary_obstacle |

---

## Scenario Families

| Scenario Family | Purpose | Expected Behaviour |
|---|---|---|
| NORMAL_FOLLOWING | Safe following condition | SAFE |
| CLOSE_TARGET | Close but not critical condition | CAUTION |
| HIGH_CLOSING_RISK | High-risk condition | WARNING |
| SUDDEN_OBSTACLE | Critical obstacle condition | EMERGENCY_BRAKE |

---

## ODD Constraints

The parameterized scenarios remain inside the defined ODD:

- low-speed urban or campus context;
- ego speed from 0 to 50 km/h;
- dry or wet asphalt;
- straight-road assumption;
- lead vehicle or stationary obstacle;
- clear visibility assumed;
- simplified scenario-level inputs only.

Out-of-ODD cases such as highway operation, pedestrians, cyclists, snow, ice, fog, curved roads, and real sensor perception are not generated in this version.

---

## Generated Scenario Space

The MATLAB script:

`matlab/generate_parameterized_scenarios.m`

generates:

`data/parameterized_scenarios.csv`

and:

`figures/scenario_parameter_space.png`

The generated scenarios are not intended to replace real-world validation.

They provide a broader concept-level verification set for the warning and brake-request logic.

---

## Link to Verification

The generated scenario file can be used by a batch verification script to evaluate:

- stopping distance;
- TTC;
- warning state;
- brake request;
- pass/fail result;
- state distribution;
- dry versus wet behaviour;
- actuator-delay sensitivity.

---

## Scope Note

This scenario taxonomy is inspired by modern scenario-based verification practices, but it remains lightweight.

It does not claim ISO 34502 compliance, ASAM OpenSCENARIO implementation, ASAM OpenODD implementation, SOTIF compliance, or production AEB validation.

---

## Conclusion

The scenario taxonomy strengthens the project by moving from a small manual test set toward an ODD-constrained parameterized scenario space.

This makes the project more suitable for ADAS-oriented internship discussion while keeping it realistic for a university-level MATLAB project.
