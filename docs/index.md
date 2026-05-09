isfile(fullfile("docs","index.md"))# Documentation Index

## Purpose

This file provides a recommended reading order for the project documentation.

It is added to avoid confusion caused by incremental documentation growth and duplicate numbering in some earlier files.

The project files are not renamed in order to avoid breaking existing references in the README and documentation.

---

## Recommended Reading Order

| Order | File | Purpose | Status |
|---:|---|---|---|
| 1 | `README.md` | Main project overview and execution summary. | Available |
| 2 | `docs/01_project_overview.md` | Defines project goal, scope, and positioning. | Available |
| 3 | `docs/02_black_box_analysis.md` | Defines system boundary, mission, lifecycle, actors, interfaces, modes, and services. | Available |
| 4 | `data/stakeholder_needs.csv` | Links stakeholder needs to derived requirements. | Available |
| 5 | `data/interfaces.csv` | Defines input, output, internal signal, unit, source, and destination interfaces. | Available |
| 6 | `docs/03_requirements_quality_review.md` | Reviews requirements using simple requirements-engineering quality criteria. | Available |
| 7 | `docs/04_concept_generation.md` | Explains how the three vehicle concepts were generated. | Available |
| 8 | `docs/05_concept_screening.md` | Adds Pugh-style qualitative concept screening before MATLAB scoring. | Available |
| 9 | `docs/15_operational_design_domain.md` | Defines the ODD-inspired operating envelope for the project. | Available |
| 10 | `docs/09_scenario_catalog.md` | Documents the manually defined scenario catalogue. | Available |
| 11 | `docs/16_scenario_taxonomy.md` | Defines the parameterized scenario taxonomy and scenario families. | Available |
| 12 | `docs/06_verification_plan.md` | Defines verification items, pass rules, and expected evidence. | Available |
| 13 | `docs/17_stpa_lite_safety_analysis.md` | Adds lightweight STPA-inspired safety reasoning. | Available |
| 14 | `docs/07_traceability_links.md` | Explains need-requirement-function-logical-physical-verification traceability links. | Available |
| 15 | `docs/08_assumptions_and_limitations.md` | Defines project assumptions and limitations. | Available |
| 16 | `docs/11_simple_risk_register.md` | Identifies simple project risks and mitigation actions. | Available |
| 17 | `docs/12_verification_coverage.md` | Summarizes verification coverage by requirement category. | Available |
| 18 | `docs/19_verification_coverage_metrics.md` | Calculates requirement and ODD coverage metrics. | Available |
| 19 | `docs/18_robustness_and_sensitivity_analysis.md` | Explains Monte Carlo robustness and sensitivity analysis. | Available |
| 20 | `docs/20_parameterized_scenario_testing.md` | Explains parameterized scenario generation and batch verification. | Available |
| 21 | `docs/13_future_work_and_internship_extension.md` | Describes realistic future extensions for internship growth. | Available |
| 22 | `docs/14_demo_guide.md` | Explains how to run and review the project. | Available |

---

## Main Workflow Represented by the Documentation

```text
Stakeholder Needs
→ Black Box Analysis
→ ODD Definition
→ Requirements Definition and Quality Review
→ Concept Generation
→ Concept Screening
→ MATLAB-Based Concept Scoring
→ Lightweight RFLP Architecture
→ STPA-Lite Safety Analysis
→ Scenario Catalogue and Scenario Taxonomy
→ Scenario-Based MATLAB Verification
→ Parameterized Scenario Batch Verification
→ Robustness / Monte Carlo Analysis
→ Traceability Links
→ Requirement and ODD Coverage Metrics
→ Verification Summary
→ Demo Guide and Future Work
```

---

## Scope Note

This documentation index is only an organizational guide.

It does not add new technical claims.

The project remains a university-level lightweight MBSE/RFLP and MATLAB-based concept verification project.

It does not claim production brake-by-wire design, ISO 26262 compliance, ISO 21448/SOTIF compliance, real sensor fusion, HIL/SIL testing, or industrial MBSE completeness.
