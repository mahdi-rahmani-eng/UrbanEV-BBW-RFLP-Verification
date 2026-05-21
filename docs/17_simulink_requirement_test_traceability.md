# Simulink Requirement-to-Test Traceability

## Purpose
This document links the Simulink scenario-based tests to their verification objectives and related Simulink subsystems.

The purpose is to make the testing activity traceable, instead of presenting simulation results as isolated outputs.

## Traceability Table

| Test ID | Scenario | Verification Objective | Related Subsystem | Expected State | Actual Code | Brake Request | Result |
|---|---|---|---|---|---:|---:|---|
| TEST-SIM-01 | SCN-01 | SAFE-state classification | Warning and Brake Decision | SAFE | 0 | 0 | PASS |
| TEST-SIM-02 | SCN-02 | CAUTION-state classification | Warning and Brake Decision | CAUTION | 1 | 0 | PASS |
| TEST-SIM-03 | SCN-03 | WARNING-state classification | Warning and Brake Decision | WARNING | 2 | 0 | PASS |
| TEST-SIM-04 | SCN-04 | Wet-road risk classification | Risk Estimation / Warning Decision | WARNING | 2 | 0 | PASS |
| TEST-SIM-05 | SCN-05 | EMERGENCY_BRAKE classification and brake request | Warning and Brake Decision / Requirement Verification | EMERGENCY_BRAKE | 3 | 1 | PASS |
| TEST-SIM-06 | SCN-06 | Delay-sensitive warning classification | Risk Estimation / Warning Decision | WARNING | 2 | 0 | PASS |

## Interpretation
The traceability table shows how each scenario contributes to verification of the warning-state and brake-request logic.

Together with the Simulink testing results, this provides stronger evidence that the model behaviour is consistent with the expected scenario catalogue.

## Scope Limitation
This traceability is limited to concept-level Simulink verification. It does not claim production-level safety validation, hardware validation, certified brake-by-wire design, or ISO 26262 compliance.
