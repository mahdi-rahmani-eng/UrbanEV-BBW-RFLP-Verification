# 12 - Verification Coverage

## Purpose

This document summarizes the verification coverage of the project requirements.

The purpose is to show which requirement categories are covered by MATLAB scenario verification, design review, actuator selection, and traceability review.

This is a lightweight university-level verification coverage table, not an industrial verification report.

---

## Verification Coverage Summary

| Requirement Category | Number of Requirements | Verified | Partially Verified | Not Verified | Coverage Status |
|---|---:|---:|---:|---:|---|
| Vehicle-level concept requirements | 3 | 3 | 0 | 0 | Complete |
| Brake-by-wire emergency logic requirements | 5 | 5 | 0 | 0 | Complete |
| Actuator concept selection requirements | 1 | 1 | 0 | 0 | Complete |
| Traceability requirements | 1 | 1 | 0 | 0 | Complete |
| Documentation and scope-control requirements | 1 | 1 | 0 | 0 | Complete |
| Scenario coverage | 6 scenarios | 6 | 0 | 0 | Complete for defined scenarios |

---

## Requirement Categories

### Vehicle-Level Concept Requirements

Vehicle-level requirements are checked through concept definition, range estimation, braking-distance comparison, and concept-selection results.

Evidence files:

- results/concept_selection_results.csv
- figures/vehicle_concept_comparison.png

### Brake-by-Wire Emergency Logic Requirements

Brake-by-wire emergency logic requirements are checked through MATLAB scenario verification.

The model calculates stopping distance, TTC, warning state, brake request, and pass/fail result for each scenario.

Evidence files:

- results/scenario_verification_results.csv
- figures/scenario_verification_summary.png
- figures/warning_state_machine.png

### Actuator Concept Selection Requirements

Actuator concept selection is checked through a weighted design-review table.

Evidence files:

- results/actuator_selection_results.csv

### Traceability Requirements

Traceability is checked through requirement-to-function-to-logical-to-physical-to-verification links.

Evidence files:

- results/traceability_matrix.csv
- data/traceability_links.csv
- docs/07_traceability_links.md

### Documentation and Scope-Control Requirements

Scope-control requirements are addressed through explicit assumptions, limitations, and project-positioning documentation.

Evidence files:

- docs/08_assumptions_and_limitations.md
- docs/11_simple_risk_register.md

---

## Scenario Verification Coverage

| Scenario ID | Expected State | Main Requirement Checked | Coverage Status |
|---|---|---|---|
| SCN-01 | SAFE | REQ-BBW-03 | Covered |
| SCN-02 | CAUTION | REQ-BBW-03 | Covered |
| SCN-03 | WARNING | REQ-BBW-03 | Covered |
| SCN-04 | WARNING | REQ-BBW-01; REQ-BBW-03 | Covered |
| SCN-05 | EMERGENCY_BRAKE | REQ-BBW-04 | Covered |
| SCN-06 | WARNING | REQ-BBW-05 | Covered |

---

## Verification Evidence Map

| Evidence File | Purpose |
|---|---|
| results/concept_selection_results.csv | Shows vehicle concept scoring and selected concept. |
| results/scenario_verification_results.csv | Shows scenario outputs and pass/fail results. |
| results/actuator_selection_results.csv | Shows actuator candidate scoring and selected actuator concept. |
| results/traceability_matrix.csv | Shows requirement-to-architecture-to-verification mapping. |
| results/verification_summary.md | Summarizes the main verification outputs. |
| data/verification_plan.csv | Defines verification items, pass rules, and expected evidence. |
| data/traceability_links.csv | Defines lightweight MBSE/RFLP link structure. |

---

## Coverage Interpretation

The project provides complete coverage for the requirements defined within its simplified academic scope.

However, this does not mean that the system is validated for production use.

The coverage is limited to:

- simplified low-speed urban EV concept assumptions;
- MATLAB script-based scenario testing;
- predefined dry and wet road cases;
- concept-level emergency brake-request logic;
- documentation-based traceability.

---

## Limitations of Coverage

The following areas are not covered:

- real sensor perception;
- camera/radar fusion;
- production brake-by-wire actuation;
- hydraulic pressure dynamics;
- ECU implementation;
- ISO 26262 verification;
- SOTIF validation;
- HIL/SIL testing;
- exhaustive real-world scenario coverage.

---

## Conclusion

The verification coverage table shows that the defined university-level requirements are covered by MATLAB simulation, design review, and traceability review.

This improves the project by making the verification status visible, reviewable, and aligned with the lightweight MBSE/RFLP workflow.
