# Final Presentation Narrative

## Purpose
This document provides a presentation-ready narrative for explaining the UrbanEV-BBW-RFLP-Verification project according to the course mandatory-content structure.

## 1. Starting from Needs
The project starts from the need to verify a concept-level emergency brake-request logic for a low-speed urban electric vehicle.

The goal is not to design a real-vehicle brake-hardware system system, but to show a requirements-driven MBSE/RFLP workflow supported by MATLAB and Simulink verification.

## 2. Black Box Analysis
In the black-box stage, the system is treated from the outside. The main focus is to define the system boundary, operating scenario, inputs, outputs, and requirements.

For this project, the relevant external inputs are ego speed, target distance, relative speed, road friction, and actuator delay.

The main outputs are warning_state_code, brake_request, and state_match.

## 3. Requirements and Scenario Catalogue
The project defines a set of requirements and scenarios. The scenario catalogue includes six cases from normal following to sudden stationary obstacle.

These scenarios are used to check whether the model behaves correctly under different risk levels.

## 4. Concept Selection
The project includes concept-selection and actuator-selection results to support the engineering decision process.

This corresponds to the course logic where alternatives are generated, screened, and scored before moving to more detailed architecture.

## 5. White Box Analysis
In the white-box stage, the system is opened internally and decomposed into functions.

The Simulink model represents this internal functional flow using five subsystems:

1. Scenario Definition
2. Risk Estimation
3. Warning and Brake Decision
4. Requirement Verification
5. Results and Logging

## 6. Simulink Functional Architecture
The Simulink model shows how scenario inputs are transformed into risk indicators, then into a warning state, then into a brake request, and finally into verification outputs.

The Risk Estimation subsystem computes stopping distance and time-to-collision.

The Warning and Brake Decision subsystem classifies the situation as SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE.

## 7. Testing and Validation
The model was first tested through scenario-based MATLAB/Simulink execution for SCN-01 to SCN-06.

For each scenario, the actual warning-state output was compared with the expected warning state.

The testing results confirm that the model behaves consistently with the expected scenario outcomes.

## 8. Simulink Test Manager Results
To make the testing phase closer to the course example, official Simulink Test Manager test cases were added.

The final Test Manager suite covers all six scenarios:

- SCN-01 Normal following
- SCN-02 Close but not critical target
- SCN-03 High closing risk
- SCN-04 Wet-road warning case
- SCN-05 Sudden stationary obstacle
- SCN-06 Delay-sensitive wet case

The Test Manager result showed six successful scenario tests.

## 9. Requirement-to-Test Traceability
The project also includes a requirement-to-test traceability table.

This links each scenario-based test to its verification objective and related Simulink subsystem.

## 10. Requirements Not Fully Tested
Some engineering aspects were intentionally not tested, including real brake-by-wire hardware, real sensor fusion, HIL/SIL testing, ISO 26262-level industrial safety assessment, and production actuator validation.

These are outside the concept-level scope and are documented as limitations.

## 11. Before and After Testing Phase
Before testing, the project had a presentation-ready Simulink model.

After testing, the project had scenario-based verification, PASS/FAIL evidence, Test Manager results, and traceability.

This improves the project from a demonstration model to a stronger MBSE-style verification workflow.

## Final Presentation Statement
This project follows a lightweight MBSE/RFLP workflow for concept-level verification of emergency brake-request logic in a low-speed urban EV.

It starts from requirements and scenarios, develops a Simulink functional architecture, verifies the warning-state and brake-request logic through scenario-based testing, and provides official Simulink Test Manager results.

The project remains scope-safe: it does not claim production brake-by-wire design, certified safety validation, real sensor fusion, HIL testing, or ISO 26262 compliance.
