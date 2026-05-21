# Simulink Verification Model

## Purpose
This document describes the presentation-ready Simulink model developed for concept-level verification of the emergency brake-request logic of a low-speed urban EV.

## Model File
`models/urban_ev_bbw_warning_logic_final_presentation.slx`

## Model Figure
`figures/simulink_presentation_model.png`

## Model Structure
The Simulink model is organized into five presentation-ready subsystems:

1. Scenario Definition
2. Risk Estimation
3. Warning and Brake Decision
4. Requirement Verification
5. Results and Logging

## Scenario Used
The default test scenario is SCN-05: sudden stationary obstacle.

| Input | Value |
|---|---:|
| Ego speed | 40 km/h |
| Target distance | 10 m |
| Relative speed | 40 km/h |
| Road friction coefficient | 0.75 |
| Actuator delay | 0.2 s |
| Expected warning state | 3 = EMERGENCY_BRAKE |

## Expected and Observed Output
| Output | Result |
|---|---:|
| stopping_distance_m | 10.6121 m |
| ttc_s | 0.9000 s |
| warning_state_code | 3 |
| brake_request | 1 |
| state_match | 1 |

## Interpretation
The model correctly identifies SCN-05 as an emergency braking case. The warning state reaches EMERGENCY_BRAKE, the brake request is activated, and the verification output confirms that the actual warning state matches the expected state.

## Scope Limitation
This is a concept-level Simulink verification model. It does not represent a production brake-by-wire system, real sensor fusion, certified safety logic, or hardware-level actuator control.
