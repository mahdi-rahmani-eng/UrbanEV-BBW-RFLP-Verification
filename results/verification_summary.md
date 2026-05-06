# Verification Summary

## Selected Vehicle Concept

Selected concept: C2

Description: Balanced low-speed urban EV

Estimated range: 125.72 km

Total concept score: 8.17

## Selected Actuator Candidate

Selected actuator: A2

Concept: Electro-hydraulic brake actuator

Total actuator score: 7.85

## Scenario Verification

- SCN-01: state = SAFE, TTC = 18.00 s, stopping distance = 3.21 m, brake_request = 0, result = Pass
- SCN-02: state = CAUTION, TTC = 3.60 s, stopping distance = 6.39 m, brake_request = 0, result = Pass
- SCN-03: state = WARNING, TTC = 1.92 s, stopping distance = 6.39 m, brake_request = 0, result = Pass
- SCN-04: state = WARNING, TTC = 2.16 s, stopping distance = 9.53 m, brake_request = 0, result = Pass
- SCN-05: state = EMERGENCY_BRAKE, TTC = 0.90 s, stopping distance = 10.61 m, brake_request = 1, result = Pass
- SCN-06: state = WARNING, TTC = 3.17 s, stopping distance = 9.53 m, brake_request = 0, result = Pass

## Scope Note

This project follows a lightweight MBSE/RFLP workflow suitable for university-level concept design and MATLAB-based scenario verification. It does not claim complete industrial MBSE implementation or production-ready brake-by-wire design.
