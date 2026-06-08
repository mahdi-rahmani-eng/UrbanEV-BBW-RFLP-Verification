# CAN-Style Signal Mapping

## Purpose

This document describes a CAN-style signal mapping layer for the UrbanEV-BBW-RFLP verification project.

The purpose of this extension is to make the model interface closer to an automotive validation workflow by showing how key model signals could be represented as vehicle communication signals.

This is a conceptual CAN-style mapping only. It does not claim real CAN implementation, ECU deployment, or production vehicle integration.

## Main Mapping File

The signal mapping table is stored in:

- `data/can_signal_mapping.csv`

## Mapped Signals

The mapping includes the main input, internal, and output signals used by the brake-request validation workflow:

| Signal | Direction | Example CAN Message | Purpose |
|---|---|---|---|
| `ego_speed_kmh` | Input | `VehicleMotionStatus` | Ego vehicle speed used by the brake-request logic |
| `target_distance_m` | Input | `ObjectTrackingStatus` | Distance to target or obstacle |
| `relative_speed_mps` | Input | `ObjectTrackingStatus` | Relative closing speed |
| `road_friction_mu` | Input | `RoadConditionEstimate` | Simplified dry/wet road condition estimate |
| `safe_distance_m` | Internal | `BrakeSafetyEstimate` | Computed safe stopping distance |
| `ttc_s` | Internal | `CollisionRiskEstimate` | Computed time-to-collision |
| `warning_state_uint8` | Output | `BrakeWarningCommand` | Warning-state output |
| `brake_request` | Output | `BrakeWarningCommand` | Emergency brake-request output |

## Example CAN-Style Signal Groups

| CAN Message | Example CAN ID | Example Signals |
|---|---|---|
| `VehicleMotionStatus` | `0x101` | `ego_speed_kmh` |
| `ObjectTrackingStatus` | `0x201` | `target_distance_m`, `relative_speed_mps` |
| `RoadConditionEstimate` | `0x301` | `road_friction_mu` |
| `BrakeSafetyEstimate` | `0x401` | `safe_distance_m` |
| `CollisionRiskEstimate` | `0x402` | `ttc_s` |
| `BrakeWarningCommand` | `0x501` | `warning_state_uint8`, `brake_request` |

## Validation Relevance

This mapping helps clarify which signals are treated as inputs, internal computed values, and outputs in the model-based validation workflow.

It also makes the project easier to discuss in relation to automotive validation, signal interface definition, test automation, and ECU-oriented future extensions.

## Scope Limitation

This file is a conceptual interface-mapping artifact.

It does not claim real CAN bus implementation, DBC generation, ECU software deployment, AUTOSAR compliance, ISO 26262 compliance, HIL validation, or vehicle-level integration.
