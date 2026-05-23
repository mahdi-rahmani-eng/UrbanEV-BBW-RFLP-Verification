# White Box Decomposition Package

## Purpose

This document describes the White Box decomposition stage of the UrbanEV-BBW-RFLP-Verification project.

The White Box stage opens the system and decomposes it into functions, logical blocks, physical allocation, Simulink implementation areas, and verification evidence.

This stage follows the course workflow after Black Box definition and concept selection.

## 1. Functional Decomposition

| Function ID | Function | Purpose | Black-Box Service |
|---|---|---|---|
| F-01 | Receive scenario inputs | Receive ego speed, target distance, relative speed, road friction, and actuator delay. | SERV-01 |
| F-02 | Normalize driving scenario data | Prepare scenario variables for the concept-level verification model. | SERV-01 |
| F-03 | Estimate stopping distance | Estimate whether the vehicle can stop safely under the given road and delay assumptions. | SERV-02 |
| F-04 | Estimate time-to-collision | Estimate collision urgency using distance and closing-speed information. | SERV-02 |
| F-05 | Classify warning state | Classify the situation into SAFE, CAUTION, WARNING, or EMERGENCY BRAKE. | SERV-03 |
| F-06 | Generate emergency brake request | Generate a binary brake-request output when the risk condition becomes critical. | SERV-04 |
| F-07 | Verify and log scenario result | Compare actual outputs with expected scenario outputs and store verification evidence. | SERV-05 |

## 2. Logical Architecture

| Logical Block ID | Logical Block | Allocated Functions | Responsibility |
|---|---|---|---|
| L-02,Risk | Estimation | Logic,"F-03, | F-04","Computes |
| L-03,Warning | State | Logic,"F-05","Converts | risk |
| L-04,Brake | Request | Logic,"F-06","Converts | critical |
| L-05,Requirement | Verification | Logic,"F-07","Checks | expected |
| L-06,Results | and | Logging | Logic,"F-07","Stores |

## 3. Physical Allocation

| Physical Element ID | Physical Element | Allocated Logical Blocks | Role | Scope Note |
|---|---|---|---|---|
| P-02,Concept-level | BBW | controller,"L-02, | L-03, | L-04","Represents |
| P-03,Electric | linear | brake | actuator,"L-04","Represents | the |
| P-04,Wheel-speed | / | ego-speed | source,"L-01","Provides | ego-speed |
| P-05,Forward | target | / | obstacle | assumption,"L-01","Provides |
| P-06,Verification | computer | and | MATLAB/Simulink | environment,"L-05, |

## 4. Function-to-Simulink Mapping

| Function ID | Simulink Model / Test Asset | Implementation Area | Evidence |
|---|---|---|---|
| F-04,urban | ev | bbw | warning |
| F-05,urban | ev | bbw | warning |
| F-06,urban | ev | bbw | warning |
| F-07,UrbanEV | BBW | All | Scenarios |

## 5. White Box Traceability Matrix

| Trace ID | Requirement | Function | Logical Block | Physical Element | Scenario | Evidence |
|---|---|---|---|---|---|---|
| WB-T01 | REQ-BBW-01 | F-01 | L-01 | P-04, P-05 | SCN-01 to SCN-06 | data/scenarios.csv |
| WB-T02 | REQ-BBW-02 | F-03 | L-02 | P-02 | SCN-01 to SCN-06 | results/simulink_test_validation_results.csv |
| WB-T03 | REQ-BBW-03 | F-04 | L-02 | P-02 | SCN-01 to SCN-06 | results/simulink_test_validation_results.csv |
| WB-T04 | REQ-BBW-04 | F-05 | L-03 | P-02 | SCN-01 to SCN-06 | results/simulink_test_validation_results.csv |
| WB-T05 | REQ-BBW-05 | F-06 | L-04 | P-02, P-03 | SCN-03, SCN-05, SCN-06 | results/simulink_test_validation_results.csv |
| WB-T06 | REQ-BBW-06 | F-07 | L-05 | P-06 | SCN-01 to SCN-06 | UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx |
| WB-T07 | REQ-BBW-07 | F-07 | L-06 | P-06 | SCN-01 to SCN-06 | results/simulink_test_validation_results.csv |

## Scope-Safe Interpretation

This White Box decomposition is a university-level concept-design artifact. It does not claim to be a complete industrial MBSE model, certified brake-by-wire architecture, ISO 26262 safety case, or production hardware design.

## Next Step

The next step is to generate presentation-ready White Box diagrams for functional decomposition, logical architecture, physical allocation, and traceability.
