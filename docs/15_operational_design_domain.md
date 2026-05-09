# 15 - Operational Design Domain

## Purpose

This document defines the Operational Design Domain used in this project.

The ODD describes the operating conditions in which the simplified low-speed urban EV and concept-level emergency brake-request logic are considered valid.

The ODD is intentionally limited because the project is a university-level concept-design and MATLAB-based verification workflow.

It does not claim production AEB validation, real-world deployment, ISO 26262 compliance, SOTIF compliance, or industrial automated-driving certification.

---

## Why ODD Is Included

The ODD prevents the project from being interpreted too broadly.

It clearly defines where the model is intended to work and where it is not valid.

This is important because the project uses simplified scenario inputs instead of real perception, sensor fusion, or real vehicle testing.

---

## ODD Summary

| ODD ID | Category | Supported Condition | Status |
|---|---|---|---|
| ODD-01 | Environment | Low-speed urban and campus environment | In scope |
| ODD-02 | Ego speed | 0 to 50 km/h | In scope |
| ODD-03 | Road condition | Dry asphalt or wet asphalt | In scope |
| ODD-04 | Road geometry | Straight road only | In scope |
| ODD-05 | Target type | Lead vehicle or stationary obstacle | In scope |
| ODD-06 | Visibility | Clear visibility assumed | In scope |
| ODD-07 | Sensor input | Simplified scenario-level input | In scope |
| ODD-08 | Driver role | Driver remains responsible | In scope |
| ODD-09 | Brake request | Concept-level emergency brake request only | In scope |
| ODD-10 | Verification method | MATLAB script-based scenario verification | In scope |

---

## Detailed ODD Definition

The detailed ODD definition is stored in:

`data/odd_definition.csv`

This file defines:

- ODD ID;
- category;
- attribute;
- supported value;
- status;
- verification use;
- scope note.

---

## In-Scope Conditions

### ODD-01 - Low-Speed Urban and Campus Environment

The project is designed for a simplified low-speed urban or campus mobility context.

It is not intended for highway or motorway operation.

### ODD-02 - Ego Speed Range

The ego vehicle speed is limited to:

`0 to 50 km/h`

This is consistent with the low-speed urban EV concept used in the project.

### ODD-03 - Road Surface

The project considers two simplified road conditions:

- dry asphalt;
- wet asphalt.

These road conditions are represented using simplified friction coefficients.

### ODD-04 - Road Geometry

The project assumes a straight-road situation.

Curves, intersections, lane changes, slopes, and complex road geometry are outside the current scope.

### ODD-05 - Target Type

The target object is simplified as either:

- a lead vehicle;
- a stationary obstacle.

Pedestrians, cyclists, animals, multiple targets, and complex traffic interactions are outside the current scope.

### ODD-06 - Visibility

Visibility is assumed to be clear.

The project does not model fog, night conditions, heavy rain, glare, occlusion, or sensor degradation.

### ODD-07 - Sensor Input

The project uses simplified scenario-level inputs.

Inputs such as ego speed, target distance, relative speed, road condition, and friction coefficient are provided by predefined scenario files.

No real camera, radar, LiDAR, YOLO, ROS2, or sensor fusion is included in the main version.

### ODD-08 - Driver Role

The driver remains responsible.

The WARNING state is interpreted as an HMI-level warning, not as autonomous driving control.

### ODD-09 - Brake Request

The EMERGENCY_BRAKE state generates a concept-level brake_request signal.

This is not a production actuator command and does not represent certified brake-by-wire control.

---

## Out-of-Scope Conditions

The following conditions are outside the ODD:

| Out-of-Scope Area | Explanation |
|---|---|
| Highway operation | The project is limited to low-speed urban/campus operation. |
| Snow or ice | Only dry and wet asphalt are considered. |
| Curved roads and intersections | The current scenario model assumes straight-road cases only. |
| Real perception | No real camera, radar, LiDAR, YOLO, or sensor fusion is used. |
| Pedestrians and cyclists | The target is limited to lead vehicle or stationary obstacle. |
| Production brake control | The project only generates concept-level brake_request logic. |
| Functional safety certification | ISO 26262 and SOTIF compliance are not claimed. |
| HIL or SIL testing | Verification is limited to MATLAB script-based testing. |

---

## Link Between ODD and Scenarios

The scenario catalogue is constrained by this ODD.

Current scenarios only use:

- low-speed vehicle operation;
- dry or wet road conditions;
- straight-road assumptions;
- simplified target distance and relative speed inputs;
- lead vehicle or stationary obstacle interpretation;
- MATLAB-based verification.

This prevents the scenario set from making claims outside the defined operating envelope.

---

## Link Between ODD and Limitations

The ODD should be read together with:

- `docs/08_assumptions_and_limitations.md`
- `docs/09_scenario_catalog.md`
- `docs/12_verification_coverage.md`

The ODD defines where the model is valid.

The limitations define what the project does not claim.

The scenario catalogue shows which cases are actually tested.

---

## Scope-Safe Positioning

This ODD is ODD-inspired and used for academic project scoping.

It is not a formal industrial ODD model and it is not an ASAM OpenODD implementation.

The purpose is to define a clear operating envelope for concept-level MATLAB scenario verification.

---

## Conclusion

The ODD improves the project by defining a clear operating envelope.

It shows that the warning and brake-request logic is only evaluated under supported low-speed urban and campus conditions.

This makes the project more realistic, traceable, and suitable for ADAS-oriented internship discussion without claiming production-level automated driving functionality.
