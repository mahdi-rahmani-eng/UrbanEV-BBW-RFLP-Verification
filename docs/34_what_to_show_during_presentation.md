# What to Show During Presentation

## Purpose
This document explains exactly which project artifacts should be shown during the final presentation and in what order.

## Presentation Flow
The presentation should follow the course workflow:

`Needs → Black Box Analysis → Requirements → Concept Selection → White Box Analysis → Functional Architecture → Testing and Validation → Test Manager Results → Final Limitations`

## 1. Start with the README

Open:
`README.md`

What to say:
`This repository contains a lightweight MBSE/RFLP and MATLAB/Simulink verification workflow for concept-level emergency brake-request logic in a low-speed urban EV.`

Why show it:
The README gives the evaluator the global structure of the project.

## 2. Show Requirements and Scenarios

Open:
`data/requirements.csv`
`data/scenarios.csv`

What to say:
`The system behaviour is defined through requirements and six verification scenarios, from normal following to sudden stationary obstacle.`

Why show it:
This demonstrates the Black Box / requirements basis of the project.

## 3. Show the Simulink Functional Architecture

Open:
`models/urban_ev_bbw_warning_logic_final_presentation.slx`

Also show:
`figures/simulink_presentation_model.png`

What to say:
`The system is decomposed into five functional blocks: Scenario Definition, Risk Estimation, Warning and Brake Decision, Requirement Verification, and Results and Logging.`

Why show it:
This is the White Box / Functional Architecture evidence.

## 4. Show Risk Estimation

Open subsystem:
`02_Risk_Estimation`

What to say:
`This subsystem computes stopping distance and time-to-collision. These values are used as risk indicators before the warning-state decision.`

Key equations:
`d_stop = v × delay + v² / (2 × μ × g)`
`TTC = target_distance / relative_speed`

## 5. Show Warning and Brake Decision

Open subsystem:
`03_Warning_and_Brake_Decision`

What to say:
`The model classifies the scenario into SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE. The brake request becomes 1 only in the EMERGENCY_BRAKE state.`

State codes:

| Code | State |
|---:|---|
| 0 | SAFE |
| 1 | CAUTION |
| 2 | WARNING |
| 3 | EMERGENCY_BRAKE |

## 6. Show Requirement Verification

Open subsystem:
`04_Requirement_Verification`

What to say:
`This subsystem compares the actual warning state with the expected warning state. If they match, state_match becomes 1.`

## 7. Show Scenario-Based Test Results

Open:
`results/simulink_test_validation_results.csv`

What to say:
`All six scenarios were tested. The model output was compared with the expected warning state for each scenario.`

Why show it:
This is the first testing and validation evidence.

## 8. Show Requirement-to-Test Traceability

Open:
`results/simulink_requirement_test_traceability.csv`
`docs/17_simulink_requirement_test_traceability.md`

What to say:
`Each scenario-based test is linked to a verification objective and to the related Simulink subsystem.`

Why show it:
This proves that testing is traceable, not random.

## 9. Show Simulink Test Manager Results

Open:
`UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx`

What to say:
`The official Simulink Test Manager suite includes all six scenarios. The result showed six successful scenario tests.`

Why show it:
This corresponds to the Test Manager Results section in the course example.

## 10. Show Requirements Not Fully Tested

Open:
`docs/21_requirements_not_fully_tested_justification.md`

What to say:
`Some aspects are outside the concept-level scope, such as real brake hardware, real sensor fusion, HIL/SIL testing, and ISO 26262 compliance. These are documented as limitations.`

Why show it:
This keeps the project scope-safe and avoids overclaiming.

## 11. Show Before/After Testing

Open:
`docs/18_before_after_simulink_testing_phase.md`

What to say:
`Before testing, the project had a Simulink demonstration model. After testing, it had scenario-based verification, PASS/FAIL evidence, Test Manager results, and traceability.`

## 12. End with Final Claim

Say:
`This project demonstrates a lightweight MBSE/RFLP and MATLAB/Simulink verification workflow for concept-level emergency brake-request logic in a low-speed urban EV.`

Then add:
`It does not claim production brake-by-wire validation, certified safety compliance, real sensor fusion, HIL/SIL testing, or ISO 26262 compliance.`

## Recommended Files to Keep Open Before Presentation

| Order | File | Purpose |
|---:|---|---|
| 1 | `README.md` | General overview |
| 2 | `data/scenarios.csv` | Scenario catalogue |
| 3 | `models/urban_ev_bbw_warning_logic_final_presentation.slx` | Simulink architecture |
| 4 | `results/simulink_test_validation_results.csv` | Scenario testing result |
| 5 | `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Official Test Manager result |
| 6 | `docs/21_requirements_not_fully_tested_justification.md` | Scope limitation |
| 7 | `docs/18_before_after_simulink_testing_phase.md` | Before/after testing explanation |
