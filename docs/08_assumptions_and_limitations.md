# 08 - Assumptions and Limitations

## Purpose

This document defines the main assumptions and limitations of the project.

The purpose is to keep the project technically clear, realistic, and suitable for a university-level concept-design and MATLAB-based verification workflow.

This project intentionally avoids overclaiming industrial brake-by-wire design, full autonomous driving, or certified safety validation.

---

## Project Assumptions

| Assumption ID | Assumption | Explanation |
|---|---|---|
| ASM-01 | The vehicle is considered a low-speed urban EV. | The project focuses on campus and short urban mobility, not highway operation. |
| ASM-02 | Vehicle concepts are simplified concept-level alternatives. | The three EV concepts are used for comparison and selection, not for production sizing. |
| ASM-03 | Sensor inputs are scenario-based. | Ego speed, target distance, relative speed, road condition, and friction are provided by predefined scenarios, not by real camera or radar data. |
| ASM-04 | Emergency braking logic is evaluated at concept level. | The project models warning-state classification and brake-request generation, not a complete production brake-by-wire system. |
| ASM-05 | MATLAB verification is script-based. | MATLAB scripts are used to run simplified scenario tests and generate CSV and figure outputs. |
| ASM-06 | Road condition is represented by simplified friction coefficients. | Dry and wet road cases are represented using assumed friction values. |
| ASM-07 | Actuator delay is simplified as a fixed time delay. | The model includes delay in stopping-distance calculation but does not model real actuator dynamics. |
| ASM-08 | TTC is calculated using target distance and relative speed. | TTC is used as a simplified risk metric together with stopping distance. |
| ASM-09 | Brake request is binary. | brake_request is either 0 or 1, and is generated only in EMERGENCY_BRAKE state. |
| ASM-10 | Traceability is CSV/documentation-based. | Requirements, functions, logical blocks, physical concepts, and verification items are linked using lightweight tables. |

---

## Project Limitations

| Limitation ID | Limitation | Explanation |
|---|---|---|
| LIM-01 | No real-time perception is included. | The project does not process camera, radar, LiDAR, or real sensor data. |
| LIM-02 | No sensor fusion is included. | The project assumes simplified scenario-level inputs instead of real perception fusion. |
| LIM-03 | No production brake-by-wire design is claimed. | The project does not design a certified ECU, hydraulic backup, redundancy, diagnostics, or fail-operational architecture. |
| LIM-04 | No ISO 26262 compliance is claimed. | Functional-safety certification, HARA, ASIL allocation, and safety case development are outside the project scope. |
| LIM-05 | No SOTIF compliance is claimed. | The project does not address full SOTIF analysis or unknown unsafe scenario coverage. |
| LIM-06 | No HIL or SIL testing is included. | Verification is limited to MATLAB script-based scenario testing. |
| LIM-07 | No real actuator dynamics are modelled. | The brake actuator is represented at concept level only. |
| LIM-08 | No complete AEB system is claimed. | The project models emergency brake-request logic, not a production autonomous emergency braking stack. |
| LIM-09 | No ROS2 or YOLO integration is included in the main version. | Previous ADAS projects are discussed as related work, but this project remains MATLAB-based. |
| LIM-10 | Scenario coverage is limited. | The scenarios cover representative dry/wet and distance/TTC cases, but not exhaustive real-world traffic conditions. |

---

## Scope-Safe Project Positioning

This project follows a lightweight MBSE/RFLP workflow suitable for university-level concept design and MATLAB-based scenario verification.

It does not claim to be a complete industrial MBSE implementation or a production-ready brake-by-wire system.

---

## Why These Assumptions Matter

The assumptions make the project executable and realistic for an academic portfolio project.

They clarify that the project focuses on system thinking, requirements, RFLP architecture, MATLAB modelling, verification logic, and traceability rather than industrial brake-system development.

---

## Conclusion

The project is intentionally limited to a concept-level and script-based workflow.

These assumptions and limitations help keep the project technically honest, defensible, and suitable for GitHub, university review, and internship discussions.
