# Validation Evidence Summary

## Purpose

This document summarizes the main validation evidence produced for the UrbanEV-BBW-RFLP verification project.

The goal is to show a clear requirements-based and scenario-based validation chain:

`Requirement → Scenario → Test Method → Observed Result → Evidence File`

## Validation Scope

This project validates a concept-level emergency brake-request logic for a low-speed urban electric vehicle.

The validation focuses on:

- stopping-distance estimation
- time-to-collision estimation
- warning-state classification
- emergency brake-request generation
- wet-road and delay-sensitive scenario behavior
- Stateflow-to-Simulink logic equivalence

## Main Validation Evidence

| Evidence Item | File | Purpose |
|---|---|---|
| Requirement-test-result matrix | `data/requirement_test_result_matrix.csv` | Links requirements to scenarios, test methods, observed results, and evidence files. |
| Simulink Test Manager suite | `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Runs scenario-based verification tests. |
| Stateflow validation model | `models/urban_ev_bbw_warning_logic_stateflow_validation.slx` | Compares Stateflow warning logic with the original Simulink decision logic. |
| Stateflow documentation | `docs/28_stateflow_warning_logic.md` | Documents Stateflow states, inputs, outputs, and match results. |
| Automotive signal interface | `data/automotive_signal_interface.csv` | Defines automotive-style input, internal, and output signals. |

## Requirement-Test-Result Summary

| Requirement Area | Scenario Coverage | Result |
|---|---|---|
| Stopping-distance estimation | SCN-01 to SCN-06 | Pass |
| Time-to-collision estimation | SCN-01 to SCN-06 | Pass |
| Warning-state classification | SCN-01 to SCN-06 | Pass |
| Emergency brake-request generation | SCN-05 | Pass |
| Wet-road behavior | SCN-04, SCN-06 | Pass |
| Delay-sensitive behavior | SCN-06 | Pass |
| Stateflow-to-Simulink equivalence | SCN-05 | Pass |

## Stateflow Equivalence Check

The Stateflow logic was implemented as a parallel validation extension and compared with the original Simulink decision logic.

For the tested SCN-05 sudden stationary obstacle scenario:

| Signal | Expected | Observed | Result |
|---|---:|---:|---|
| `warning_state_uint8` | 3 | 3 | Pass |
| `brake_request` | 1 | 1 | Pass |
| `warning_state_match` | 1 | 1 | Pass |
| `brake_request_match` | 1 | 1 | Pass |
| `stateflow_logic_match` | 1 | 1 | Pass |

## Interpretation

The validation evidence shows that the concept-level warning and emergency brake-request logic behaves as expected for the tested scenarios.

The Stateflow extension also confirms that the finite-state-machine representation matches the original Simulink decision logic for the tested SCN-05 case.

## Scope Limitation

This validation evidence is intended for a university-level model-based verification project.

It does not claim production brake-by-wire validation, ISO 26262 compliance, ASPICE compliance, HIL/SIL validation, ECU-level validation, or real-vehicle testing.
