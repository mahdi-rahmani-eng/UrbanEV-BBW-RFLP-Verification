# Validation Artifacts Index

## Purpose

This document provides a central index of the main validation artifacts included in the UrbanEV-BBW-RFLP verification project.

The purpose is to make the project easier to review by grouping the model-based validation files, scenario evidence, requirement evidence, signal-interface files, and future industrial extension documents in one place.

## Core Validation Model Files

| File | Purpose |
|---|---|
| `models/urban_ev_bbw_warning_logic_test_validation.slx` | Main Simulink validation model. |
| `models/urban_ev_bbw_warning_logic_stateflow_validation.slx` | Stateflow-based parallel validation model. |
| `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Simulink Test Manager suite for scenario-based validation. |

## Stateflow Validation Evidence

| File | Purpose |
|---|---|
| `docs/28_stateflow_warning_logic.md` | Documents Stateflow states, inputs, outputs, and equivalence checks. |
| `models/urban_ev_bbw_warning_logic_stateflow_validation.slx` | Contains the Stateflow warning-state logic and comparison outputs. |

## Requirements-Based Validation Evidence

| File | Purpose |
|---|---|
| `data/requirement_test_result_matrix.csv` | Links requirements to scenarios, test methods, observed results, and evidence files. |
| `docs/30_validation_evidence_summary.md` | Summarizes the validation evidence chain and results. |

## Automotive Interface Artifacts

| File | Purpose |
|---|---|
| `data/automotive_signal_interface.csv` | Defines input, internal, and output model signals with units, data types, and ranges. |
| `matlab/setup_automotive_interfaces.m` | Loads and displays the automotive signal interface table. |
| `data/can_signal_mapping.csv` | Provides conceptual CAN-style message mapping for key model signals. |
| `docs/32_can_signal_mapping.md` | Documents the CAN-style mapping and its scope limitation. |

## ODD and Scenario Expansion Artifacts

| File | Purpose |
|---|---|
| `data/extended_odd_scenario_library.csv` | Defines additional parameterized ODD scenarios. |
| `docs/33_extended_odd_scenario_library.md` | Documents the extended ODD scenario library. |
| `data/odd_coverage_summary.csv` | Summarizes which ODD areas are covered by the extended scenario library. |
| `docs/34_odd_coverage_summary.md` | Documents ODD coverage interpretation and limitation. |

## Regression and Future Extension Artifacts

| File | Purpose |
|---|---|
| `data/regression_test_plan.csv` | Defines regression test groups, triggers, expected results, and evidence files. |
| `docs/35_regression_test_plan.md` | Documents the regression testing rationale and scope. |
| `docs/31_future_industrial_extension_roadmap.md` | Lists future industrial extensions such as HIL, SIL, CAN mapping, AUTOSAR-oriented architecture, and functional safety analysis. |

## Review-Oriented Summary

The project now includes evidence for:

- model-based validation
- Stateflow-to-Simulink logic equivalence
- requirements-based validation evidence
- automotive-style signal interface definition
- conceptual CAN-style signal mapping
- extended ODD scenario planning
- ODD coverage summary
- regression test planning
- future industrial extension roadmap

## Scope Limitation

These artifacts support a university-level concept validation workflow.

They do not claim production brake-by-wire validation, certified ISO 26262 compliance, ASPICE compliance, AUTOSAR compliance, real CAN implementation, HIL/SIL validation, ECU-level deployment, or real-vehicle testing.
