# UrbanEV-BBW-RFLP Verification

## Project Overview

This repository presents a concept-level model-based validation workflow for low-speed urban electric vehicle brake-request logic.

The project uses MATLAB/Simulink and Stateflow to model, validate, and document simplified emergency brake-request behavior under urban driving scenarios.

The repository is designed as a structured academic and portfolio-level automotive validation project. It includes models, validation evidence, scenario documentation, requirement-test-result mapping, ODD coverage, regression planning, and reviewer-oriented documentation.

## Best One-Sentence Summary

> A concept-level MATLAB/Simulink and Stateflow validation workflow for low-speed urban EV brake-request logic, with scenario-based testing, requirement evidence, ODD coverage, regression planning, and structured technical documentation.

## Main Technical Focus

The model evaluates vehicle and obstacle conditions and estimates:

- stopping distance
- safe distance
- time to collision
- warning state
- brake request

The warning-state logic classifies the driving situation into:

| Warning State | Meaning | Brake Request |
|---|---|---|
| SAFE | No critical risk detected | 0 |
| CAUTION | Early risk condition | 0 |
| WARNING | Higher risk condition | 0 |
| EMERGENCY_BRAKE | Critical risk condition | 1 |

## Repository Quick Start

| Review Goal | Start Here |
|---|---|
| Understand the whole project quickly | `docs/40_one_page_project_summary.md` |
| Review the repository structure | `docs/38_reviewer_quick_start_guide.md` |
| Present the project in a demo/interview | `docs/39_demo_walkthrough_guide.md` |
| Understand validation artifacts | `docs/00_validation_artifacts_index.md` |
| Understand final quality status | `docs/36_final_repository_quality_audit.md` |
| Use the project in CV/LinkedIn | `docs/41_cv_linkedin_project_description.md` |

## Core Models

| File | Purpose |
|---|---|
| `models/urban_ev_bbw_warning_logic_test_validation.slx` | Main Simulink validation model |
| `models/urban_ev_bbw_warning_logic_stateflow_validation.slx` | Stateflow-based warning logic validation model |
| `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Simulink Test Manager validation file |

## Main Validation Documentation

| File | Purpose |
|---|---|
| `docs/28_stateflow_warning_logic.md` | Explains the Stateflow warning-state extension |
| `docs/30_validation_evidence_summary.md` | Summarizes requirement-test-result validation evidence |
| `docs/31_future_industrial_extension_roadmap.md` | Lists possible future industrial extensions |
| `docs/32_can_signal_mapping.md` | Documents conceptual CAN-style signal mapping |
| `docs/33_extended_odd_scenario_library.md` | Documents extended ODD scenarios |
| `docs/34_odd_coverage_summary.md` | Summarizes ODD coverage |
| `docs/35_regression_test_plan.md` | Defines regression test planning |
| `docs/36_final_repository_quality_audit.md` | Provides final repository quality audit |

## Portfolio and Review Guides

| File | Purpose |
|---|---|
| `docs/37_portfolio_interview_talking_points.md` | Interview and portfolio talking points |
| `docs/38_reviewer_quick_start_guide.md` | Fast review path for reviewers |
| `docs/39_demo_walkthrough_guide.md` | Step-by-step demo presentation guide |
| `docs/40_one_page_project_summary.md` | One-page professional project summary |
| `docs/41_cv_linkedin_project_description.md` | CV, LinkedIn, cover letter, and interview wording |
| `docs/42_final_github_portfolio_polish.md` | Final GitHub portfolio polish checklist |

## Data and Evidence Files

| File | Purpose |
|---|---|
| `data/requirement_test_result_matrix.csv` | Requirement-test-result traceability matrix |
| `data/automotive_signal_interface.csv` | Automotive-style signal interface definition |
| `data/can_signal_mapping.csv` | Conceptual CAN-style signal mapping |
| `data/extended_odd_scenario_library.csv` | Extended ODD scenario library |
| `data/odd_coverage_summary.csv` | ODD coverage summary |
| `data/regression_test_plan.csv` | Regression test plan |
| `results/validation_artifacts_check.csv` | Artifact integrity check result |

## Artifact Integrity Check

The repository includes a MATLAB script to check whether the key validation artifacts are available:

- `matlab/check_validation_artifacts.m`

The generated result file is:

- `results/validation_artifacts_check.csv`

## Skills Demonstrated

| Skill Area | Evidence in Repository |
|---|---|
| MATLAB/Simulink | Model-based validation workflow |
| Stateflow | Finite-state warning logic |
| Automotive V&V thinking | Scenario-based validation and evidence organization |
| Requirements traceability | Requirement-test-result matrix |
| Signal interface thinking | Automotive interface and CAN-style mapping |
| ODD planning | Extended ODD scenario library and coverage summary |
| Regression testing mindset | Regression test plan |
| Technical documentation | Structured documentation and reviewer guides |
| GitHub portfolio readiness | One-page summary, demo guide, CV/LinkedIn wording, and final polish checklist |

## Recommended GitHub Description

Concept-level MATLAB/Simulink and Stateflow validation workflow for low-speed urban EV brake-request logic, with scenario-based testing, requirement evidence, ODD coverage, and regression planning.

## Suggested Repository Topics

- matlab
- simulink
- stateflow
- model-based-design
- automotive-validation
- electric-vehicles
- brake-request-logic
- scenario-based-testing
- requirements-traceability
- verification-and-validation

## Scope Limitation

This repository is a university-level concept validation project.

It does not claim production brake-by-wire validation, certified ISO 26262 compliance, ASPICE compliance, AUTOSAR compliance, HIL/SIL validation, ECU deployment, real CAN implementation, DBC generation, or real-vehicle testing.

## Final Portfolio Message

The main value of this repository is that a simplified brake-request logic model was expanded into a structured validation portfolio with models, Stateflow logic, requirements, scenarios, evidence, ODD planning, regression planning, reviewer guidance, and clear technical scope limitations.

## README Archive

The previous extended README version was archived before final cleanup:

- `docs/43_readme_archive_before_final_cleanup.md`
