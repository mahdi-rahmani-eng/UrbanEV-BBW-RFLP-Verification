# Concept Generation, Screening, and Scoring Figures

## Purpose

This document describes the presentation-ready figures created for the concept generation, screening, and scoring part of the UrbanEV-BBW-RFLP-Verification project.

These figures support the mandatory concept-design workflow by showing that the project does not move directly from requirements to implementation. Instead, alternative vehicle-level and actuator-level concepts are identified, screened, scored, and then selected for the following white-box and Simulink verification stages.

## Generated Figures

| Figure | Purpose |
|---|---|
| `figures/concept_generation_summary.png` | Summarizes vehicle-level and actuator-level alternatives and highlights the selected concepts. |
| `figures/actuator_concept_screening_matrix.png` | Shows a mandatory-style + / 0 / - screening matrix for actuator alternatives. |
| `figures/actuator_concept_scoring_matrix.png` | Shows weighted scoring and final actuator selection. |

## Selected Concepts

The selected vehicle-level reference concept is C2, the balanced low-speed urban EV.

The selected actuator-level concept is A1, the electric linear brake actuator.

## Scope-Safe Interpretation

The actuator selection is used only for concept-level physical allocation. It does not represent a production brake-by-wire actuator design, certified safety architecture, real actuator dynamics model, or industrial hardware design.

## Regeneration Script

The figures can be regenerated using:

`matlab/build_concept_figures_no_functions.m`

From the repository root, run:

`run("matlab/build_concept_figures_no_functions.m")`

## Link to Next Stage

After concept screening and scoring, the project moves to white-box decomposition, where the selected concept is decomposed into functions, logical blocks, physical allocation, and verification evidence.
