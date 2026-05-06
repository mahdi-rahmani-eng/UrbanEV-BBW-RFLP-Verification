# Scenario Catalogue

This document defines the simplified verification scenarios used to evaluate the concept-level emergency brake-request logic.

The scenarios are intentionally simplified and are designed for university-level MATLAB-based verification.

The verification workflow evaluates:

- Stopping distance
- Time-To-Collision (TTC)
- Warning-state classification
- Brake-request generation
- Effect of actuator delay

---

# Scenario Assumptions

General assumptions:

- Low-speed urban EV operating domain
- Simplified longitudinal motion only
- Constant friction coefficient
- Constant relative speed
- Simplified actuator/controller delay
- No steering or lateral dynamics
- No sensor uncertainty modelling
- No real object detection pipeline

Stopping distance model:

\[
d_{stop} = v \cdot t_{delay} + \frac{v^2}{2 \mu g}
\]

TTC model:

\[
TTC = \frac{target\ distance}{relative\ speed}
\]

---

# Scenario Definitions

| Scenario ID | Ego Speed [km/h] | Target Distance [m] | Relative Speed [km/h] | Road Condition | Friction μ | Delay [s] | Expected State |
|---|---:|---:|---:|---|---:|---:|---|
| SCN-01 | 20 | 25 | 5 | Dry | 0.75 | 0.20 | SAFE |
| SCN-02 | 30 | 18 | 10 | Dry | 0.75 | 0.20 | CAUTION |
| SCN-03 | 30 | 10 | 15 | Dry | 0.75 | 0.20 | WARNING |
| SCN-04 | 30 | 12 | 20 | Wet | 0.45 | 0.20 | WARNING |
| SCN-05 | 40 | 10 | 40 | Dry | 0.75 | 0.20 | EMERGENCY_BRAKE |
| SCN-06 | 30 | 12 | 15 | Wet | 0.45 | 0.35 | WARNING |

---

# Scenario Interpretation

## SCN-01 — Safe Following

The target distance and TTC are sufficiently large.

Expected result:

- SAFE state
- No brake request

---

## SCN-02 — Moderate Urban Risk

The TTC decreases while stopping distance remains acceptable.

Expected result:

- CAUTION state
- No brake request

---

## SCN-03 — Elevated Risk

The target distance becomes close to stopping distance and TTC decreases significantly.

Expected result:

- WARNING state
- No brake request

---

## SCN-04 — Wet-Road Reduced Friction

Wet-road friction increases stopping distance.

Expected result:

- WARNING state
- No brake request

---

## SCN-05 — Critical Emergency Condition

High relative speed and short target distance produce a very small TTC.

Expected result:

- EMERGENCY_BRAKE state
- brake_request = 1

---

## SCN-06 — Delay-Sensitive Wet-Road Case

The actuator/controller delay is increased under wet-road conditions.

This scenario demonstrates that actuator delay can influence stopping distance and warning classification.

Expected result:

- WARNING state
- No brake request

---

# Verification Philosophy

The project uses simplified scenario-based verification rather than full vehicle validation.

The objective is to demonstrate:

- Requirement-to-verification traceability
- Consistent warning-state logic
- Impact of TTC and stopping distance
- Impact of actuator delay assumptions
- Lightweight MBSE/RFLP workflow integration

The scenarios are intentionally limited to concept-level engineering analysis.