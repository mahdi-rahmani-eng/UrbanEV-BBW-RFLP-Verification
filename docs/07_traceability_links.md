# 07 - Traceability Links

## Purpose

This document explains the traceability-link structure used in this project.

The goal is to show how stakeholder needs, requirements, functions, logical blocks, physical/concept components, and verification items are connected in a lightweight MBSE/RFLP workflow.

The detailed traceability links are stored in:

`data/traceability_links.csv`

---

## Why Traceability Matters

Traceability prevents the project from becoming a set of disconnected MATLAB scripts and documents.

Instead, it shows a clear engineering chain:

Need -> Requirement -> Function -> Logical Block -> Physical Component -> Verification Item

This is important because the project is intended to demonstrate not only MATLAB modelling, but also requirements-driven concept design and lightweight RFLP reasoning.

---

## Traceability Levels

| Level | Meaning in this Project | Example |
|---|---|---|
| Need | Stakeholder or educational need | NEED-04 |
| Requirement | Formal statement using shall logic | REQ-BBW-03 |
| Function | What the system shall do | F5 Classify warning state |
| Logical Block | Abstract logical element performing a function | L5 Warning State Machine |
| Physical Component | Concept-level physical or implementation element | P2 BBW ECU Concept |
| Verification Item | Test or review used to check a requirement | VFY-06 |

---

## Link Types Used

| Link Type | Meaning |
|---|---|
| derived_to | A stakeholder need is translated into a requirement. |
| related_to | A requirement is related to a function. |
| allocated_to | A function is allocated to a logical block. |
| implemented_by | A logical block is represented by a physical or concept component. |
| communicated_by | A logical output is communicated through a concept interface. |
| commanded_to | A control request is conceptually sent to an actuator candidate. |
| selects | A logical selector chooses a physical/concept candidate. |
| verified_by | A requirement is checked by a verification item. |
| documented_by | A project element is documented in results or GitHub evidence. |

---

## Example Traceability Chain

One example chain for the warning-state requirement is:

| Step | Element |
|---|---|
| Stakeholder need | NEED-04: emergency braking logic should be tested through repeatable scenarios |
| Requirement | REQ-BBW-03: warning logic shall classify risk into SAFE, CAUTION, WARNING, and EMERGENCY_BRAKE |
| Function | F5: Classify warning state |
| Logical block | L5: Warning State Machine |
| Physical/concept element | P2: BBW ECU Concept and P6: HMI Warning Interface |
| Verification item | VFY-06: scenario-based warning-state verification |

This chain shows that the warning-state logic is not an isolated MATLAB function. It is connected to a need, a requirement, an RFLP architecture element, and a verification rule.

---

## Main Traceability Groups

The file `data/traceability_links.csv` includes the following groups of links:

| Group | Source | Target | Purpose |
|---|---|---|---|
| Needs to Requirements | NEED | REQ | Shows where requirements come from. |
| Requirements to Functions | REQ | F | Shows which functions respond to each requirement. |
| Functions to Logical Blocks | F | L | Shows function allocation. |
| Logical Blocks to Physical Components | L | P | Shows concept-level implementation allocation. |
| Requirements to Verification Items | REQ | VFY | Shows how each requirement is checked. |

---

## Scope Note

This traceability approach is lightweight and CSV-based.

It does not claim a complete industrial model repository, full System Composer implementation, or certified requirements-management workflow.

A future extension could implement the same traceability structure using Simulink Requirements, System Composer, and Simulink Test.

---

## Conclusion

The traceability-link structure strengthens the project by connecting needs, requirements, architecture, physical/concept elements, and verification evidence.

This makes the project more aligned with a lightweight MBSE/RFLP concept-design workflow while keeping it realistic for a university-level project.
