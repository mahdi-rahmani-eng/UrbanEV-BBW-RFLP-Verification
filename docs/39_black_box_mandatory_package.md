# Black Box Mandatory Package

## Purpose
This document formalizes the Black Box Analysis package for the UrbanEV-BBW-RFLP-Verification project.

At the black-box level, the internal implementation is not the focus. The system is described through its mission, life cycle, external actors, external interfaces, operating modes, services, stakeholder needs, requirements, and scenario definitions.

## Black Box Mission

The mission of the concept-level system is to evaluate forward driving risk in a low-speed urban EV scenario and generate a logical emergency brake request when the risk becomes critical.

The system is intentionally limited to concept-level verification. It does not claim production brake-by-wire implementation, real sensor fusion, hardware validation, HIL/SIL testing, or ISO 26262 compliance.

## 1. Life Cycle

| Phase ID | Lifecycle Phase | Purpose | Main Output |
|---|---|---|---|
| LC-01 | Needs and mission definition | Define why the concept-level emergency brake-request logic is needed. | Project need and scope |
| LC-02 | Black-box system definition | Define system boundary, inputs, outputs, actors, interfaces, operating modes, and services. | Black-box package |
| LC-03 | Concept generation and screening | Compare alternative vehicle and actuator concepts before selecting the working concept. | Concept screening and scoring results |
| LC-04 | White-box functional decomposition | Decompose the system into internal functions, logical blocks, and verification blocks. | Functional architecture and RFLP mapping |
| LC-05 | MATLAB and Simulink modelling | Implement the concept-level logic using MATLAB calculations and Simulink subsystems. | Executable MATLAB and Simulink models |
| LC-06 | Scenario-based verification and Test Manager execution | Run scenario-based tests and collect PASS/FAIL evidence. | Scenario results, Test Manager evidence, and traceability |
| LC-07 | Presentation, documentation, and scope limitation | Prepare final documentation and clearly state what the project does and does not claim. | Final presentation package and limitations |

## 2. System Context Actors

| Actor ID | Actor | Role in Context | Interaction with System |
|---|---|---|---|
| ACT-01 | Driver | Receives warnings and benefits from emergency brake-request logic. | Receives warning state and brake-request interpretation. |
| ACT-02 | Low-speed urban EV | Represents the vehicle platform where the concept-level logic is applied. | Provides ego speed and receives logical emergency brake request. |
| ACT-03 | Forward target or obstacle | Represents the object used to evaluate forward risk. | Provides target distance and relative speed scenario values. |
| ACT-04 | Road environment | Provides friction and operating condition assumptions. | Provides road friction coefficient and dry/wet condition. |
| ACT-05 | Course evaluator | Assesses whether the project follows the mandatory course workflow. | Reviews requirements, architecture, tests, and limitations. |
| ACT-06 | GitHub reviewer | Reviews repository structure, reproducibility, results, and documentation. | Reviews README, data, models, results, figures, and docs. |

## 3. External Interfaces

| Interface ID | Interface | Direction | Source/Destination | Description |
|---|---|---|---|---|
| IF-01 | ego_speed_kmh | Input | Scenario definition | Ego vehicle speed used to estimate stopping distance. |
| IF-02 | target_distance_m | Input | Scenario definition | Distance between ego vehicle and forward target or obstacle. |
| IF-03 | relative_speed_kmh | Input | Scenario definition | Closing speed used to estimate time-to-collision. |
| IF-04 | friction_mu | Input | Road environment assumption | Road friction coefficient used in simplified braking-distance calculation. |
| IF-05 | actuator_delay_s | Input | Actuator concept assumption | Concept-level delay used to represent brake-request actuation delay. |
| IF-06 | warning_state_code | Output | Warning state machine / driver-HMI concept | Discrete warning-state output: 0 SAFE, 1 CAUTION, 2 WARNING, 3 EMERGENCY_BRAKE. |
| IF-07 | brake_request | Output | Emergency brake-request logic / BBW ECU concept | Binary emergency brake request. It becomes 1 only in EMERGENCY_BRAKE state. |
| IF-08 | state_match | Output | Requirement verification manager | Verification output. It becomes 1 when actual state matches expected scenario state. |

## 4. User/System Operating Modes

| Mode ID | Mode | Code | Description | Trigger Logic |
|---|---|---|---|---|
| MODE-02,CAUTION,1,Forward | risk | is | increasing | and |
| MODE-03,WARNING,2,Forward | risk | is | high | and |
| MODE-04,EMERGENCY_BRAKE,3,Forward | risk | is | critical | and |
| MODE-05,VERIFICATION,N/A,Model | output | is | compared | with |

## 5. Services Provided by the System

| Service ID | Service | Description | Related Output |
|---|---|---|---|
| SERV-01 | Receive scenario inputs | The model receives speed, distance, relative speed, road friction, actuator delay, and expected state. | Scenario input signals |
| SERV-02 | Estimate forward risk | The model computes stopping distance and time-to-collision. | stopping_distance_m, ttc_s |
| SERV-03 | Classify warning state | The model converts risk indicators into SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE. | warning_state_code |
| SERV-04 | Generate emergency brake request | The model outputs brake_request = 1 only when the state is EMERGENCY_BRAKE. | brake_request |
| SERV-05 | Verify and log result | The model compares actual and expected states and saves verification evidence. | state_match and test_result |

## 6. Stakeholder Needs to Requirements

| Need ID | Stakeholder Need | Derived Requirement Intent | Evidence File |
|---|---|---|---|
| NEED-05,The project should be traceable from requirements to tests.,"Link requirements, functions, logical blocks, physical concepts, and tests.",results/simulink | requirement | test | traceability.csv |
| NEED-06,The project should avoid overclaiming production-level safety validation.,"Document limitations such as no real hardware, no sensor fusion, and no ISO 26262 claim.",docs/21 | requirements | not | fully |

## Interpretation

This Black Box package strengthens the project by explicitly documenting the system boundary before entering the white-box Simulink architecture.

The system is treated as a concept-level emergency brake-request logic block. Its external inputs, outputs, operating modes, services, and stakeholder needs are now defined before the internal architecture is discussed.

## Next Step

The next step is to create visual diagrams for the Black Box package: lifecycle diagram, system context diagram, external interface diagram, operating modes diagram, and services/use-case diagram.
