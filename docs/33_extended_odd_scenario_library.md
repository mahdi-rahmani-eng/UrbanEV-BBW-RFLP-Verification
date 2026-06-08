# Extended ODD Scenario Library

## Purpose

This document describes the extended Operational Design Domain (ODD) scenario library added to the UrbanEV-BBW-RFLP verification project.

The purpose of this extension is to make the validation workflow more scalable by defining additional parameterized scenarios for low-speed urban electric vehicle brake-request logic.

The scenario library is stored in:

- `data/extended_odd_scenario_library.csv`

## What is ODD in this project?

In this project, the Operational Design Domain is limited to a concept-level low-speed urban electric vehicle use case.

The ODD is intentionally limited and does not represent full autonomous driving or production vehicle operation.

## Scenario Parameters

The extended scenario library defines scenarios using the following parameters:

| Parameter | Unit | Meaning |
|---|---|---|
| `ScenarioID` | - | Unique identifier for each extended scenario |
| `ODDZone` | - | Short description of the operating condition |
| `EgoSpeed_kmh` | km/h | Ego vehicle speed |
| `TargetDistance_m` | m | Distance to the target or obstacle |
| `RelativeSpeed_mps` | m/s | Relative closing speed |
| `RoadFriction_mu` | - | Simplified road friction coefficient |
| `ControllerDelay_s` | s | Simplified controller delay |
| `ActuatorDelay_s` | s | Simplified actuator delay |
| `TargetType` | - | Moving target or stationary obstacle |
| `ExpectedWarningState` | - | Expected warning state |
| `ExpectedBrakeRequest` | - | Expected emergency brake-request output |
| `Purpose` | - | Reason for including the scenario |

## Scenario Groups

The library includes several scenario categories:

| Scenario Group | Example Purpose |
|---|---|
| Low-speed urban dry-road cases | Baseline SAFE, CAUTION, and WARNING behavior |
| Low-speed urban wet-road cases | Reduced-friction behavior and emergency brake-request activation |
| Delay-sensitive cases | Controller and actuator delay sensitivity |
| Stationary obstacle cases | Close and critical obstacle conditions |

## Validation Relevance

This scenario library helps extend the project from a small fixed scenario set toward a more scalable scenario-based validation workflow.

It can be used in future work to generate automated Simulink Test Manager cases, regression tests, and ODD coverage summaries.

## Example Expected Behavior

| Scenario | Expected Warning State | Expected Brake Request |
|---|---|---:|
| Dry-road baseline case | SAFE | 0 |
| Dry-road high-risk case | WARNING | 0 |
| Wet-road emergency case | EMERGENCY_BRAKE | 1 |
| Delay-sensitive wet-road case | EMERGENCY_BRAKE | 1 |
| Critical stationary obstacle case | EMERGENCY_BRAKE | 1 |

## Future Use

The extended ODD scenario library can support future work such as:

- automated scenario generation
- regression testing
- ODD coverage analysis
- parameter sweep testing
- robustness testing under friction and delay variations
- Simulink Test Manager test-case expansion

## Scope Limitation

This scenario library is a concept-level validation artifact.

It does not claim real-world autonomous driving validation, production AEB validation, certified ODD coverage, HIL/SIL validation, ISO 26262 compliance, or real vehicle testing.
