# Final Live Demo Sequence

## Purpose

This document provides a short live-demo sequence for presenting the UrbanEV-BBW-RFLP-Verification project during the final course discussion.

The demo is designed to show the project evidence in a clear order: project scope, Black Box definition, concept selection, White Box decomposition, Simulink verification, results, and final audit evidence.

## Recommended Demo Order

| Step | What to show | Main file or folder | Purpose |
|---|---|---|---|
| 1 | Repository overview | `README.md` | Introduce the project scope and scope-safe positioning. |
| 2 | Requirements and scenarios | `data/requirements.csv`, `data/scenarios.csv` | Show the input evidence for the verification workflow. |
| 3 | Black Box evidence | `figures/system_context_diagram.png`, `figures/external_interface_diagram.png`, `figures/services_use_case_diagram.png` | Show the external system definition. |
| 4 | Concept selection | `figures/concept_generation_summary.png`, `figures/actuator_concept_screening_matrix.png`, `figures/actuator_concept_scoring_matrix.png` | Show how the actuator concept was selected. |
| 5 | White Box decomposition | `figures/white_box_functional_decomposition.png`, `figures/white_box_logical_architecture.png`, `figures/white_box_physical_allocation.png`, `figures/white_box_traceability_chain.png` | Show the internal system decomposition. |
| 6 | Simulink model | `models/urban_ev_bbw_warning_logic_test_validation.slx` | Show the concept-level implementation evidence. |
| 7 | Test Manager evidence | `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Show the scenario-based verification asset. |
| 8 | Results | `results/simulink_test_validation_results.csv`, `results/simulink_requirement_test_traceability.csv` | Show verification output and traceability evidence. |
| 9 | Final audits | `docs/45_final_course_alignment_audit.md`, `docs/46_final_repository_quality_check.md`, `docs/47_final_scope_claim_audit.md`, `docs/48_final_readme_link_check.md` | Show final readiness and consistency checks. |

## Scope-Safe Demo Statement

This demo presents a university-level, concept-level MBSE/RFLP and MATLAB/Simulink verification workflow. It does not claim industrial completeness, production brake-by-wire design, HIL/SIL validation, ISO 26262 validation, SOTIF validation, or certified safety compliance.
