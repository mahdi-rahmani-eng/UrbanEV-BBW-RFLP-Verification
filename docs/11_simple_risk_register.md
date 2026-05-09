# 11 - Simple Risk Register

## Purpose

This document identifies the main project risks and the mitigation actions used to keep the project realistic, executable, and scope-safe.

The risk register is intentionally simple and suitable for a university-level concept-design and internship portfolio project.

It does not claim a full industrial risk-management process, FMEA, HARA, ISO 26262 safety analysis, or Automotive SPICE compliance.

---

## Risk Register

| Risk ID | Risk | Impact | Likelihood | Mitigation | Status |
|---|---|---|---|---|---|
| RISK-01 | Overclaiming autonomous driving capability | High | Medium | Clearly state that the project does not include full autonomous driving, real perception, sensor fusion, or production AEB. | Controlled |
| RISK-02 | Overclaiming production brake-by-wire design | High | Medium | Use concept-level wording and define limitations related to ECU, actuator dynamics, redundancy, diagnostics, and certification. | Controlled |
| RISK-03 | MATLAB model too simplified | Medium | Medium | Explain modelling assumptions and keep the model aligned with concept-level verification rather than production validation. | Controlled |
| RISK-04 | Weak connection between requirements and verification | High | Low | Add verification plan, traceability matrix, and traceability links from requirements to functions, architecture, and scenarios. | Controlled |
| RISK-05 | Scenario coverage too limited | Medium | Medium | Include multiple dry-road, wet-road, close-distance, TTC-based, and actuator-delay scenarios. | Partially controlled |
| RISK-06 | Requirements written too vaguely | Medium | Medium | Add requirements quality review and avoid vague terms where possible. | Controlled |
| RISK-07 | Concept selection appears subjective | Medium | Medium | Use concept generation, concept screening, and MATLAB-based weighted concept scoring. | Controlled |
| RISK-08 | RFLP appears only as documentation | Medium | Medium | Add functions, logical blocks, physical components, allocation tables, and traceability links. | Controlled |
| RISK-09 | Project becomes too large for university scope | Medium | Medium | Keep System Composer, Simulink Test, ROS2, ISO 26262, and real sensors as future work only. | Controlled |
| RISK-10 | Reviewer cannot quickly run the project | Medium | Low | Provide a demo guide and keep run_all.m as the single main execution script. | Planned |
| RISK-11 | Previous ADAS projects create confusion about scope | Medium | Medium | Explain that previous projects focused on perception and warning, while this project focuses on downstream brake-request verification. | Controlled |
| RISK-12 | Brake request logic too simplistic | Low | Medium | State that brake_request is binary and concept-level only; partial braking and control-law design are future work. | Controlled |

---

## Risk Categories

| Category | Related Risks | Explanation |
|---|---|---|
| Scope risk | RISK-01, RISK-02, RISK-09, RISK-11 | Risks related to overclaiming or making the project too large. |
| Technical risk | RISK-03, RISK-05, RISK-12 | Risks related to simplified models and limited scenario coverage. |
| Systems-engineering risk | RISK-04, RISK-06, RISK-08 | Risks related to weak requirements, RFLP, or traceability. |
| Usability/review risk | RISK-07, RISK-10 | Risks related to whether the project is understandable and executable by a reviewer. |

---

## Main Mitigation Strategy

The main mitigation strategy is to keep the project scope clear and lightweight.

The project focuses on:

- low-speed urban EV concept design;
- concept-level emergency brake-request logic;
- MATLAB-based scenario verification;
- lightweight MBSE/RFLP documentation;
- traceability between needs, requirements, functions, logical blocks, physical concepts, and verification items.

The project does not include:

- real sensor perception;
- sensor fusion;
- production brake-by-wire design;
- ISO 26262 compliance;
- SOTIF compliance;
- HIL/SIL validation;
- full autonomous emergency braking.

---

## Most Important Controlled Risks

### Overclaiming autonomy

This risk is controlled by clearly stating that the project uses simplified scenario-level inputs and does not include real camera, radar, YOLO, ROS2, or sensor fusion in the main version.

### Overclaiming brake-by-wire

This risk is controlled by using the phrase concept-level brake-by-wire emergency brake-request logic and by excluding production ECU design, redundancy, diagnostics, hydraulic backup, and safety certification.

### Weak traceability

This risk is controlled by adding traceability links between stakeholder needs, requirements, functions, logical blocks, physical/concept components, and verification items.

### Limited scenario coverage

This risk is partially controlled by using six representative scenarios. More scenarios can be added as future work.

---

## Scope Note

This risk register is a lightweight engineering-management artifact.

It is not a full FMEA, HARA, ISO 26262 work product, SOTIF analysis, or industrial risk-management document.

---

## Conclusion

The simple risk register helps make the project more realistic and defensible.

It shows that the project risks are understood and controlled without expanding the project beyond a university-level concept-design scope.
