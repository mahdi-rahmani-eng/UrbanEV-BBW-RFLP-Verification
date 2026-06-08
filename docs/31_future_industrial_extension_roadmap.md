# Future Industrial Extension Roadmap

## Purpose

This document summarizes possible future extensions that could make the UrbanEV-BBW-RFLP verification workflow closer to an industrial automotive validation process.

The current project is a concept-level university project. The roadmap below is not claimed as already implemented.

## Current Project Level

The current implementation includes:

- MBSE/RFLP-inspired project structure
- MATLAB/Simulink model-based verification
- Scenario-based validation
- Simulink Test Manager evidence
- Stateflow warning-logic extension
- Automotive-style signal interface
- Requirement-test-result evidence

## Possible Industrial Extensions

| Extension Area | Future Work | Purpose |
|---|---|---|
| HIL Testing | Connect the model to a hardware-in-the-loop test bench | Validate logic under more realistic timing and execution conditions |
| SIL Testing | Run software-in-the-loop tests with generated or embedded-style code | Move closer to ECU-oriented software validation |
| CAN Signal Mapping | Map model signals to CAN-style vehicle communication signals | Improve automotive interface realism |
| AUTOSAR-Oriented Architecture | Structure inputs, outputs, and components with AUTOSAR-style interfaces | Prepare the model for automotive software architecture discussions |
| Functional Safety Analysis | Add hazard analysis, safety goals, and ASIL-oriented reasoning | Move toward ISO 26262-oriented thinking without claiming compliance |
| ASPICE-Oriented Traceability | Improve requirement-to-test-to-result traceability | Align the workflow with software process assessment practices |
| Test Automation | Automate scenario generation and regression testing | Improve repeatability and scalability of validation |
| Extended ODD Coverage | Add more speed, friction, target-distance, and delay combinations | Improve scenario coverage within the defined operational design domain |
| Sensor and Actuator Modeling | Add simplified sensor noise and actuator response models | Improve realism of the validation environment |
| Report Generation | Automatically export validation reports from test results | Improve documentation and review readiness |

## Recommended Next Technical Steps

1. Add a structured CAN-style signal mapping table.
2. Add an extended scenario library with parameterized speed, distance, friction, and delay values.
3. Add automated regression testing scripts for all scenarios.
4. Add a lightweight safety analysis document with hazards and safety goals.
5. Add a simple SIL-ready code-generation discussion without claiming ECU deployment.

## Scope Limitation

This roadmap describes possible future work only.

The current project does not claim production brake-by-wire validation, ISO 26262 compliance, ASPICE compliance, AUTOSAR compliance, HIL/SIL validation, ECU-level validation, or real-vehicle testing.
