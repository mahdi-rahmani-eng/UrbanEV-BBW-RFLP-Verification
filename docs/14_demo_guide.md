# 14 - Demo Guide

## Purpose

This guide explains how to run the project and inspect the main outputs.

The project is designed so that the complete MATLAB workflow can be executed from one main script:

`matlab/run_all.m`

---

## Before Running

Make sure MATLAB is opened in the main project folder:

`UrbanEV-BBW-RFLP-Verification`

The main project folder should contain:

- README.md
- data/
- docs/
- matlab/
- results/
- figures/

Do not run the project from inside the `matlab/` folder.

Run it from the main project folder.

---

## Step 1 - Open MATLAB

Open MATLAB and set the Current Folder to the main project folder.

Example path:

`C:\Users\USER\Desktop\github\UrbanEV-BBW-RFLP-Verification`

---

## Step 2 - Add MATLAB Scripts to Path

In the MATLAB Command Window, run:

`addpath('matlab')`

This allows MATLAB to find the project scripts stored in the `matlab/` folder.

---

## Step 3 - Run the Full Project

In the MATLAB Command Window, run:

`run_all`

This script executes the main project workflow.

---

## Step 4 - Check Concept Selection Results

After running `run_all`, check:

`results/concept_selection_results.csv`

This file shows:

- estimated range;
- braking performance;
- mass score;
- motor adequacy score;
- feasibility score;
- total concept score;
- selected vehicle concept.

Expected interpretation:

The selected concept should be the most balanced low-speed urban EV concept.

---

## Step 5 - Check Scenario Verification Results

Check:

`results/scenario_verification_results.csv`

This file shows the result of each braking scenario.

It includes:

- scenario ID;
- ego speed;
- target distance;
- relative speed;
- road condition;
- friction coefficient;
- actuator delay;
- stopping distance;
- TTC;
- warning state;
- brake request;
- pass/fail result.

---

## Step 6 - Check Actuator Selection Results

Check:

`results/actuator_selection_results.csv`

This file shows the actuator concept selection result.

The selected actuator concept is expected to be:

`Electro-Hydraulic Brake Actuator Concept`

This is a concept-level selection only, not a production actuator design.

---

## Step 7 - Check Traceability Matrix

Check:

`results/traceability_matrix.csv`

This file links:

Requirement -> Function -> Logical Block -> Physical Component -> Scenario/Test -> Result

This is one of the most important outputs of the lightweight MBSE/RFLP workflow.

---

## Step 8 - Check Generated Figures

Open the `figures/` folder.

Important figures include:

- `vehicle_concept_comparison.png`
- `warning_state_machine.png`
- `scenario_verification_summary.png`
- `rflp_digital_thread.png`

These figures support the project explanation in the README and documentation.

---

## Step 9 - Read the Verification Summary

Check:

`results/verification_summary.md`

This file summarizes the main verification outputs and project results.

---

## Recommended Review Order

For a quick review, read the project in this order:

1. README.md
2. docs/01_project_overview.md
3. docs/02_black_box_analysis.md
4. docs/04_concept_generation.md
5. docs/05_concept_screening.md
6. docs/06_verification_plan.md
7. docs/07_traceability_links.md
8. docs/08_assumptions_and_limitations.md
9. results/verification_summary.md

---

## Quick Run Commands

Use these commands from the main project folder:

`addpath('matlab')`

`run_all`

Then inspect:

`results/`

`figures/`

---

## Troubleshooting

| Problem | Possible Cause | Solution |
|---|---|---|
| MATLAB cannot find run_all | The matlab folder is not on the path. | Run addpath('matlab'). |
| Results are not generated | The project is not running from the main folder. | Set Current Folder to the project root. |
| CSV files cannot be found | The data folder path is incorrect. | Make sure the data folder exists in the main project folder. |
| Figures are missing | The script may not have completed. | Re-run run_all and check the Command Window for errors. |

---

## Scope Note

This demo guide is intended for a university-level MATLAB project.

The project does not require ROS2, YOLO, CARLA, Simulink Test, System Composer, HIL, SIL, or real vehicle hardware to run the main version.

---

## Conclusion

The project can be reviewed and executed through a simple MATLAB workflow.

The main script `run_all.m` generates the key results, figures, and verification evidence needed to understand the project.
