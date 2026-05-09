# 10 - Engineering Decision Log

## Purpose

This document records the main engineering decisions made during the project.

The purpose is to show that the project choices are intentional, traceable, and suitable for a university-level concept-design and MATLAB-based verification workflow.

This decision log is lightweight and does not claim a full industrial project-management or systems-engineering process.

---

## Engineering Decision Table

| Decision ID | Decision | Reason | Project Impact | Scope Note |
|---|---|---|---|---|
| DEC-01 | Use a low-speed urban EV as the vehicle context. | A low-speed urban EV keeps the project realistic, manageable, and aligned with concept-design scope. | Limits the operating envelope and avoids highway-level complexity. | The project does not claim full vehicle production design. |
| DEC-02 | Compare three vehicle concepts. | Three concepts allow trade-off analysis without making the project too large. | Supports concept generation, screening, scoring, and final selection. | The concepts are simplified alternatives, not production platforms. |
| DEC-03 | Use MATLAB for modelling and verification. | MATLAB is suitable for concept-level numerical calculations, scenario testing, CSV outputs, and figures. | Makes the project executable and reproducible. | The project does not claim Simulink Test, HIL, or SIL validation. |
| DEC-04 | Use lightweight MBSE/RFLP structure. | RFLP connects requirements, functions, logical blocks, physical concepts, and verification. | Improves traceability and system-level thinking. | This is not a complete industrial MBSE implementation. |
| DEC-05 | Use script-based scenario verification. | Script-based verification is simple, transparent, and appropriate for university-level testing. | Allows repeatable tests through run_all.m. | It does not replace industrial validation. |
| DEC-06 | Include stopping distance in braking logic. | Stopping distance is a basic and defensible braking-risk metric. | Supports dry/wet road comparison and delay effects. | The model is simplified and does not include full brake dynamics. |
| DEC-07 | Add TTC to the warning logic. | TTC improves risk estimation beyond distance-only logic. | Allows more meaningful classification of SAFE, CAUTION, WARNING, and EMERGENCY_BRAKE states. | TTC uses simplified scenario inputs, not real sensor fusion. |
| DEC-08 | Include actuator delay. | Delay affects stopping distance and emergency braking feasibility. | Makes the verification more realistic while staying simple. | Delay is fixed and does not model real actuator dynamics. |
| DEC-09 | Use a binary brake request. | A binary output keeps the brake-request logic simple and testable. | brake_request is 1 only in EMERGENCY_BRAKE state. | No partial braking or production control law is claimed. |
| DEC-10 | Select an electro-hydraulic actuator concept. | It provides a balanced concept-level option between controllability and feasibility. | Supports physical architecture and actuator selection. | It is a concept candidate, not a detailed actuator design. |
| DEC-11 | Add traceability links. | Traceability shows how needs, requirements, functions, logical blocks, physical concepts, and verification are connected. | Strengthens the MBSE/RFLP value of the project. | Traceability is CSV/documentation-based, not a formal industrial repository. |
| DEC-12 | Keep ROS2 and YOLO outside the main version. | The project focuses on downstream braking verification, not real perception. | Keeps the scope controlled and avoids mixing too many technologies. | Previous ADAS projects can be mentioned as related work only. |
| DEC-13 | Use V-Model reasoning lightly. | V-Model supports the connection between requirements and verification. | Helps explain why each requirement needs a verification method. | No full V-Model industrial lifecycle is claimed. |
| DEC-14 | Use Agile/Kanban only as a lightweight task-management note. | A simple task board can help organize project execution without adding heavy process overhead. | Useful for internship-level project communication. | No full Scrum or enterprise Agile process is claimed. |

---

## Key Design Rationale

### Why MATLAB?

MATLAB was selected because the project requires simple numerical models, repeatable scenario execution, CSV result generation, and clear plots.

Using MATLAB keeps the project executable without requiring a full Simulink, ROS2, or hardware setup.

### Why Lightweight MBSE/RFLP?

The project uses RFLP because it connects requirements to functions, logical blocks, physical concepts, and verification evidence.

This makes the project more structured than a standalone MATLAB simulation while keeping it realistic for a university-level portfolio project.

### Why TTC and Stopping Distance?

Stopping distance checks whether the vehicle can theoretically stop under dry or wet road assumptions.

TTC adds a time-based risk indicator, which improves the warning logic compared with distance-only thresholds.

### Why Concept-Level Brake-by-Wire?

The project focuses on emergency brake-request logic, not a production brake-by-wire system.

This keeps the project aligned with concept design and avoids overclaiming real ECU, actuator, redundancy, diagnostics, or safety certification.

---

## Link to Project Scope

All decisions are constrained by the project positioning:

This project follows a lightweight MBSE/RFLP workflow suitable for university-level concept design and MATLAB-based scenario verification.

It does not claim to be a complete industrial MBSE implementation or a production-ready brake-by-wire system.

---

## Conclusion

The engineering decisions in this project are intentionally lightweight, traceable, and scope-safe.

They support a clean academic workflow that connects concept design, requirements, RFLP architecture, MATLAB verification, and GitHub documentation.
