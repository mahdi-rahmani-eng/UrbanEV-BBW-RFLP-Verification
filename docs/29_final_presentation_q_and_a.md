# Final Presentation Q&A

## Purpose
This document prepares answers to likely questions during the oral presentation of the UrbanEV-BBW-RFLP-Verification project.

## Q1. What is the main goal of this project?
The main goal is to demonstrate a lightweight MBSE/RFLP workflow for concept-level verification of emergency brake-request logic in a low-speed urban electric vehicle.

The project connects requirements, scenarios, MATLAB models, Simulink architecture, scenario-based testing, Simulink Test Manager results, and traceability.

## Q2. Is this a real-vehicle brake-hardware system system?
No. This is not a production brake-by-wire system.

It is a concept-level verification model. The output is a logical brake request, not a real actuator command for production hardware.

## Q3. Why did you use Simulink?
Simulink was used because it makes the internal functional architecture visible and easier to verify.

Instead of only showing MATLAB scripts, the Simulink model shows the flow from scenario inputs to risk estimation, warning-state decision, brake request, requirement verification, and result logging.

## Q4. What is the difference between the MATLAB part and the Simulink part?
The MATLAB part supports calculation, scenario verification, result generation, and documentation.

The Simulink part provides a block-level functional architecture and a model-based verification view.

Together, they make the project stronger because MATLAB gives reproducible results and Simulink gives a clear functional model.

## Q5. What is tested in the project?
The project tests the warning-state classification and emergency brake-request logic across six scenarios.

The tested outputs include stopping distance, TTC, warning_state_code, brake_request, and state_match.

## Q6. What does state_match mean?
state_match is the verification output.

It becomes 1 when the actual warning state produced by the model matches the expected warning state defined in the scenario catalogue.

## Q7. What are the warning states?
The model uses four warning states:

| Code | State |
|---:|---|
| 0 | SAFE |
| 1 | CAUTION |
| 2 | WARNING |
| 3 | EMERGENCY_BRAKE |

## Q8. When does brake_request become 1?
brake_request becomes 1 only when warning_state_code is 3.

State code 3 means EMERGENCY_BRAKE.

## Q9. Why did you create Simulink Test Manager results?
Simulink Test Manager was added to make the testing phase more formal and closer to a model-based testing workflow.

It provides official test cases and execution results for the scenario catalogue.

## Q10. How many scenarios were tested?
Six scenarios were tested: SCN-01 to SCN-06.

They cover SAFE, CAUTION, WARNING, and EMERGENCY_BRAKE behaviour.

## Q11. What is the most important test scenario?
SCN-05 is the most critical scenario because it represents a sudden stationary obstacle.

In this scenario, the model should reach EMERGENCY_BRAKE, activate brake_request, and return state_match = 1.

## Q12. Why are some requirements not fully tested?
Some engineering aspects are outside the scope of this concept-level project.

For example, real brake hardware, real sensor fusion, HIL/SIL validation, ISO 26262-level industrial safety assessment, and production actuator validation are not included.

These are documented as limitations to avoid overclaiming.

## Q13. Is this an autonomous emergency braking system?
No. It should not be presented as a complete autonomous emergency braking system.

It is a concept-level emergency brake-request logic model. It does not include real perception, sensor fusion, production control, or certified safety validation.

## Q14. How is this project aligned with the course workflow?
The project follows the course workflow: starting from needs, black-box analysis, requirements, concept selection, white-box analysis, functional architecture, traceability, testing and validation, Test Manager results, and before/after testing reflection.

## Q15. What improved after adding the testing phase?
Before testing, the project had a Simulink demonstration model.

After testing, it had scenario-based verification, PASS/FAIL evidence, Test Manager results, requirement-to-test traceability, and documented limitations.

## Q16. What is the strongest point of the project?
The strongest point is that the project is traceable.

It connects requirements, scenarios, functional architecture, Simulink model, test results, and final limitations in a consistent workflow.

## Q17. What is the main limitation?
The main limitation is that the project remains concept-level.

It does not validate real vehicle hardware or formally approved safety behaviour.

## Q18. What is the correct final claim?
The correct final claim is:

`Concept-level MBSE/RFLP and MATLAB/Simulink verification of emergency brake-request logic for a low-speed urban EV.`
