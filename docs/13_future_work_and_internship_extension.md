# 13 - Future Work and Internship Extension

## Purpose

This document explains how the current project can be extended in the future.

The purpose is to show that the project is complete at university concept level, but also has a clear growth path toward more advanced automotive, ADAS, and model-based design work.

The future work items are intentionally separated from the main project scope to avoid overclaiming.

---

## Current Project Level

The current project is a lightweight university-level concept design and verification project.

It includes:

- low-speed urban EV concept comparison;
- MATLAB-based range and braking-distance estimation;
- concept selection;
- concept-level brake-by-wire emergency brake-request logic;
- TTC and stopping-distance-based warning classification;
- scenario-based MATLAB verification;
- lightweight MBSE/RFLP documentation;
- traceability between needs, requirements, functions, logical blocks, physical concepts, and verification items.

It does not claim production brake-by-wire design, full autonomous driving, ISO 26262 compliance, SOTIF compliance, HIL/SIL validation, or real sensor fusion.

---

## Future Work Roadmap

| Future Work ID | Extension | Purpose | Difficulty | Suitable for Internship Growth? |
|---|---|---|---|---|
| FW-01 | Add Simulink block-level implementation | Convert the current MATLAB script logic into block-level simulation. | Medium | Yes |
| FW-02 | Add MATLAB System Composer architecture | Transfer the lightweight RFLP architecture into formal component views and interfaces. | Medium | Yes |
| FW-03 | Add Simulink Test cases | Replace or extend script-based verification with formal test cases and assessments. | Medium | Yes |
| FW-04 | Add more realistic sensor-input models | Replace fixed scenario inputs with simplified camera/radar-like distance and speed estimates. | Medium | Yes |
| FW-05 | Add more scenario variations | Include more dry, wet, low-speed, high-closing-speed, and near-threshold cases. | Low | Yes |
| FW-06 | Add relative-speed sensitivity analysis | Study how TTC and warning state change when closing speed changes. | Low | Yes |
| FW-07 | Add actuator-delay sensitivity analysis | Study how different actuator delays affect stopping distance and warning classification. | Low | Yes |
| FW-08 | Add ROS2 bridge as a separate extension | Connect the MATLAB logic to a ROS2 ADAS pipeline in a future branch. | High | Yes, but not in main version |
| FW-09 | Add public driving-scenario datasets | Use public datasets or synthetic data to define more realistic scenario inputs. | High | Yes, later stage |
| FW-10 | Add simple visualization dashboard | Create plots or a small dashboard for scenario results and warning-state transitions. | Low | Yes |
| FW-11 | Add basic fault scenarios | Add simple missing-input or invalid-input cases. | Medium | Yes, but keep separate from ISO 26262 |
| FW-12 | Add simple report generation | Automatically generate a Markdown verification report after run_all.m. | Low | Yes |

---

## Recommended Internship-Level Extensions

The most suitable future extensions for an internship-oriented portfolio are:

1. Simulink block-level implementation;
2. System Composer architecture view;
3. Simulink Test-based verification;
4. More scenario coverage;
5. Sensitivity analysis for TTC and actuator delay;
6. Improved result visualization.

These extensions strengthen the project without turning it into an unrealistic industrial brake-by-wire system.

---

## Extension 1 - Simulink Block-Level Implementation

The current project uses MATLAB scripts.

A future version could implement the main logic in Simulink blocks:

- speed and distance input block;
- stopping-distance calculation block;
- TTC calculation block;
- warning-state logic block;
- brake-request output block;
- verification output block.

This would make the project closer to model-based design while keeping the same simplified assumptions.

---

## Extension 2 - System Composer Architecture

The current RFLP structure is documented using CSV and Markdown files.

A future version could transfer the same architecture into MATLAB System Composer:

- functional architecture;
- logical architecture;
- physical/concept architecture;
- ports and interfaces;
- allocation links;
- requirement links.

This would strengthen the MBSE aspect of the project without changing the main concept-level scope.

---

## Extension 3 - Simulink Test Verification

The current verification is script-based.

A future version could use Simulink Test to define formal test cases and logical assessments.

Example tests:

- check that stopping distance is positive;
- check that TTC is calculated correctly;
- check that warning state follows the threshold table;
- check that brake_request equals 1 in EMERGENCY_BRAKE state;
- check that actuator delay increases stopping distance.

---

## Extension 4 - More Scenario Coverage

The current project uses six representative scenarios.

Future work can add:

- more low-speed campus cases;
- more wet-road cases;
- near-threshold TTC cases;
- false-positive caution cases;
- different actuator-delay values;
- different friction coefficients;
- relative-speed sensitivity cases.

This would improve verification depth while staying within a manageable academic scope.

---

## Extension 5 - Link to Previous ADAS Projects

The current project assumes simplified scenario-level risk inputs.

A future extension could connect this downstream brake-request logic to previous ADAS perception and warning projects.

Possible future chain:

Perception -> Risk Assessment -> Warning Logic -> Brake Request -> Brake-by-Wire Concept Logic -> Scenario Verification

This connection should remain a future extension unless real integration is implemented.

---

## Extensions Not Included in the Main Project

The following topics are intentionally not included in the main version:

- full ISO 26262 analysis;
- full SOTIF analysis;
- full Automotive SPICE compliance;
- detailed FMEA;
- production ECU design;
- real hydraulic brake actuator modelling;
- fail-operational brake-by-wire architecture;
- real sensor fusion;
- CARLA integration;
- ROS2 integration inside the main branch;
- hardware-in-the-loop validation.

These topics may be relevant in industry, but they are outside the scope of the current university-level concept project.

---

## Conclusion

The project is complete at its current intended level: university concept design, lightweight MBSE/RFLP documentation, MATLAB scenario verification, and traceability.

The future work path shows how the project could grow toward Simulink, System Composer, Simulink Test, broader scenario coverage, and possible ADAS integration.

This makes the project suitable for academic presentation, GitHub portfolio use, and internship discussion without making excessive industrial claims.
