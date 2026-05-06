# UrbanEV-BBW-RFLP-Verification

## Lightweight MBSE/RFLP Concept Design and MATLAB-Based Verification of Concept-Level Brake-by-Wire Emergency Brake-Request Logic for a Low-Speed Urban EV

This project develops a university-level lightweight MBSE/RFLP workflow for a low-speed urban EV.

It compares three vehicle concepts using MATLAB-based range estimation, braking-distance analysis, and normalized decision scoring. The selected concept is then extended into concept-level brake-by-wire emergency brake-request logic, including requirements, RFLP decomposition, actuator concept selection, simplified scenario inputs, and MATLAB-based verification.

---

## Project Positioning

This project follows a lightweight MBSE/RFLP workflow suitable for university-level concept design and MATLAB-based scenario verification.

It does not claim to be:

- a complete industrial MBSE implementation
- a production-ready brake-by-wire system
- a certified safety-critical braking system
- a full autonomous emergency braking system

---

## What This Project Does

- Compares three low-speed urban EV concepts
- Estimates range using a simplified physics-based MATLAB model
- Calculates stopping distance under dry and wet road conditions
- Calculates TTC using target distance and relative speed
- Classifies warning states:
  - SAFE
  - CAUTION
  - WARNING
  - EMERGENCY_BRAKE
- Generates `brake_request = 1` only in the `EMERGENCY_BRAKE` state
- Selects a concept-level actuator candidate
- Links requirements to functions, logical blocks, physical/concept elements, and verification scenarios
- Produces MATLAB-based verification outputs

---

## What This Project Does Not Claim

This project does not claim:

- production-ready brake-by-wire design
- complete industrial MBSE implementation
- ISO 26262 compliance
- SOTIF compliance
- real perception or sensor fusion
- ROS2 integration in the main version
- hardware-in-the-loop or software-in-the-loop validation
- real actuator dynamics
- full autonomous emergency braking
- production AEB functionality

---

## Repository Structure

```text
UrbanEV-BBW-RFLP-Verification/
│
├── README.md
│
├── docs/
│   ├── 01_project_overview.md
│   ├── 02_requirements_table.md
│   ├── 03_rflp_architecture.md
│   ├── 04_scenario_catalogue.md
│   ├── 05_traceability_matrix.md
│   └── 06_scope_and_limitations.md
│
├── data/
│   ├── vehicle_concepts.csv
│   ├── requirements.csv
│   ├── scenarios.csv
│   └── actuator_candidates.csv
│
├── matlab/
│   ├── run_all.m
│   ├── range_estimation_model.m
│   ├── braking_distance_model.m
│   ├── ttc_model.m
│   ├── warning_logic_model.m
│   ├── bbw_emergency_braking_controller.m
│   ├── concept_selection_model.m
│   └── actuator_concept_selection.m
│
├── results/
│   ├── concept_selection_results.csv
│   ├── scenario_verification_results.csv
│   ├── actuator_selection_results.csv
│   ├── traceability_matrix.csv
│   └── verification_summary.md
│
└── figures/
    ├── vehicle_concept_comparison.png
    ├── scenario_verification_summary.png
    ├── warning_state_machine.png
    └── rflp_digital_thread.png
```

---

## Methodology

```text
Vehicle Concept Definition
        ↓
MATLAB-Based Range and Braking Analysis
        ↓
Concept Selection Using Normalized Scoring
        ↓
Lightweight RFLP Decomposition
        ↓
Concept-Level Emergency Brake-Request Logic
        ↓
Scenario-Based MATLAB Verification
        ↓
Requirements-to-Verification Traceability
```

---

## Vehicle Concept Design

Three low-speed urban EV concepts are compared:

| Concept | Description |
|---|---|
| C1 | Campus-focused lightweight EV |
| C2 | Balanced low-speed urban EV |
| C3 | Extended urban EV |

The selected concept is:

```text
C2 — Balanced low-speed urban EV
```

C2 is selected because it provides the best balance between estimated range, braking performance, motor adequacy, mass, and feasibility.

---

## Concept-Level Brake-Request Logic

The emergency brake-request logic uses:

- ego speed
- target distance
- relative speed
- road friction coefficient
- actuator/controller delay

The model calculates:

- stopping distance
- TTC
- warning state
- brake request

Brake request logic:

| Warning State | Brake Request |
|---|---:|
| SAFE | 0 |
| CAUTION | 0 |
| WARNING | 0 |
| EMERGENCY_BRAKE | 1 |

`WARNING` is treated as a driver/HMI warning state, not as an automatic braking command.

---

## Scenario-Based Verification

Six simplified scenarios are used:

| Scenario | Description | Expected State |
|---|---|---|
| SCN-01 | Normal following | SAFE |
| SCN-02 | Close but not critical target | CAUTION |
| SCN-03 | High closing risk | WARNING |
| SCN-04 | Wet-road warning case | WARNING |
| SCN-05 | Sudden stationary obstacle | EMERGENCY_BRAKE |
| SCN-06 | Delay-sensitive wet case | WARNING |

Generated verification results are stored in:

```text
results/scenario_verification_results.csv
results/verification_summary.md
```

---

## Key Figures

### Vehicle Concept Selection

![Vehicle Concept Selection](figures/vehicle_concept_comparison.png)

### Scenario-Based Warning State Summary

![Scenario Verification Summary](figures/scenario_verification_summary.png)

### Warning State Machine

![Warning State Machine](figures/warning_state_machine.png)

### Lightweight RFLP Digital Thread

![RFLP Digital Thread](figures/rflp_digital_thread.png)

---

## Main Results

Current generated results:

```text
Selected concept: C2
Selected actuator: A2
All scenario verification checks: Pass
Brake request is generated only in SCN-05
```

Selected actuator:

```text
A2 — Electro-hydraulic brake actuator
```

The actuator is selected only as a concept-level physical candidate, not as a detailed production actuator design.

---

## How to Run

Open MATLAB, navigate to the repository root folder, and run:

```matlab
run("matlab/run_all.m")
```

The script generates:

```text
results/concept_selection_results.csv
results/scenario_verification_results.csv
results/actuator_selection_results.csv
results/traceability_matrix.csv
results/verification_summary.md

figures/vehicle_concept_comparison.png
figures/scenario_verification_summary.png
figures/warning_state_machine.png
figures/rflp_digital_thread.png
```

---

## Relation to Previous ADAS Projects

This project extends my previous ADAS portfolio from perception-level risk estimation toward downstream vehicle-level emergency braking verification.

My previous projects focused on:

- monocular object detection
- ROI-based relevance filtering
- proxy risk scoring
- ROS2 modularization
- forward-warning generation

In contrast, this project assumes simplified scenario-level risk inputs and focuses on:

- concept-level brake-by-wire emergency brake-request logic
- lightweight MBSE/RFLP decomposition
- actuator concept selection
- MATLAB-based requirement verification

Conceptual chain:

```text
Perception → Risk Estimation → Forward Warning → Emergency Brake Request → Concept-Level Brake-by-Wire Logic → Scenario-Based Verification
```

---

## Limitations

This project is intentionally limited.

It does not include:

- real brake pressure control
- hydraulic dynamics
- ECU implementation
- redundancy handling
- failure handling
- ISO 26262 analysis
- SOTIF analysis
- real sensor fusion
- real perception data
- production AEB functionality

The stopping-distance and TTC models are simplified and are used only for concept-level verification.

---

## Future Work

Possible extensions:

- Transfer the RFLP structure into MATLAB System Composer
- Implement the warning-state logic in Simulink
- Add more detailed actuator dynamics
- Add a simplified interface to upstream ADAS perception outputs
- Add more scenarios with sensor uncertainty and variable road friction