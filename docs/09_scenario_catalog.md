# 09 - Scenario Catalog

## Purpose

This document defines the simplified scenario catalogue used for MATLAB-based verification of the concept-level brake-by-wire emergency brake-request logic.

The purpose is to make the test cases clear, repeatable, and traceable to the project requirements.

This scenario catalogue is suitable for a university-level concept-design project and does not claim exhaustive real-world traffic validation.

---

## Scenario-Based Verification Context

The emergency braking logic is evaluated using predefined scenario inputs rather than real sensor data.

Each scenario provides simplified values for:

- ego vehicle speed;
- target distance;
- relative speed;
- road condition;
- friction coefficient;
- actuator delay;
- expected warning state.

The MATLAB model calculates:

- stopping distance;
- TTC;
- warning state;
- brake request;
- pass/fail verification result.

---

## Warning-State Logic

The project uses four simplified warning states:

| State | Meaning |
|---|---|
| SAFE | Normal condition; no warning or brake request is needed. |
| CAUTION | The target is close enough to require attention, but not critical. |
| WARNING | The risk is high and the system should warn the user. |
| EMERGENCY_BRAKE | Critical condition; emergency brake request is generated. |

Brake request is generated only when the state is EMERGENCY_BRAKE.

---

## Scenario Catalogue

| Scenario ID | Scenario Name | Road | Ego Speed | Target Distance | Relative Speed | Friction mu | Actuator Delay | Expected State | Verification Focus |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| SCN-01 | Normal following | Dry | 20 km/h | 25 m | 5 km/h | 0.75 | 0.20 s | SAFE | Check normal low-risk classification. |
| SCN-02 | Close but not critical target | Dry | 30 km/h | 10 m | 10 km/h | 0.75 | 0.20 s | CAUTION | Check close-distance caution logic. |
| SCN-03 | High closing risk | Dry | 30 km/h | 8 m | 15 km/h | 0.75 | 0.20 s | WARNING | Check high-risk warning logic. |
| SCN-04 | Wet-road warning case | Wet | 30 km/h | 9 m | 15 km/h | 0.45 | 0.20 s | WARNING | Check wet-road effect on stopping distance and risk. |
| SCN-05 | Sudden stationary obstacle | Dry | 40 km/h | 10 m | 40 km/h | 0.75 | 0.20 s | EMERGENCY_BRAKE | Check emergency brake-request generation. |
| SCN-06 | Delay-sensitive wet case | Wet | 30 km/h | 8.8 m | 10 km/h | 0.45 | 0.20 s | WARNING | Check actuator-delay effect under wet-road condition. |

---

## Scenario Rationale

### SCN-01 - Normal following

This scenario represents a safe following condition. The target distance is large and the closing speed is low. The expected output is SAFE.

### SCN-02 - Close but not critical target

This scenario represents a closer target under dry-road conditions. The expected output is CAUTION because the situation requires attention but is not yet critical.

### SCN-03 - High closing risk

This scenario increases the closing risk by using a shorter target distance and higher relative speed. The expected output is WARNING.

### SCN-04 - Wet-road warning case

This scenario keeps the vehicle speed moderate but reduces friction because of wet-road conditions. Lower friction increases stopping distance and supports a WARNING classification.

### SCN-05 - Sudden stationary obstacle

This scenario represents a critical sudden-obstacle case. The target is close and the relative speed is high. The expected output is EMERGENCY_BRAKE and brake_request should be 1.

### SCN-06 - Delay-sensitive wet case

This scenario checks whether actuator delay affects the stopping-distance calculation and risk classification under wet-road conditions.

---

## Requirement Links

| Scenario ID | Main Linked Requirement | Verification Purpose |
|---|---|---|
| SCN-01 | REQ-BBW-03 | Verify SAFE classification. |
| SCN-02 | REQ-BBW-03 | Verify CAUTION classification. |
| SCN-03 | REQ-BBW-03 | Verify WARNING classification. |
| SCN-04 | REQ-BBW-01; REQ-BBW-03 | Verify wet-road stopping distance and warning logic. |
| SCN-05 | REQ-BBW-04 | Verify emergency brake-request generation. |
| SCN-06 | REQ-BBW-05 | Verify actuator-delay effect. |

---

## Evidence Files

The scenario definitions are stored in:

`data/scenarios.csv`

The scenario verification results are generated in:

`results/scenario_verification_results.csv`

To regenerate the scenario results, run:

addpath('matlab')
run_all

---

## Scope Note

The scenarios are simplified and representative. They are not exhaustive real-world traffic scenarios.

The project does not claim production AEB validation, real perception validation, ISO 26262 verification, SOTIF coverage, or HIL/SIL testing.

---

## Conclusion

The scenario catalogue makes the verification logic clearer and more reviewable.

It shows that the project uses defined test cases to check braking-risk classification, emergency brake-request generation, wet-road behaviour, and actuator-delay effects.
