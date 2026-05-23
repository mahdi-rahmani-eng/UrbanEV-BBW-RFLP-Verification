# Requirements Not Fully Tested - Justification

## Purpose
This document explains which requirements or engineering aspects were not fully tested in the current project and why they are outside the concept-level verification scope.

## Relation to the Testing and Validation Phase
The course example states that requirements which cannot be tested and validated should be justified. In this project, the Simulink testing focuses on concept-level warning-state classification and emergency brake-request logic.

## Tested Scope
The following aspects were tested through MATLAB/Simulink scenario-based verification and Simulink Test Manager:

| Tested Aspect | Evidence |
|---|---|
| Warning-state classification | SCN-01 to SCN-06 scenario tests |
| Emergency brake-request activation | SCN-05 emergency scenario |
| Stopping-distance estimation | Simulink Risk Estimation subsystem |
| TTC estimation | Simulink Risk Estimation subsystem |
| Expected-state matching | Requirement Verification subsystem |
| Scenario-based verification | `results/simulink_test_validation_results.csv` |
| Official Test Manager execution | `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` |

## Requirements or Aspects Not Fully Tested

| Not Fully Tested Aspect | Reason | Justification |
|---|---|---|
| Real brake-by-wire actuator hardware | No physical actuator or brake rig is used | The project is limited to concept-level brake-request logic, not hardware validation |
| Real vehicle dynamics | No full vehicle dynamics model is implemented | The stopping-distance model is simplified for early concept verification |
| Real sensor fusion | No camera, radar, lidar, or perception pipeline is integrated | Scenario constants are used instead of real sensor inputs |
| ISO 26262 compliance | No formal safety lifecycle or safety case is developed | The project does not claim certified safety compliance |
| HIL/SIL validation | No hardware-in-the-loop or software-in-the-loop test bench is used | The verification is simulation-based in MATLAB/Simulink only |
| Fault tolerance and diagnostics | Fault injection and diagnostic coverage are not implemented | The project focuses on nominal scenario-based warning logic |
| Production brake control | No actuator-level pressure, torque, or hydraulic model is implemented | The output is a logical brake request, not a production actuator command |
| Environmental sensing uncertainty | Sensor noise, false positives, and perception uncertainty are not modeled | The model assumes simplified known scenario inputs |

## Interpretation
The project verifies the internal concept-level decision logic, but it does not validate a production braking system. This distinction is important because the model demonstrates a requirements-driven verification workflow without overclaiming industrial safety readiness.

## Scope-Safe Claim
The correct claim for this project is:

`Concept-level MBSE/RFLP and MATLAB/Simulink verification of emergency brake-request logic for a low-speed urban EV.`

The project should not be presented as a real-vehicle brake-hardware system system, formally approved safety system, complete emergency-braking product stack system, or hardware-validated autonomous driving function.
