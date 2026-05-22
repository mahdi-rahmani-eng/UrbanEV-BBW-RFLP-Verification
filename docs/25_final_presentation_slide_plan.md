# Final Presentation Slide Plan

## Purpose
This document provides a slide-by-slide structure for presenting the UrbanEV-BBW-RFLP-Verification project according to the course mandatory-content workflow.

## Slide 1 - Title
Title: Lightweight MBSE/RFLP and Simulink Verification of Emergency Brake-Request Logic for a Low-Speed Urban EV

Key message:
This project presents a concept-level requirements-driven workflow, not a production brake-by-wire system.

## Slide 2 - Starting from Needs
Explain the initial need: a low-speed urban EV should detect forward risk and generate an emergency brake request under critical conditions.

Mention that the project focuses on concept-level verification of the logic.

## Slide 3 - Project Scope and Limitations
Explain what the project does and does not claim.

Does:
- MBSE/RFLP-style decomposition
- MATLAB scenario verification
- Simulink functional model
- Test Manager execution

Does not:
- production brake-by-wire validation
- real sensor fusion
- HIL/SIL validation
- ISO 26262 compliance

## Slide 4 - Black Box Analysis
Show the external view of the system.

Inputs:
- ego_speed_kmh
- target_distance_m
- relative_speed_kmh
- road friction coefficient
- actuator delay

Outputs:
- warning_state_code
- brake_request
- state_match

## Slide 5 - Requirements and Scenario Catalogue
Show that the system behaviour is defined through requirements and six scenarios.

Scenarios:
- SCN-01 Normal following
- SCN-02 Close but not critical target
- SCN-03 High closing risk
- SCN-04 Wet-road warning case
- SCN-05 Sudden stationary obstacle
- SCN-06 Delay-sensitive wet case

## Slide 6 - Concept Selection
Explain that the project includes concept and actuator-selection logic to support engineering decisions before detailed modeling.

Key point:
The selected concept is used as the basis for the verification workflow.

## Slide 7 - White Box Analysis
Explain that the system is opened internally and decomposed into functional blocks.

Functional chain:
Scenario Definition → Risk Estimation → Warning & Brake Decision → Requirement Verification → Results & Logging

## Slide 8 - Simulink Functional Architecture
Show the main Simulink screenshot:
`figures/simulink_presentation_model.png`

Explain the five subsystems:
1. Scenario Definition
2. Risk Estimation
3. Warning and Brake Decision
4. Requirement Verification
5. Results and Logging

## Slide 9 - Risk Estimation
Explain the two risk indicators:

Stopping distance:
d_stop = v × delay + v² / (2 × μ × g)

Time-to-collision:
TTC = target_distance / relative_speed

## Slide 10 - Warning and Brake Decision
Explain the state codes:

| Code | State |
|---:|---|
| 0 | SAFE |
| 1 | CAUTION |
| 2 | WARNING |
| 3 | EMERGENCY_BRAKE |

Explain that brake_request = 1 only when warning_state_code = 3.

## Slide 11 - Requirement Verification
Explain the verification logic:

`state_match = 1 if actual_warning_state_code == expected_state_code`

This checks whether the model output matches the expected scenario behaviour.

## Slide 12 - Scenario-Based Testing Results
Show the results from:
`results/simulink_test_validation_results.csv`

Key message:
All six scenarios were tested against their expected warning states.

## Slide 13 - Simulink Test Manager Results
Show the official Test Manager evidence:
`UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx`

Key message:
The official Test Manager suite executed six scenario tests successfully.

## Slide 14 - Requirement-to-Test Traceability
Show that each scenario-based test is linked to a verification objective and Simulink subsystem.

Evidence:
`results/simulink_requirement_test_traceability.csv`
`docs/17_simulink_requirement_test_traceability.md`

## Slide 15 - Requirements Not Fully Tested
Explain that not all real-world engineering aspects are tested because the project is concept-level.

Not tested:
- real brake actuator hardware
- real vehicle dynamics
- real sensor fusion
- HIL/SIL
- ISO 26262 compliance
- production brake control

## Slide 16 - Before and After Testing
Before testing:
The project had a Simulink demonstration model.

After testing:
The project has scenario-based verification, PASS/FAIL evidence, Test Manager results, and traceability.

## Slide 17 - Final Alignment with Course Workflow
Explain that the project follows the course workflow:

Needs → Black Box → Requirements → Concept Selection → White Box → Functional Architecture → Traceability → Testing and Validation → Test Manager Results → Before/After Testing

## Slide 18 - Final Conclusion
Final message:
The project demonstrates a lightweight MBSE/RFLP and MATLAB/Simulink workflow for concept-level verification of emergency brake-request logic in a low-speed urban EV.

It is technically useful, presentation-ready, and scope-safe.
