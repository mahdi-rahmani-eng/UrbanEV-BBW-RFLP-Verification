# 02 — Black Box Analysis

## Purpose

This document defines the external view of the system before entering the internal functional, logical, and physical architecture.

In this project, Black Box Analysis is used to clarify the mission, system boundary, external actors, external interfaces, operating modes, and services provided by the system.

The objective is to keep the project aligned with a university-level concept-design workflow and to avoid overclaiming a production brake-by-wire or industrial MBSE implementation.

---

## System of Interest

The system of interest is a low-speed urban electric vehicle concept extended with concept-level brake-by-wire emergency brake-request logic.

The system is considered at concept level only.

It includes:

- simplified vehicle-level concept modelling;
- range estimation;
- stopping-distance estimation;
- TTC calculation;
- warning-state classification;
- emergency brake-request logic;
- actuator-delay modelling;
- MATLAB-based scenario verification.

It excludes:

- real perception;
- real camera/radar sensing;
- real ECU implementation;
- real actuator dynamics;
- hydraulic pressure control;
- ISO 26262 analysis;
- SOTIF analysis;
- hardware-in-the-loop testing;
- production autonomous emergency braking.

---

## Global Mission

The global mission of the system is:

> The low-speed urban EV concept shall support simplified campus/urban operation and allow concept-level verification of emergency brake-request logic under dry and wet road scenarios.

---

## Simplified Lifecycle

The lifecycle is simplified because this project is limited to concept-level modelling and virtual verification.

| Lifecycle Phase | Description |
|---|---|
| LC-01 Needs definition | Define the educational and engineering purpose of the project. |
| LC-02 Concept definition | Define three low-speed urban EV concepts. |
| LC-03 Concept modelling | Estimate range, braking distance, and concept-selection scores using MATLAB. |
| LC-04 Concept selection | Select the most balanced vehicle concept using a decision matrix. |
| LC-05 Architecture definition | Define lightweight RFLP architecture for the emergency braking logic. |
| LC-06 Scenario verification | Verify the brake-request logic using simplified MATLAB scenarios. |
| LC-07 Documentation and release | Store results, figures, traceability, and README documentation in GitHub. |
| LC-08 Future extension | Optionally transfer the workflow to System Composer or Simulink Test. |

---

## System Boundary

### Inside the Boundary

- low-speed urban EV concept parameters;
- simplified vehicle-level MATLAB models;
- stopping-distance model;
- TTC model;
- warning-state logic;
- emergency brake-request logic;
- actuator-delay assumption;
- scenario catalogue;
- requirement verification logic;
- traceability matrix.

### Outside the Boundary

- real camera or radar perception;
- YOLO, ROS2, or sensor fusion in the main version;
- real brake pressure dynamics;
- detailed hydraulic model;
- real brake-by-wire ECU;
- redundancy and failure-handling architecture;
- ISO 26262 or SOTIF compliance;
- HIL/SIL validation;
- production AEB functionality.

---

## External Actors

| Actor ID | Actor | Role |
|---|---|---|
| ACT-01 | Driver/User | Receives warning state and benefits from emergency brake-request logic. |
| ACT-02 | Road Environment | Provides dry or wet road condition affecting friction. |
| ACT-03 | Target/Object Ahead | Represents the obstacle or vehicle ahead. |
| ACT-04 | Scenario File | Provides simplified input data for MATLAB verification. |
| ACT-05 | MATLAB Verification Environment | Executes models and generates result files. |
| ACT-06 | Reviewer/Instructor | Reviews whether the workflow follows concept-design and RFLP logic. |
| ACT-07 | Upstream ADAS/Risk Input | Represents simplified upstream perception/risk information, not real sensor processing. |

---

## External Interfaces

The external interfaces are defined in:

`data/interfaces.csv`

Main external inputs:

- ego speed;
- target distance;
- relative speed;
- road condition;
- friction coefficient;
- actuator delay.

Main external outputs:

- warning state;
- brake request;
- verification result.

---

## User Operating Modes

The project uses a simplified operating-mode view.

| Mode ID | Mode | Description |
|---|---|---|
| MODE-00 | OFF | The vehicle/braking logic is not active. |
| MODE-01 | READY | Scenario inputs are loaded and the model is ready to run. |
| MODE-02 | DRIVE_MONITORING | Vehicle state and target information are monitored. |
| MODE-03 | SAFE | No critical risk is detected. |
| MODE-04 | CAUTION | A close but not critical condition is detected. |
| MODE-05 | WARNING | A high-risk condition is detected and warning is required. |
| MODE-06 | EMERGENCY_BRAKE_REQUEST | Emergency brake request is generated. |
| MODE-07 | STOPPED | The vehicle is assumed to have reached a stopped condition in the simplified scenario logic. |

The warning-state machine used in the MATLAB verification is a simplified behavioural representation of the operating logic.

---

## Services Provided by the System

| Service ID | Service | Main Actor | Output |
|---|---|---|---|
| SRV-01 | Estimate vehicle concept range | Reviewer/Instructor | Estimated range for each concept |
| SRV-02 | Estimate stopping distance | MATLAB Verification Environment | Stopping distance |
| SRV-03 | Calculate TTC | MATLAB Verification Environment | Time to collision |
| SRV-04 | Classify warning state | Driver/User | SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE |
| SRV-05 | Generate emergency brake request | Driver/User / Verification Manager | brake_request = 0 or 1 |
| SRV-06 | Verify scenario result | Reviewer/Instructor | Pass/Fail result |
| SRV-07 | Maintain traceability | Systems engineer | Requirement-to-verification traceability |

---

## Functional Scenarios at Black-Box Level

| Scenario ID | Black-Box Scenario | Description |
|---|---|---|
| BB-SCN-01 | Normal following | The system receives safe distance and speed inputs and classifies the state as SAFE. |
| BB-SCN-02 | Close target | The system receives a close target condition and classifies the state as CAUTION. |
| BB-SCN-03 | High closing risk | The system receives a high closing-speed condition and classifies the state as WARNING. |
| BB-SCN-04 | Wet-road risk | The system receives wet-road friction and updates stopping-distance-based risk. |
| BB-SCN-05 | Sudden obstacle | The system receives a critical TTC condition and generates an emergency brake request. |
| BB-SCN-06 | Delay-sensitive wet case | The system includes actuator delay and checks whether the risk classification changes. |

---

## Link to White Box Analysis

The Black Box Analysis defines the external view of the system.

The next step is White Box Analysis, where the internal structure is progressively defined through:

- functional architecture;
- logical architecture;
- physical/concept architecture;
- RFLP allocation;
- MATLAB-based verification.

This project keeps the White Box Analysis lightweight and documentation-based, supported by MATLAB scripts and CSV traceability tables.
