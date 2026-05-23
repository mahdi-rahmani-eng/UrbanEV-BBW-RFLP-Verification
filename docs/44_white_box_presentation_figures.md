# White Box Presentation Figures

## Purpose

This document describes the presentation-ready White Box figures created for the UrbanEV-BBW-RFLP-Verification project.

The figures support the course-aligned White Box workflow by showing how the black-box emergency brake-request logic is opened and decomposed into internal functions, logical blocks, physical allocation elements, and traceability evidence.

## Generated White Box Figures

| Figure | Role in the White Box workflow |
|---|---|
| `figures/white_box_functional_decomposition.png` | Shows the internal functional decomposition from scenario inputs to risk estimation, warning classification, brake-request generation, and result logging. |
| `figures/white_box_logical_architecture.png` | Shows how internal functions are allocated to logical blocks before physical allocation. |
| `figures/white_box_physical_allocation.png` | Shows how logical responsibilities are represented by concept-level physical elements and verification assets. |
| `figures/white_box_traceability_chain.png` | Shows the digital thread from requirements to functions, logical blocks, physical elements, Simulink/Test Manager assets, and evidence files. |

## Functional Decomposition Logic

The functional decomposition figure preserves the following internal dependency logic:

- `F-01 -> F-02`: scenario inputs are received and normalized.
- `F-02 -> F-03`: normalized scenario data feed stopping-distance estimation.
- `F-02 -> F-04`: normalized scenario data feed time-to-collision estimation.
- `F-03 -> F-05`: stopping-distance risk contributes to warning-state classification.
- `F-04 -> F-05`: time-to-collision risk contributes to warning-state classification.
- `F-05 -> F-06`: warning-state classification drives brake-request generation.
- `F-06 -> F-07`: brake-request output is verified and logged.

## Physical Allocation Logic

The physical allocation figure preserves the following concept-level allocation logic:

- `P-01 -> P-02`: the low-speed urban EV platform provides the vehicle context for the controller.
- `P-04 -> P-02`: the ego-speed source provides speed information.
- `P-05 -> P-02`: the forward target / obstacle assumption provides target-distance and relative-speed context.
- `P-02 -> P-03`: the concept-level BBW controller sends the brake-request output to the selected actuator concept.
- `P-02 -> P-06`: the controller logic is also connected to MATLAB/Simulink verification evidence.

## Regeneration Scripts

The latest manually refined White Box figures can be regenerated using:

- `matlab/build_white_box_functional_decomposition_final.m`
- `matlab/build_white_box_physical_allocation_final.m`

The broader initial White Box figure set was generated using:

- `matlab/build_white_box_figures_no_functions.m`

## Scope-Safe Interpretation

These White Box figures are university-level concept-design artifacts. They support transparent system decomposition and verification traceability. They do not claim a complete industrial MBSE implementation, production brake-by-wire actuator design, ISO 26262 safety case, or certified hardware architecture.

## Link to Project Evidence

The figures are connected to the tabular White Box package documented in:

- `docs/43_white_box_decomposition_package.md`

The corresponding CSV files are stored in the `data/` folder.
