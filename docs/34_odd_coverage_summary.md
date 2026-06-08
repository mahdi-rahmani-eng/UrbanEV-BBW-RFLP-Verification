# ODD Coverage Summary

## Purpose

This document summarizes the Operational Design Domain (ODD) coverage provided by the extended scenario library.

The goal is to show which operating conditions, warning states, and scenario categories are covered by the extended ODD scenario set.

The coverage summary table is stored in:

- `data/odd_coverage_summary.csv`

## Coverage Areas

The ODD coverage summary includes the following coverage areas:

| Coverage Area | Purpose |
|---|---|
| Dry-road scenarios | Covers baseline, caution, warning, delay-sensitive, and obstacle behavior under dry-road conditions. |
| Wet-road scenarios | Covers reduced-friction behavior and emergency brake-request activation. |
| Delay-sensitive scenarios | Covers controller and actuator delay sensitivity. |
| Stationary obstacle scenarios | Covers close and critical stationary obstacle cases. |
| SAFE expected state | Covers non-critical behavior. |
| CAUTION expected state | Covers early risk behavior. |
| WARNING expected state | Covers high-risk warning behavior without brake request. |
| EMERGENCY_BRAKE expected state | Covers emergency brake-request activation. |
| Low-speed 10 km/h cases | Covers very low-speed urban operation. |
| Medium-speed 20-25 km/h cases | Covers common low-speed urban operation. |
| Higher low-speed 30 km/h cases | Covers the upper range of the defined low-speed ODD. |

## Scenario Coverage Interpretation

The extended ODD scenario library does not claim exhaustive real-world coverage.

Instead, it provides a structured concept-level coverage summary for the selected low-speed urban EV validation scope.

## Covered Scenario Categories

| Category | Example Covered Scenarios |
|---|---|
| Dry-road behavior | EXT-ODD-01, EXT-ODD-02, EXT-ODD-03 |
| Wet-road behavior | EXT-ODD-04, EXT-ODD-05, EXT-ODD-06 |
| Delay-sensitive behavior | EXT-ODD-07, EXT-ODD-08 |
| Stationary obstacle behavior | EXT-ODD-09, EXT-ODD-10 |
| Emergency brake-request behavior | EXT-ODD-06, EXT-ODD-08, EXT-ODD-09, EXT-ODD-10 |

## Validation Relevance

This coverage summary makes the scenario library easier to review and extend.

It supports future work such as:

- scenario coverage tracking
- regression test planning
- ODD parameter expansion
- automated Simulink Test Manager case generation
- validation evidence reporting

## Scope Limitation

This ODD coverage summary is a concept-level validation artifact.

It does not claim certified ODD coverage, production AEB validation, real-world autonomous driving validation, ISO 26262 compliance, HIL/SIL validation, ECU-level validation, or real vehicle testing.
