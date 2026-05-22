# Final Presentation Speaker Script

## Purpose
This document provides a speaker script for presenting the UrbanEV-BBW-RFLP-Verification project.

## Slide 1 - Title
Today I will present my project: Lightweight MBSE/RFLP and Simulink Verification of Emergency Brake-Request Logic for a Low-Speed Urban EV.

The project is not a production brake-by-wire system. It is a concept-level engineering workflow that connects requirements, architecture, MATLAB models, Simulink verification, and Test Manager results.

## Slide 2 - Starting from Needs
The starting need is to verify whether a low-speed urban electric vehicle can identify a critical forward-risk situation and generate an emergency brake request.

The main objective is to show a requirements-driven workflow, not to claim a complete autonomous emergency braking system.

## Slide 3 - Scope and Limitations
The project focuses on concept-level logic.

It includes requirements, scenarios, MATLAB verification, Simulink functional modeling, and Test Manager execution.

It does not include real sensors, real brake hardware, ISO 26262 certification, HIL testing, or production brake-by-wire validation.

## Slide 4 - Black Box Analysis
In the black-box view, I treat the system from the outside.

The main inputs are ego speed, target distance, relative speed, road friction, and actuator delay.

The main outputs are warning_state_code, brake_request, and state_match.

## Slide 5 - Requirements and Scenarios
The behaviour of the system is defined through requirements and six scenarios.

The scenarios cover different risk levels, from normal following to a sudden stationary obstacle.

This gives the project a structured basis for verification.

## Slide 6 - Concept Selection
Before moving to the internal model, the project includes concept-selection and actuator-selection logic.

This follows the engineering idea that alternatives should be evaluated before detailed modeling.

## Slide 7 - White Box Analysis
In the white-box stage, the system is opened internally.

The internal logic is decomposed into five functional blocks: Scenario Definition, Risk Estimation, Warning and Brake Decision, Requirement Verification, and Results and Logging.

## Slide 8 - Simulink Functional Architecture
This slide shows the final Simulink architecture.

The model starts from scenario inputs, computes risk indicators, classifies the warning state, generates the brake request, and finally verifies the result.

This makes the internal logic visible and presentation-ready.

## Slide 9 - Risk Estimation
The Risk Estimation subsystem computes two main indicators.

The first is stopping distance, using speed, friction, gravity, and actuator delay.

The second is time-to-collision, or TTC, based on target distance and relative speed.

These two values are used by the decision logic.

## Slide 10 - Warning and Brake Decision
The Warning and Brake Decision subsystem converts the risk indicators into a discrete warning state.

The model uses four states: 0 for SAFE, 1 for CAUTION, 2 for WARNING, and 3 for EMERGENCY_BRAKE.

The brake request becomes 1 only when the warning state reaches EMERGENCY_BRAKE.

## Slide 11 - Requirement Verification
The Requirement Verification subsystem compares the actual warning state with the expected scenario state.

If the actual output matches the expected output, state_match becomes 1.

This gives a simple PASS/FAIL-style verification signal.

## Slide 12 - Scenario-Based Testing
After building the Simulink model, I tested it across all six scenarios from SCN-01 to SCN-06.

For each scenario, the model output was compared with the expected warning state.

This gives stronger evidence than testing only one emergency case.

## Slide 13 - Simulink Test Manager Results
To make the testing phase more formal, I also created a Simulink Test Manager suite.

The suite includes all six scenarios and executes them as official test cases.

The Test Manager result showed six successful scenario tests.

## Slide 14 - Requirement-to-Test Traceability
The project also includes requirement-to-test traceability.

This means each scenario test is connected to a verification objective and a related Simulink subsystem.

This prevents the tests from being isolated simulations.

## Slide 15 - Requirements Not Fully Tested
Some engineering aspects were intentionally not tested.

For example, real brake hardware, real sensor fusion, HIL testing, ISO 26262 compliance, and production actuator validation are outside the scope.

This keeps the project realistic and avoids overclaiming.

## Slide 16 - Before and After Testing
Before testing, the project had a Simulink demonstration model.

After testing, the project had scenario-based verification, PASS/FAIL evidence, Test Manager results, and traceability.

So the project became closer to a real MBSE-style verification workflow.

## Slide 17 - Alignment with Course Workflow
The project follows the course workflow: needs, black-box analysis, requirements, concept selection, white-box analysis, functional architecture, traceability, testing and validation, Test Manager results, and before/after testing reflection.

Some course-example components are different because this project has a different technical scope.

Instead of ETC or AS State, the project focuses on warning-state and emergency brake-request logic.

## Slide 18 - Final Conclusion
In conclusion, this project demonstrates a lightweight MBSE/RFLP and MATLAB/Simulink workflow for concept-level verification of emergency brake-request logic in a low-speed urban EV.

The final result is technically structured, testable, traceable, and scope-safe.

The main claim is concept-level verification, not production brake-by-wire validation.
