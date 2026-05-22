# 3-Minute Presentation Summary

## Purpose
This document provides a short 3-minute oral summary of the UrbanEV-BBW-RFLP-Verification project.

## 3-Minute Script

Good morning. Today I will briefly present my project: Lightweight MBSE/RFLP and Simulink Verification of Emergency Brake-Request Logic for a Low-Speed Urban EV.

The project starts from a simple engineering need: a low-speed urban electric vehicle should be able to identify a critical forward-risk situation and generate an emergency brake request. The goal is not to design a production brake-by-wire system, but to build a concept-level verification workflow.

First, I defined the system from a black-box point of view. The main inputs are ego speed, target distance, relative speed, road friction, and actuator delay. The main outputs are the warning state, the brake request, and the verification result.

Then, I moved to the white-box analysis. I decomposed the internal logic into five Simulink subsystems: Scenario Definition, Risk Estimation, Warning and Brake Decision, Requirement Verification, and Results and Logging.

The Risk Estimation subsystem computes stopping distance and time-to-collision. These two indicators are then used by the Warning and Brake Decision subsystem to classify the situation as SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE.

The brake request is activated only when the warning state reaches EMERGENCY_BRAKE. After that, the Requirement Verification subsystem compares the actual warning state with the expected state defined in the scenario catalogue.

I tested the model using six scenarios, from normal following to a sudden stationary obstacle. I also created an official Simulink Test Manager suite for all six scenarios. The Test Manager result showed six successful scenario tests, covering SAFE, CAUTION, WARNING, and EMERGENCY_BRAKE behaviour.

Finally, I added requirement-to-test traceability and a justification document for requirements that are outside the concept-level scope, such as real brake hardware, real sensor fusion, HIL testing, and ISO 26262 compliance.

In conclusion, this project demonstrates a lightweight MBSE/RFLP and MATLAB/Simulink workflow for concept-level verification of emergency brake-request logic. It is testable, traceable, presentation-ready, and scope-safe.

## Very Short Final Statement
This project is a concept-level MBSE/RFLP and MATLAB/Simulink verification workflow for emergency brake-request logic in a low-speed urban EV. It connects requirements, scenarios, Simulink architecture, scenario-based testing, Test Manager results, and traceability without claiming production brake-by-wire validation.
