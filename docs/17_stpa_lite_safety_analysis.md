# 17 - STPA-Lite Safety Analysis

## Purpose

This document provides a lightweight STPA-inspired safety analysis for the concept-level emergency brake-request logic.

The analysis focuses on unsafe control actions related to warning-state classification and brake_request generation.

This is not a full industrial STPA study and does not claim ISO 26262 compliance SOTIF compliance HARA FMEA or certified safety validation.

---

## Why STPA-Lite Is Added

The project includes emergency brake-request logic which is safety-related at concept level.

A lightweight safety analysis helps identify how the simplified control logic could become unsafe if the warning state brake request road condition ODD or actuator delay assumptions are not handled correctly.

---

## Scope of the Analysis

The analysis covers:

- warning-state classification;
- brake_request generation;
- TTC and stopping-distance thresholds;
- wet-road friction assumptions;
- actuator-delay assumptions;
- use of the system inside the defined ODD.

The analysis does not cover:

- production brake-by-wire architecture;
- ECU redundancy;
- diagnostics;
- hydraulic backup;
- ASIL allocation;
- ISO 26262 safety case;
- SOTIF validation;
- full STPA control-structure modelling.

---

## Losses

| Loss ID | Loss |
|---|---|
| LOSS-01 | Vehicle collides with a front obstacle. |
| LOSS-02 | Vehicle performs unnecessary emergency braking. |
| LOSS-03 | Driver receives warning too late. |
| LOSS-04 | Brake request is generated outside the intended ODD. |

---

## Hazards

The detailed hazard list is stored in:

`data/stpa_hazards.csv`

| Hazard ID | Hazard |
|---|---|
| H1 | Emergency brake request is not generated when collision risk is critical. |
| H2 | Emergency brake request is generated when the situation is not critical. |
| H3 | Warning state remains SAFE despite unsafe TTC or stopping-distance condition. |
| H4 | Wet-road condition is underestimated. |
| H5 | Actuator or controller delay is not considered. |
| H6 | System is used outside the supported speed range or ODD. |

---

## Main Control Action

The main control action considered in this STPA-Lite analysis is:

`brake_request`

In this project brake_request is binary:

| Value | Meaning |
|---|---|
| 0 | No emergency brake request. |
| 1 | Emergency brake request generated. |

Brake request is generated only when the warning state is EMERGENCY_BRAKE.

---

## Unsafe Control Actions

The detailed unsafe control action list is stored in:

`data/unsafe_control_actions.csv`

| UCA ID | Control Action | Unsafe Case |
|---|---|---|
| UCA-01 | brake_request | Not provided when required. |
| UCA-02 | brake_request | Provided when not required. |
| UCA-03 | brake_request | Provided too late. |
| UCA-04 | brake_request | Stopped too early. |
| UCA-05 | brake_request | Provided outside ODD. |
| UCA-06 | warning_state | Remains SAFE in unsafe condition. |
| UCA-07 | warning_state | Escalates too aggressively. |
| UCA-08 | friction_assumption | Wet road treated as dry. |
| UCA-09 | delay_assumption | Delay not included. |

---

## Safety Constraints

The detailed safety constraints are stored in:

`data/safety_constraints.csv`

| Constraint ID | Safety Constraint Summary |
|---|---|
| SC-01 | Generate brake_request when warning state is EMERGENCY_BRAKE. |
| SC-02 | Do not generate brake_request in SAFE or CAUTION states. |
| SC-03 | Classify EMERGENCY_BRAKE when TTC is below emergency threshold. |
| SC-04 | Keep brake_request linked to the critical warning state. |
| SC-05 | Define the ODD and exclude unsupported conditions. |
| SC-06 | Do not remain SAFE when TTC or stopping-distance thresholds indicate risk. |
| SC-07 | Avoid EMERGENCY_BRAKE in normal SAFE scenarios. |
| SC-08 | Use wet-road friction assumptions for wet-road scenarios. |
| SC-09 | Include actuator delay in stopping-distance calculation. |

---

## Link to Verification

The STPA-Lite analysis is connected to the existing scenario-based verification.

| Safety Topic | Verification Evidence |
|---|---|
| SAFE scenario should not trigger brake_request | SCN-01 |
| CAUTION scenario should not trigger brake_request | SCN-02 |
| WARNING scenario should classify high risk | SCN-03 and SCN-04 |
| EMERGENCY_BRAKE should trigger brake_request | SCN-05 |
| Actuator delay should affect stopping distance | SCN-06 |
| ODD should define supported conditions | docs/15_operational_design_domain.md |

---

## Link to Project Scope

This analysis strengthens safety reasoning while keeping the project at concept level.

It supports the project message:

This project follows a lightweight MBSE/RFLP workflow suitable for university-level concept design and MATLAB-based scenario verification.

It does not claim to be a complete industrial MBSE implementation or a production-ready brake-by-wire system.

---

## Conclusion

The STPA-Lite analysis improves the project by identifying potential unsafe control actions and linking them to simple safety constraints.

It shows that the brake_request logic is considered from a safety-engineering perspective without expanding the project into industrial functional-safety certification.
