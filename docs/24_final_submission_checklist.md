# Final Submission Checklist

## Purpose
This document provides a final checklist of the project artifacts prepared for presentation and submission.

It helps the evaluator quickly locate the evidence for each major engineering step: needs, black-box analysis, requirements, concept selection, white-box analysis, Simulink modeling, testing, validation, Test Manager results, and limitations.

## Main Project Repository
`UrbanEV-BBW-RFLP-Verification`

## Core Files

| Item | File / Folder | Purpose |
|---|---|---|
| Main project overview | `README.md` | Provides the complete project summary and navigation |
| Requirements | `data/requirements.csv` | Defines the main system requirements |
| Scenario catalogue | `data/scenarios.csv` | Defines SCN-01 to SCN-06 verification scenarios |
| MATLAB models | `matlab/` | Contains concept-level calculation and verification scripts |
| Results | `results/` | Stores CSV outputs and verification results |
| Figures | `figures/` | Stores project diagrams and model screenshots |
| Simulink models | `models/` | Contains final Simulink verification models |

## Course-Workflow Evidence

| Course Workflow Step | Project Evidence | Status |
|---|---|---|
| Starting from Needs | `README.md`, `docs/01_project_overview.md` | Covered |
| Black Box Analysis | Requirements, scenarios, ODD/scope definition | Covered |
| Stakeholder/System Requirements | `data/requirements.csv`, `docs/03_requirements_table.md` | Covered |
| Concept Generation / Selection | Vehicle and actuator selection results | Covered |
| White Box Analysis | Simulink subsystem-level model | Covered |
| Functional Architecture | `figures/simulink_presentation_model.png` | Covered |
| Logical Breakdown | `docs/17_simulink_requirement_test_traceability.md` | Covered |
| Traceability Matrix | `results/traceability_matrix.csv`, `results/simulink_requirement_test_traceability.csv` | Covered |
| Testing and Validation | `docs/16_simulink_testing_validation.md` | Covered |
| Test Manager Results | `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx`, `docs/20_simulink_test_manager_all_scenarios.md` | Covered |
| Requirements Not Fully Tested | `docs/21_requirements_not_fully_tested_justification.md` | Covered |
| Before/After Testing Phase | `docs/18_before_after_simulink_testing_phase.md` | Covered |
| Final Course Alignment | `docs/22_alignment_with_course_mandatory_contents.md` | Covered |
| Final Presentation Narrative | `docs/23_final_presentation_narrative.md` | Covered |

## Final Simulink Evidence

| Artifact | File |
|---|---|
| Presentation-ready Simulink model | `models/urban_ev_bbw_warning_logic_final_presentation.slx` |
| Test-validation Simulink model | `models/urban_ev_bbw_warning_logic_test_validation.slx` |
| Simulink model figure | `figures/simulink_presentation_model.png` |
| Scenario-based test results | `results/simulink_test_validation_results.csv` |
| Requirement-to-test traceability | `results/simulink_requirement_test_traceability.csv` |
| All-scenarios Test Manager file | `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` |

## Final Claim
The project demonstrates a lightweight MBSE/RFLP workflow for concept-level emergency brake-request logic verification using MATLAB and Simulink.

## Scope-Safe Limitation
The project does not claim production brake-by-wire validation, certified safety compliance, real sensor fusion, hardware-in-the-loop testing, or ISO 26262 verification.
