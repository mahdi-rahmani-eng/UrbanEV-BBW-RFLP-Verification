# 03 — Requirements Quality Review

## Purpose

This document reviews the main project requirements using basic requirements-engineering quality criteria.

The goal is to ensure that the requirements are suitable for a university-level concept-design and MATLAB-based verification project.

---

## Requirement Quality Criteria

| Criterion | Meaning in this project |
|---|---|
| Singular | The requirement expresses one main need or function. |
| Unambiguous | The requirement can be interpreted in only one reasonable way. |
| Feasible | The requirement can be addressed within the simplified project scope. |
| Verifiable | The requirement can be checked by MATLAB simulation, design review, or traceability review. |
| Scope-safe | The requirement does not overclaim production brake-by-wire, ISO 26262, SOTIF, or real sensor validation. |

---

## Reviewed Requirements

| Requirement ID | Requirement Summary | Singular | Unambiguous | Feasible | Verifiable | Scope-safe | Comment |
|---|---|---|---|---|---|---|---|
| REQ-VEH-01 | Low-speed urban EV operating envelope | Yes | Yes | Yes | Yes | Yes | Verified through concept definition and maximum-speed values. |
| REQ-VEH-02 | Estimated range for campus/urban operation | Yes | Mostly | Yes | Yes | Yes | Should preferably include a numerical minimum range threshold. |
| REQ-VEH-03 | Concept selected using decision matrix | Yes | Yes | Yes | Yes | Yes | Verified through concept-selection results. |
| REQ-BBW-01 | Calculate stopping distance | Yes | Yes | Yes | Yes | Yes | Uses speed, friction coefficient, gravity, and actuator delay. |
| REQ-BBW-02 | Calculate TTC | Yes | Yes | Yes | Yes | Yes | Uses target distance and relative speed. |
| REQ-BBW-03 | Classify warning state | Yes | Yes | Yes | Yes | Yes | Verified using SAFE, CAUTION, WARNING, and EMERGENCY_BRAKE thresholds. |
| REQ-BBW-04 | Generate brake request | Yes | Yes | Yes | Yes | Yes | Brake request is generated only in EMERGENCY_BRAKE state. |
| REQ-BBW-05 | Include actuator delay effect | Yes | Yes | Yes | Yes | Yes | Verified using delay-sensitive scenario comparison. |
| REQ-BBW-06 | Select actuator concept | Yes | Yes | Yes | Yes | Yes | Verified through actuator weighted-selection table. |
| REQ-TRACE-01 | Maintain requirement traceability | Yes | Yes | Yes | Yes | Yes | Verified through requirement-function-logical-physical-scenario mapping. |

---

## Improvement Notes

The following improvements make the requirements more precise and easier to verify:

1. Avoid vague expressions such as *sufficient range* unless a numerical threshold is defined.
2. Use *shall* for formal requirements.
3. Keep each requirement focused on one function or constraint.
4. Link each requirement to at least one verification method.
5. Avoid claiming production brake-by-wire, industrial MBSE, ISO 26262, SOTIF, or real actuator validation.

---

## Conclusion

The current requirements are suitable for a lightweight university-level MBSE/RFLP workflow.

The main recommended improvement is to make range-related requirements more numerical and measurable.
