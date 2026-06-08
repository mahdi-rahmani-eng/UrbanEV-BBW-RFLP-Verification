# Portfolio and Interview Talking Points

## Purpose

This document provides concise talking points for presenting the UrbanEV-BBW-RFLP verification project in an academic, portfolio, or entry-level automotive validation interview context.

The goal is to explain the project clearly, professionally, and without overstating its industrial maturity.

## Short Project Pitch

This project is a concept-level model-based validation workflow for low-speed urban electric vehicle brake-request logic.

It combines MATLAB/Simulink modeling, Stateflow-based warning-state logic, scenario-based validation, requirement-test-result evidence, automotive-style signal interfaces, ODD scenario planning, and regression test planning.

## One-Minute Explanation

The project focuses on validating a simplified brake-request logic for a low-speed urban electric vehicle.

The model estimates stopping distance and time-to-collision, classifies the risk level into SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE, and activates a brake_request only in emergency conditions.

I extended the original Simulink logic with a Stateflow-based finite-state machine and compared its outputs against the original Simulink decision logic.

I also added validation evidence such as a requirement-test-result matrix, CAN-style signal mapping, extended ODD scenarios, ODD coverage summary, regression test plan, and a final repository quality audit.

## Key Technical Points

| Topic | How to Explain It |
|---|---|
| MATLAB/Simulink | The main validation workflow is implemented using MATLAB and Simulink. |
| Stateflow | The warning-state logic is represented as a finite-state machine. |
| Scenario-based validation | Different dry-road, wet-road, delay-sensitive, and stationary obstacle cases are defined. |
| Requirement traceability | Requirements are linked to scenarios, test methods, observed results, and evidence files. |
| CAN-style mapping | Key model signals are mapped to conceptual automotive communication messages. |
| ODD coverage | The scenario library is summarized according to road condition, speed range, delay sensitivity, and warning state coverage. |
| Regression testing | A regression test plan defines which tests should be repeated after model changes. |
| Scope-safe documentation | The repository clearly states what is implemented and what is only future work. |

## Best Sentence to Use in an Interview

> I developed a concept-level model-based validation workflow for low-speed urban EV brake-request logic using MATLAB/Simulink, Stateflow, scenario-based validation, requirement-test-result evidence, and structured repository documentation.

## What This Project Demonstrates

- model-based validation thinking
- basic automotive V&V workflow awareness
- Simulink and Stateflow familiarity
- requirements-based validation structure
- scenario-based test design
- validation evidence organization
- interface definition mindset
- ODD and regression testing awareness
- careful technical scope management

## What Not to Claim

Do not claim that this project is:

- production-ready
- a real brake-by-wire system
- ISO 26262 compliant
- ASPICE compliant
- AUTOSAR compliant
- HIL/SIL validated
- ECU-deployed
- tested on a real vehicle
- based on a real CAN bus implementation

## Safe Positioning

The correct positioning is:

> This is a university-level concept validation project designed to demonstrate model-based automotive validation thinking. It is not a production brake-by-wire implementation.

## Possible Interview Questions and Answers

### What is the main goal of this project?

The main goal is to validate a simplified emergency brake-request logic for a low-speed urban electric vehicle using a model-based workflow.

### Why did you add Stateflow?

I added Stateflow to represent the warning logic as a finite-state machine and to compare its outputs with the original Simulink decision logic.

### What does the Stateflow validation show?

For the tested emergency scenario, the Stateflow logic produced the same warning state and brake_request output as the original Simulink logic.

### Why did you add CAN-style mapping?

I added it to make the signal interface easier to discuss in an automotive validation context. It is conceptual and not a real CAN implementation.

### Why did you add an ODD scenario library?

I added it to show how the validation workflow can be extended with more parameterized scenarios, including dry-road, wet-road, delay-sensitive, and stationary obstacle cases.

### Why is the regression test plan important?

It defines which scenario groups should be re-tested after model or threshold changes, which makes the workflow more repeatable.

## Final Presentation Message

The strongest way to present the project is to emphasize that it is not just a Simulink diagram, but a structured validation package with models, scenarios, evidence, documentation, interface definitions, regression planning, and clear scope limitations.
