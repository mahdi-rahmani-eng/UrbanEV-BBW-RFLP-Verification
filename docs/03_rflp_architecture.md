# RFLP Architecture Overview

This project follows a lightweight MBSE/RFLP-inspired workflow for the concept-level design and verification of a low-speed urban EV emergency braking logic.

The workflow connects:

- Requirements
- Functions
- Logical architecture
- Physical architecture
- Scenario-based verification

The project does not claim complete industrial MBSE implementation or production-ready brake-by-wire design.

---

# R — Requirements Layer

The requirements layer defines the main engineering goals and constraints of the project.

Main requirement groups:

- Vehicle concept requirements
- Emergency brake-request logic requirements
- Verification and traceability requirements

Examples:

- Urban operating envelope limited to low-speed operation
- Minimum estimated urban range
- TTC-based warning classification
- Brake request only during EMERGENCY_BRAKE state
- Traceability between requirements and verification scenarios

---

# F — Functional Architecture

The functional architecture defines what the system must do independently from implementation details.

Main functions:

| Function ID | Function |
|---|---|
| F1 | Define low-speed urban EV concepts |
| F2 | Estimate energy consumption and range |
| F3 | Calculate stopping distance |
| F4 | Calculate Time-To-Collision (TTC) |
| F5 | Classify warning state |
| F6 | Generate emergency brake request |
| F7 | Execute scenario-based verification |
| F8 | Select actuator concept |
| F9 | Generate traceability outputs |

---

# L — Logical Architecture

The logical layer decomposes the system into interacting logical blocks.

Main logical blocks:

| Logical Block ID | Logical Block |
|---|---|
| L1 | Vehicle concept manager |
| L2 | Range estimation logic |
| L3 | Braking-distance logic |
| L4 | TTC calculation logic |
| L5 | Warning-state classifier |
| L6 | Brake-request logic |
| L7 | Scenario-verification engine |
| L8 | Actuator-selection logic |
| L9 | Traceability manager |

Information flow:

Scenario inputs → TTC logic + stopping-distance logic → warning classification → brake-request decision → verification output

---

# P — Physical / Concept Layer

The physical layer maps logical functions to simplified concept-level physical elements.

| Physical ID | Physical / Concept Element |
|---|---|
| P1 | Low-speed urban EV concepts |
| P2 | Vehicle-speed signal |
| P3 | Relative-speed input |
| P4 | Target-distance input |
| P5 | MATLAB verification scripts |
| P6 | Warning-state output |
| P7 | Concept-level brake actuator candidate |
| P8 | Result CSV outputs |
| P9 | Verification figures |

The selected actuator candidate is:

- A2 — Electro-hydraulic brake actuator

This actuator is selected only at concept level and is not a detailed production actuator design.

---

# Scenario-Based Verification

The verification layer evaluates the emergency brake-request logic under simplified dry-road and wet-road operating conditions.

Verification inputs:

- Ego speed
- Target distance
- Relative speed
- Road friction coefficient
- Actuator delay

Verification outputs:

- Stopping distance
- TTC
- Warning state
- Brake request
- Pass/check result

---

# Scope and Positioning

This project is intentionally limited to university-level concept design and MATLAB-based verification.

The project includes:

- Lightweight MBSE/RFLP workflow
- Concept-level emergency brake-request logic
- Simplified actuator-delay modelling
- Scenario-based verification
- Requirements traceability

The project does NOT include:

- Real brake pressure control
- Hydraulic dynamics
- ECU implementation
- Redundancy handling
- ISO 26262 compliance
- Real sensor fusion
- Real autonomous driving stack
- Production-ready brake-by-wire implementation