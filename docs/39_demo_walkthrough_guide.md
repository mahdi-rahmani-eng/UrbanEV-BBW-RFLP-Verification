# Demo Walkthrough Guide

## Purpose

This document provides a practical walkthrough for presenting the UrbanEV-BBW-RFLP verification repository during a portfolio review, academic discussion, or entry-level automotive validation interview.

The goal is to show the project in a clear order without overclaiming industrial maturity.

## Recommended Demo Order

### Step 1 — Start from the README

Open:

- `README.md`

Explain that the repository presents a concept-level model-based validation workflow for low-speed urban EV brake-request logic.

Focus on the fact that the project is not only a Simulink model, but a structured validation package.

### Step 2 — Show the Validation Artifacts Index

Open:

- `docs/00_validation_artifacts_index.md`

Explain that this file works as the map of the repository.

It shows the main models, evidence files, documentation files, scenario files, and validation support files.

### Step 3 — Show the Main Simulink Validation Model

Open:

- `models/urban_ev_bbw_warning_logic_test_validation.slx`

Explain the main signal flow:

1. vehicle and obstacle inputs
2. stopping-distance estimation
3. time-to-collision estimation
4. warning-state decision
5. brake-request output

### Step 4 — Show the Stateflow Validation Extension

Open:

- `models/urban_ev_bbw_warning_logic_stateflow_validation.slx`
- `docs/28_stateflow_warning_logic.md`

Explain that the warning logic was also represented as a Stateflow finite-state machine.

The Stateflow states are:

- SAFE
- CAUTION
- WARNING
- EMERGENCY_BRAKE

Explain that the Stateflow output was compared with the original Simulink warning logic.

### Step 5 — Show the Requirement-Test-Result Evidence

Open:

- `data/requirement_test_result_matrix.csv`
- `docs/30_validation_evidence_summary.md`

Explain that each requirement is connected to:

- a test scenario
- a test method
- an observed result
- an evidence file

This shows requirement traceability thinking.

### Step 6 — Show the Automotive Interface Files

Open:

- `data/automotive_signal_interface.csv`
- `data/can_signal_mapping.csv`
- `docs/32_can_signal_mapping.md`

Explain that these files make the model signals easier to discuss in an automotive communication context.

Clearly state that this is a conceptual mapping, not a real CAN or DBC implementation.

### Step 7 — Show the ODD and Scenario Expansion

Open:

- `data/extended_odd_scenario_library.csv`
- `data/odd_coverage_summary.csv`
- `docs/33_extended_odd_scenario_library.md`
- `docs/34_odd_coverage_summary.md`

Explain that the project considers different operating conditions, such as:

- dry road
- wet road
- delay-sensitive cases
- stationary obstacle cases
- different warning-state expectations

### Step 8 — Show the Regression Test Plan

Open:

- `data/regression_test_plan.csv`
- `docs/35_regression_test_plan.md`

Explain that the regression plan defines which tests should be repeated after model or threshold changes.

This demonstrates repeatability and validation discipline.

### Step 9 — Show the Artifact Integrity Check

Open:

- `matlab/check_validation_artifacts.m`
- `results/validation_artifacts_check.csv`

Explain that the script checks whether the key validation artifacts are available in the repository.

### Step 10 — End with the Final Audit and Talking Points

Open:

- `docs/36_final_repository_quality_audit.md`
- `docs/37_portfolio_interview_talking_points.md`
- `docs/38_reviewer_quick_start_guide.md`

Explain that these files summarize the final repository quality, safe interview positioning, and recommended review path.

## Two-Minute Verbal Demo Script

> This repository presents a concept-level model-based validation workflow for low-speed urban EV brake-request logic.

> The core model is built around stopping-distance and time-to-collision estimation, which are used to classify the warning state and activate a brake_request only in emergency conditions.

> I extended the project with a Stateflow finite-state machine and compared its warning-state and brake_request outputs with the original Simulink logic.

> I also added requirement-test-result evidence, validation documentation, conceptual automotive signal interfaces, CAN-style mapping, extended ODD scenarios, ODD coverage, regression planning, and an artifact integrity check.

> The project is not a production brake-by-wire system, but it demonstrates model-based validation thinking, scenario-based testing, traceability, and structured technical documentation.

## What to Emphasize

- The project is structured, not just modeled.
- The validation evidence is documented.
- The Stateflow logic adds a finite-state-machine representation.
- The requirement-test-result matrix shows traceability.
- The ODD and regression files show validation planning.
- The scope limitations are clearly stated.

## What to Avoid Saying

Do not say:

- this is production-ready
- this is a real brake-by-wire system
- this is ISO 26262 certified
- this is AUTOSAR-compliant
- this was tested on a real vehicle
- this includes real CAN bus implementation
- this includes HIL or SIL validation

## Final Demo Closing Sentence

> The value of this project is that it transforms a simple control-logic model into a structured validation repository with models, evidence, documentation, scenario planning, regression planning, and clear technical scope.
