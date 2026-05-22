# Black Box Mandatory Diagrams

## Purpose
This document summarizes the visual Black Box diagrams created for the UrbanEV-BBW-RFLP-Verification project.

These diagrams strengthen the mandatory-content alignment by showing the system life cycle, context, external interfaces, operating modes, and services before entering the white-box architecture.

## Generated Figures

| Figure | Purpose |
|---|---|
| `figures/lifecycle_diagram.png` | Shows the project life-cycle path from needs to documentation and presentation. |
| `figures/system_context_diagram.png` | Shows external actors around the black-box system. |
| `figures/external_interface_diagram.png` | Shows input and output interfaces crossing the system boundary. |
| `figures/operating_modes_diagram.png` | Shows SAFE, CAUTION, WARNING, EMERGENCY BRAKE, and VERIFICATION modes. |
| `figures/services_use_case_diagram.png` | Shows the services provided by the concept-level system. |

## Interpretation

The Black Box diagrams define the system from an external viewpoint. At this level, the internal Simulink blocks are not yet the focus.

The system is described by what it receives, what it produces, which actors interact with it, which modes it can represent, and which services it provides.

## Link to White Box Analysis

After this Black Box definition, the project moves to White Box Analysis, where the internal functions are decomposed into Simulink subsystems such as Risk Estimation, Warning and Brake Decision, Requirement Verification, and Results and Logging.

## Scope Reminder

These diagrams support concept-level system engineering and course presentation. They do not represent a production brake-by-wire architecture, real sensor-fusion architecture, or certified safety architecture.
