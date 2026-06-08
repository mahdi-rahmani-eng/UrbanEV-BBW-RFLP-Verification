# Stateflow Warning Logic Extension

## Purpose

This document describes the Stateflow-based warning-state logic added to the UrbanEV-BBW-RFLP verification project.

The goal of this extension is to represent the warning and emergency brake-request logic as a finite-state machine and compare its outputs against the original Simulink decision logic.

## Stateflow States

The Stateflow chart includes four states:

| State | Code | brake_request | Meaning |
|---|---:|---:|---|
| SAFE | 0 | 0 | No critical risk detected |
| CAUTION | 1 | 0 | Early risk condition |
| WARNING | 2 | 0 | High-risk condition |
| EMERGENCY_BRAKE | 3 | 1 | Emergency brake request is activated |

## Inputs

| Input | Unit | Description |
|---|---|---|
| target_distance_m | m | Distance to the target or obstacle |
| safe_distance_m | m | Estimated safe stopping distance |
| ttc_s | s | Time-to-collision estimate |

## Outputs

| Output | Description |
|---|---|
| warning_state_uint8 | Stateflow warning-state output |
| brake_request | Boolean emergency brake request |

## Validation Method

The Stateflow outputs are compared in parallel with the original Simulink logic:

- original warning_state_code == Stateflow warning_state_uint8
- original brake_request == Stateflow brake_request

If both comparisons are true, the Stateflow logic is considered equivalent to the original model logic for the tested scenario.

## Current Validation Result

For the current SCN-05 sudden stationary obstacle scenario, the Stateflow chart produced:

| Signal | Value | Interpretation |
|---|---:|---|
| warning_state_uint8 | 3 | EMERGENCY_BRAKE |
| brake_request | 1 | Emergency brake request active |
| warning_state_match | 1 | Matches original logic |
| brake_request_match | 1 | Matches original logic |
| stateflow_logic_match | 1 | Overall Stateflow logic match |

## Scope Limitation

This Stateflow extension is a university-level model-based validation extension. It does not claim production brake-by-wire validation, ISO 26262 compliance, HIL/SIL validation, or real vehicle testing.
