# Simulink Testing and Validation

## Purpose
This document reports the scenario-based testing and validation results for the concept-level Simulink model of the emergency brake-request logic.

The testing phase checks whether the Simulink model output satisfies the expected warning-state results defined in the project scenarios.

## Model Under Test
`models/urban_ev_bbw_warning_logic_test_validation.slx`

## Testing Logic
For each scenario, the model receives the scenario inputs, computes stopping distance and TTC, classifies the warning state, generates the brake request, and compares the actual warning state with the expected warning state.

The test is considered passed when:

`actual_warning_state_code == expected_state_code`

## State Coding

| Code | State |
|---:|---|
| 0 | SAFE |
| 1 | CAUTION |
| 2 | WARNING |
| 3 | EMERGENCY_BRAKE |

## Test Results

| Scenario | Description | Expected State | Expected Code | Actual Code | Brake Request | State Match | Result |
|---|---|---|---:|---:|---:|---:|---|
| SCN-01 | Normal following | SAFE | 0 | 0 | 0 | 1 | PASS |
| SCN-02 | Close but not critical target | CAUTION | 1 | 1 | 0 | 1 | PASS |
| SCN-03 | High closing risk | WARNING | 2 | 2 | 0 | 1 | PASS |
| SCN-04 | Wet-road warning case | WARNING | 2 | 2 | 0 | 1 | PASS |
| SCN-05 | Sudden stationary obstacle | EMERGENCY_BRAKE | 3 | 3 | 1 | 1 | PASS |
| SCN-06 | Delay-sensitive wet case | WARNING | 2 | 2 | 0 | 1 | PASS |

## Summary

| Metric | Value |
|---|---:|
| Number of tested scenarios | 6 |
| Passed scenarios | 6 |
| Failed scenarios | 0 |

## Interpretation
The scenario-based Simulink testing confirms whether the warning-state logic behaves as expected across the defined scenario catalogue.

If all scenarios pass, the model provides stronger evidence that the concept-level emergency brake-request logic is consistent with the expected scenario behaviour.

## Scope Limitation
This testing activity is scenario-based and concept-level. It does not represent certified safety validation, hardware-in-the-loop testing, production brake-by-wire validation, or ISO 26262 compliance.

## Requirements Not Fully Tested

The current Simulink testing focuses on warning-state classification and emergency brake-request logic. Requirements related to real sensors, production hardware, actuator physics, fault tolerance, safety formal approval, and HIL/SIL validation are outside the current project scope and are therefore documented as limitations rather than tested claims.
