# Concept Generation, Screening, and Scoring Mandatory Package

## Purpose
This document formalizes the concept generation, screening, and scoring step for the UrbanEV-BBW-RFLP-Verification project.

The purpose is to show that the project does not move directly from requirements to implementation. Instead, alternative vehicle-level and actuator-level concepts are identified and compared before selecting the concept used in the Simulink verification workflow.

This aligns the project with the mandatory concept-design workflow, where alternative solutions are generated, screened, scored, and then carried forward into logical and physical architecture.

## 1. Concept Generation

| Concept ID | Area | Alternative | Description | Role in Project | Selection Status |
|---|---|---|---|---|---|
| C1 | Vehicle-level concept | Lightweight low-speed urban EV | A lightweight concept with lower mass and simpler energy demand. | Used as an alternative in vehicle concept comparison. | Alternative |
| C2 | Vehicle-level concept | Balanced low-speed urban EV | A balanced concept used as the main working reference for the project. | Selected as the main reference concept for the lightweight MBSE/RFLP workflow. | Selected vehicle concept |
| C3 | Vehicle-level concept | Higher-mass low-speed urban EV | A heavier concept with higher performance demand and larger braking burden. | Used as an alternative in vehicle concept comparison. | Alternative |
| A1 | Brake actuator concept | Electric linear brake actuator | A simple electrically commanded actuator candidate for concept-level brake-request representation. | Candidate physical solution for brake-request actuation. | Selected actuator concept for concept-level representation |
| A2 | Brake actuator concept | Electro-hydraulic brake actuator | A more realistic brake-by-wire candidate, but more complex for university-level implementation. | Candidate physical solution for brake-request actuation. | Alternative |
| A3 | Brake actuator concept | Pure hydraulic brake actuator | A conventional hydraulic candidate with weaker alignment to the electronic brake-request logic. | Candidate physical solution for brake-request actuation. | Alternative |

## 2. Concept Screening Matrix

The screening matrix uses a simple mandatory-style comparison logic:

- `+` means the candidate performs well for the criterion.
- `0` means the candidate is acceptable or neutral.
- `-` means the candidate is weak for the criterion.

| Candidate ID | Candidate | Response Speed | Control Compatibility | Implementation Simplicity | Physical Plausibility | Traceability to Model | Scope Suitability | Score | Rank | Decision |
|---|---|---|---|---|---|---|---|---|---|---|
| A1 | Electric linear brake actuator | + | + | + | 0 | + | + | 5 | 1 | Preferred for concept-level project |
| A2 | Electro-hydraulic brake actuator | + | + | 0 | + | + | 0 | 4 | 2 | Good but more complex |
| A3 | Pure hydraulic brake actuator | 0 | - | - | + | 0 | - | -1 | 3 | Not preferred for this scope |

## 3. Concept Scoring Matrix

The scoring matrix uses numerical scores from 1 to 5. A score of 1 means weak alignment with the criterion, while 5 means strong alignment.

The weighted criteria are:

- Control compatibility: 0.25
- Response and delay suitability: 0.20
- Implementation simplicity: 0.20
- Physical plausibility: 0.15
- Traceability to Simulink logic: 0.20

| Candidate ID | Candidate | Control Compatibility | Response/Delay Suitability | Implementation Simplicity | Physical Plausibility | Traceability to Simulink | Weighted Total | Rank | Decision |
|---|---|---|---|---|---|---|---|---|---|
| A1 | Electric linear brake actuator | 5 | 4 | 5 | 3 | 5 | 4.5 | 1 | Selected |
| A2 | Electro-hydraulic brake actuator | 4 | 5 | 3 | 5 | 4 | 4.15 | 2 | Alternative |
| A3 | Pure hydraulic brake actuator | 2 | 3 | 2 | 4 | 2 | 2.5 | 3 | Not selected |

## Selected Concept

The selected actuator concept for the project is the electric linear brake actuator.

This does not mean the project claims a production brake-by-wire actuator design. It means that, for a university-level concept-design and verification project, the electric linear actuator is the clearest physical candidate to connect the logical emergency brake-request output to a simple physical actuation concept.

## Scope-Safe Interpretation

The actuator selection is used only for concept-level physical allocation. The project does not model actuator dynamics in production detail, hydraulic pressure behaviour, hardware redundancy, diagnostic coverage, fail-operational design, or certified brake-by-wire safety architecture.

## Next Step

The next step is to create presentation-ready visual tables for the concept screening and scoring matrices.
