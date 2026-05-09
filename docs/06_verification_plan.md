# 06 - Verification Plan

## Purpose

This document defines how the main project requirements are verified using concept-level MATLAB models, scenario-based tests, design reviews, and traceability checks.

The verification plan is intentionally lightweight and suitable for a university-level concept-design project.

It does not claim Simulink Test execution, hardware-in-the-loop validation, software-in-the-loop validation, ISO 26262 verification, or production brake-by-wire validation.

---

## Verification Approach

| Verification Method | Meaning in this Project |
|---|---|
| MATLAB scenario simulation | MATLAB scripts execute predefined scenarios and calculate outputs. |
| Logical assessment | The output is checked against a defined logical rule. |
| Comparison assessment | Two values are compared, such as stopping distance with and without actuator delay. |
| Design review | A documented engineering judgement is used, for example in actuator concept selection. |
| Traceability review | Requirements are checked against functions, logical blocks, physical elements, and scenarios. |

---

## Verification Plan File

The detailed verification plan is stored in:

`data/verification_plan.csv`

---

## Verification Items

| Verification ID | Requirement | Scenario/Test | Assessment Type | Pass Rule | Evidence |
|---|---|---|---|---|---|
| VFY-01 | REQ-VEH-01 | Concept comparison | Design review | Selected concept remains within low-speed urban envelope not exceeding 50 km/h. | concept_selection_results.csv |
| VFY-02 | REQ-VEH-02 | Range model | Logical assessment | Estimated range is calculated and reported for each vehicle concept. | concept_selection_results.csv |
| VFY-03 | REQ-VEH-03 | Concept scoring | Logical assessment | Total weighted score is calculated for each concept and one concept is selected. | concept_selection_results.csv |
| VFY-04 | REQ-BBW-01 | SCN-01 to SCN-06 | Logical assessment | Stopping distance is calculated and positive for each scenario. | scenario_verification_results.csv |
| VFY-05 | REQ-BBW-02 | SCN-01 to SCN-06 | Logical assessment | TTC is calculated when relative speed is greater than zero. | scenario_verification_results.csv |
| VFY-06 | REQ-BBW-03 | SCN-01 to SCN-06 | Logical assessment | Warning state follows the defined stopping-distance and TTC threshold table. | scenario_verification_results.csv |
| VFY-07 | REQ-BBW-04 | SCN-05 | Trigger-response inspired assessment | If warning_state is EMERGENCY_BRAKE, brake_request equals 1. | scenario_verification_results.csv |
| VFY-08 | REQ-BBW-05 | SCN-06 | Comparison assessment | Stopping distance with actuator delay is greater than stopping distance without actuator delay. | scenario_verification_results.csv |
| VFY-09 | REQ-BBW-06 | Actuator concept selection | Design review | Actuator candidate is selected using documented weighted criteria. | actuator_selection_results.csv |
| VFY-10 | REQ-TRACE-01 | Traceability review | Traceability assessment | Each major requirement is linked to at least one function, logical block, physical element, and verification item. | traceability_matrix.csv |

---

## Main Pass/Fail Rules

| Rule ID | Rule |
|---|---|
| RULE-01 | Stopping distance shall be positive for all scenarios. |
| RULE-02 | TTC shall be calculated when relative speed is greater than zero. |
| RULE-03 | Warning state shall follow the defined TTC and stopping-distance thresholds. |
| RULE-04 | Brake request shall be 1 only when the warning state is EMERGENCY_BRAKE. |
| RULE-05 | Stopping distance with actuator delay shall be greater than stopping distance without actuator delay. |
| RULE-06 | Each major requirement shall be linked to at least one verification item. |

---

## Verification Evidence

The expected verification evidence is stored in the results folder after running:

addpath('matlab')
run_all

Expected output files include:

- results/concept_selection_results.csv
- results/scenario_verification_results.csv
- results/actuator_selection_results.csv
- results/traceability_matrix.csv
- results/verification_summary.md

---

## Scope Note

This verification plan is script-based and concept-level.

It is not a substitute for industrial validation, certified brake-by-wire verification, Simulink Test execution, HIL/SIL testing, or functional-safety assessment.

---

## Conclusion

The verification plan strengthens the project by linking each major requirement to a scenario, assessment type, pass rule, and evidence file.

This makes the project more traceable, testable, and aligned with a lightweight MBSE/RFLP workflow.
