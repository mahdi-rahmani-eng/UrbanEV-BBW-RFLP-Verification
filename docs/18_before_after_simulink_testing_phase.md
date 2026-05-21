# Before and After Simulink Testing Phase

## Purpose
This document summarizes how the project changed after adding the Simulink scenario-based testing and validation phase.

## Before Testing

Before the Simulink testing phase, the project included a presentation-ready Simulink model for concept-level emergency brake-request logic.

The model showed the internal functional flow:

1. Scenario Definition
2. Risk Estimation
3. Warning and Brake Decision
4. Requirement Verification
5. Results and Logging

However, the model was mainly demonstrated using one default scenario, SCN-05.

## After Testing

After the testing phase, the model was executed across the full scenario catalogue from SCN-01 to SCN-06.

For each scenario, the actual warning-state output was compared with the expected warning state.

The testing phase produced:

- A scenario-based test result table
- PASS/FAIL evidence for each scenario
- Logged outputs for stopping distance, TTC, warning state, brake request, and state match
- Requirement-to-test traceability

## Test Summary

| Metric | Value |
|---|---:|
| Number of tested scenarios | 6 |
| Passed scenarios | 6 |
| Failed scenarios | 0 |

## Project Improvement

The project improved from a Simulink demonstration model to a scenario-based verification workflow.

This makes the project closer to an MBSE-style verification process because the model outputs are no longer only visually demonstrated; they are systematically tested against expected scenario behaviour.

## Scope Limitation

This testing phase remains concept-level and scenario-based. It does not claim production brake-by-wire validation, hardware-in-the-loop testing, real sensor validation, certified safety compliance, or ISO 26262 verification.
