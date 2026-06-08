# Regression Test Plan

## Purpose

This document describes the regression test plan for the UrbanEV-BBW-RFLP verification project.

The purpose of this plan is to define which scenario groups should be re-tested after changes to the model, thresholds, Stateflow logic, ODD scenario library, or validation evidence.

The regression test plan is stored in:

- `data/regression_test_plan.csv`

## Why Regression Testing Matters

Regression testing helps confirm that previously validated behavior remains correct after model updates.

In this project, regression testing is used as a concept-level validation planning artifact. It helps make the workflow more repeatable and easier to review.

## Regression Test Groups

| Test Group | Purpose | Priority |
|---|---|---|
| Baseline dry-road tests | Re-check normal dry-road behavior after changes to braking distance, TTC, or warning thresholds. | High |
| Wet-road tests | Re-check reduced-friction behavior and wet-road emergency cases. | High |
| Delay-sensitive tests | Re-check controller and actuator delay sensitivity. | Medium |
| Stationary obstacle tests | Re-check close and critical stationary obstacle behavior. | High |
| Emergency brake-request tests | Re-check that brake_request is active only in emergency cases. | High |
| Stateflow equivalence tests | Re-check that the Stateflow logic still matches the original Simulink decision logic. | High |
| ODD coverage review | Re-check consistency between the extended scenario library and ODD coverage summary. | Medium |

## Trigger Conditions

Regression tests should be re-run after changes to:

- braking-distance logic
- TTC calculation
- warning-state thresholds
- brake_request generation logic
- road-friction assumptions
- controller or actuator delay assumptions
- Stateflow chart structure
- original Simulink decision logic
- extended ODD scenario library
- ODD coverage summary

## Expected Regression Evidence

The main evidence artifacts include:

| Evidence File | Purpose |
|---|---|
| `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Simulink Test Manager test suite for main scenario validation. |
| `results/simulink_test_validation_results.csv` | Scenario validation results. |
| `models/urban_ev_bbw_warning_logic_stateflow_validation.slx` | Stateflow-to-Simulink equivalence model. |
| `data/odd_coverage_summary.csv` | ODD coverage summary. |
| `data/regression_test_plan.csv` | Regression test planning table. |

## Stateflow Regression Check

The Stateflow equivalence check should confirm:

| Check | Expected Result |
|---|---:|
| `warning_state_match` | 1 |
| `brake_request_match` | 1 |
| `stateflow_logic_match` | 1 |

## Scope Limitation

This regression test plan is a concept-level validation planning artifact.

It does not claim certified regression testing, production brake-by-wire validation, HIL/SIL validation, ECU-level validation, ISO 26262 compliance, ASPICE compliance, or real vehicle testing.
