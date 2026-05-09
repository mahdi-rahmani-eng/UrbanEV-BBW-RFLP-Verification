# 19 - Verification and ODD Coverage Metrics

## Purpose

This document explains the lightweight coverage metrics added to the project.

The goal is to make verification coverage and ODD coverage visible, measurable, and reviewable.

This is a university-level coverage analysis and does not claim industrial validation, ISO 26262 compliance, SOTIF compliance, HIL testing, or SIL testing.

---

## Why Coverage Metrics Were Added

Traceability shows how project elements are connected.

Coverage metrics show how much of the defined project scope is covered by verification evidence.

This helps reviewers quickly understand:

- which requirements are linked to verification;
- which requirements are only partially covered;
- which ODD elements are inside the project scope;
- which ODD elements are explicitly outside the scope.

---

## MATLAB Script

The coverage analysis is implemented in:

`matlab/coverage_analysis.m`

The script reads:

- `data/traceability_links.csv`
- `data/odd_definition.csv`

and generates:

- `results/requirement_coverage_results.csv`
- `results/odd_coverage_results.csv`
- `figures/verification_coverage_chart.png`
- `figures/odd_coverage_chart.png`

---

## Requirement Coverage Logic

A requirement is classified as:

| Coverage Status | Meaning |
|---|---|
| Complete | The requirement has both a function link and a verification link. |
| Partial | The requirement has only one of the required coverage links. |
| Not covered | The requirement has no detected function or verification link. |

This is a lightweight metric based on the CSV traceability structure.

It is not a formal requirements-management tool or certified verification report.

---

## ODD Coverage Logic

ODD entries are classified using the `status` field in:

`data/odd_definition.csv`

| ODD Status | Meaning |
|---|---|
| in_scope | The condition is included in the project ODD. |
| out_of_scope | The condition is explicitly excluded from the project ODD. |

This helps show what the project covers and what it does not claim.

---

## Output Files

| Output File | Purpose |
|---|---|
| results/requirement_coverage_results.csv | Lists each detected requirement and its coverage status. |
| results/odd_coverage_results.csv | Lists ODD entries and their in-scope or out-of-scope status. |
| figures/verification_coverage_chart.png | Shows complete, partial, and not-covered requirement counts. |
| figures/odd_coverage_chart.png | Shows in-scope and out-of-scope ODD entries. |

---

## Interpretation

High requirement coverage means the defined requirements are linked to functions and verification items.

Partial or missing coverage indicates that a requirement needs better traceability, clearer verification rules, or additional evidence.

ODD coverage does not mean all real-world conditions are covered.

It means that the project explicitly defines which operating conditions are supported and which ones are excluded.

---

## Link to Project Scope

The coverage metrics should be interpreted inside the project scope:

- concept-level low-speed urban EV design;
- MATLAB script-based verification;
- simplified emergency brake-request logic;
- ODD-constrained scenario testing;
- lightweight MBSE/RFLP traceability.

The metrics do not imply production readiness or certified safety validation.

---

## Scope Note

This coverage analysis is intentionally simple.

It does not replace formal verification management, requirements tools, ISO 26262 work products, SOTIF validation, HIL testing, SIL testing, or industrial MBSE reporting.

---

## Conclusion

The verification and ODD coverage metrics improve the project by making the verification status more transparent.

They help show that the project is traceable, reviewable, and scope-aware while remaining realistic for a university-level automotive systems engineering project.
