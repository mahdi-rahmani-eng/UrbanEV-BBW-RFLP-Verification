# Alignment with Course Mandatory Contents

## Purpose
This document maps the UrbanEV-BBW-RFLP-Verification project to the mandatory-content structure used in the course example.

The purpose is to show that the project follows the same engineering logic: needs, black-box analysis, requirements, concept selection, white-box analysis, traceability, testing, validation, Test Manager results, and before/after testing reflection.

## Alignment Matrix

| Course Example Section | Purpose in Course Example | UrbanEV-BBW Project Equivalent | Main Evidence | Status |
|---|---|---|---|---|
| Starting from Needs | Start from the initial problem and stakeholder needs | Low-speed urban EV emergency brake-request concept | `README.md`, `docs/01_project_overview.md` | Covered |
| Black Box Analysis | Define system boundary, external view, interfaces, scenarios, and requirements | Scope definition, ODD, scenario catalogue, requirements table | `data/requirements.csv`, `data/scenarios.csv`, `docs/03_requirements_table.md`, `docs/07_scenario_catalogue.md` | Covered |
| Life Cycle / Context | Describe system context and operating environment | ODD and concept-level use context for low-speed urban EV | `docs/15_operational_design_domain.md` if present, `README.md` | Partially covered |
| External Interfaces | Identify external inputs/outputs and system interactions | Scenario inputs, warning-state output, brake-request output | Simulink model, `docs/15_simulink_verification_model.md` | Covered at concept level |
| Stakeholder / System Requirements | Build consistent requirement set | Requirement table and traceability outputs | `data/requirements.csv`, `results/traceability_matrix.csv` | Covered |
| Concept Generation | Generate alternative concepts | Vehicle concepts and actuator alternatives | `data/vehicle_concepts.csv`, actuator selection files | Covered |
| Concept Screening / Scoring | Select best concept/component | Concept selection and actuator selection results | `results/concept_selection_results.csv`, `results/actuator_selection_results.csv` | Covered |
| White Box Analysis | Internal view of the system and functional decomposition | Simulink subsystem-level architecture | `models/urban_ev_bbw_warning_logic_final_presentation.slx` | Covered |
| Functional Architecture | Explain what functions the system performs | Scenario Definition, Risk Estimation, Warning & Brake Decision, Requirement Verification, Results & Logging | `figures/simulink_presentation_model.png`, Simulink model | Covered |
| Logical Breakdown and Allocation | Allocate functions to logical model elements | Simulink subsystems and requirement-to-test mapping | `docs/17_simulink_requirement_test_traceability.md` | Covered |
| Logical Architecture | Organize logical components and information flow | Simulink block-level architecture | `models/urban_ev_bbw_warning_logic_test_validation.slx` | Covered at simplified level |
| Traceability Matrix | Link requirements, architecture, and verification | MATLAB traceability and Simulink requirement-to-test traceability | `results/traceability_matrix.csv`, `results/simulink_requirement_test_traceability.csv` | Covered |
| Testing and Validation Phase | Check model behaviour by simulation | Scenario-based MATLAB/Simulink testing for SCN-01 to SCN-06 | `results/simulink_test_validation_results.csv`, `docs/16_simulink_testing_validation.md` | Covered |
| Test Manager Results | Provide official Simulink Test Manager evidence | Official Simulink Test Manager suites for SCN-05 and all scenarios | `UrbanEV_BBW_Simulink_Test_Manager.mldatx`, `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx`, `docs/20_simulink_test_manager_all_scenarios.md` | Covered |
| State Model Testing | Test the conditions leading to different states | Warning-state testing for SAFE, CAUTION, WARNING, and EMERGENCY_BRAKE | Test Manager all-scenarios result | Covered with project-specific equivalent |
| Requirements Not Fully Tested | Justify requirements outside test scope | Scope-safe justification for hardware, sensors, HIL/SIL, ISO 26262, production validation | `docs/21_requirements_not_fully_tested_justification.md` | Covered |
| Before and After Testing Phase | Explain improvement after testing | Before/after Simulink testing summary | `docs/18_before_after_simulink_testing_phase.md` | Covered |

## Important Project-Specific Differences

The course example includes Formula Student-specific subsystems such as ETC, AS State, and electrical actuator models. The UrbanEV-BBW project does not copy those subsystems because its scope is different.

Instead, the equivalent project-specific focus is:

- warning-state classification
- emergency brake-request logic
- stopping-distance estimation
- time-to-collision estimation
- scenario-based verification
- Test Manager execution for all defined scenarios

## Scope-Safe Interpretation

The project is aligned with the course workflow, but it remains a concept-level MBSE/RFLP and MATLAB/Simulink verification project.

It does not claim production brake-by-wire validation, real vehicle testing, hardware-in-the-loop testing, real sensor fusion, certified safety compliance, or ISO 26262 verification.

## Final Assessment

After adding Simulink modeling, scenario-based testing, requirement-to-test traceability, Test Manager results, and test-scope justification, the project is strongly aligned with the structure of the course mandatory-content example.
