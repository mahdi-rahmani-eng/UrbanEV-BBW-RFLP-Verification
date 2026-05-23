# Final How-to-Run and Evaluation Guide

## Purpose
This document explains how to run and evaluate the final UrbanEV-BBW-RFLP-Verification project.

It is intended for course evaluation, presentation review, and GitHub-based project inspection.

## 1. Open the Project Folder
Start MATLAB and set the current folder to the repository root:

`C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH`

Recommended MATLAB command:

```matlab
cd("C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH")
```

## 2. Run the Main MATLAB Workflow
The main MATLAB workflow generates the core numerical results, scenario verification outputs, traceability outputs, and figures.

```matlab
run("matlab/run_all.m")
```

Expected output folders:

- `results/`
- `figures/`

Important generated results include:

- `results/scenario_verification_results.csv`
- `results/traceability_matrix.csv`
- `results/verification_summary.md`

## 3. Open the Presentation-Ready Simulink Model
To inspect the final presentation-ready Simulink model, run:

```matlab
open_system("models/urban_ev_bbw_warning_logic_final_presentation.slx")
```

This model shows the concept-level functional architecture:

1. Scenario Definition
2. Risk Estimation
3. Warning and Brake Decision
4. Requirement Verification
5. Results and Logging

## 4. Open the Test-Validation Simulink Model
To inspect the Simulink model used for scenario-based testing, run:

```matlab
open_system("models/urban_ev_bbw_warning_logic_test_validation.slx")
```

This model is used for testing SCN-01 to SCN-06.

## 5. Review Scenario-Based Test Results
The scenario-based Simulink test results are saved in:

`results/simulink_test_validation_results.csv`

To inspect them in MATLAB:

```matlab
T = readtable("results/simulink_test_validation_results.csv");
disp(T)
```

The expected result is that all six scenarios pass.

## 6. Review Requirement-to-Test Traceability
The Simulink requirement-to-test traceability result is saved in:

`results/simulink_requirement_test_traceability.csv`

To inspect it:

```matlab
TT = readtable("results/simulink_requirement_test_traceability.csv");
disp(TT)
```

This file links scenario-based tests to verification objectives and Simulink subsystems.

## 7. Open the Simulink Test Manager File
The official all-scenarios Simulink Test Manager file is:

`UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx`

To open Test Manager:

```matlab
sltest.testmanager.view
```

Then open the file:

`UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx`

The test suite should contain six test cases:

- SCN-01 Normal following
- SCN-02 Close but not critical target
- SCN-03 High closing risk
- SCN-04 Wet-road warning case
- SCN-05 Sudden stationary obstacle
- SCN-06 Delay-sensitive wet case

## 8. Expected Test Manager Result
The official Test Manager result should show six successful scenario tests.

These tests cover:

- SAFE
- CAUTION
- WARNING
- EMERGENCY_BRAKE

## 9. Final Documentation for Evaluation
The most important final documents are:

| Document | Purpose |
|---|---|
| `docs/22_alignment_with_course_mandatory_contents.md` | Maps the project to the course workflow |
| `docs/23_final_presentation_narrative.md` | Explains the full project story |
| `docs/25_final_presentation_slide_plan.md` | Gives the slide-by-slide presentation plan |
| `docs/26_final_presentation_speaker_script.md` | Provides the oral presentation script |
| `docs/29_final_presentation_q_and_a.md` | Prepares answers for likely questions |
| `docs/30_final_repository_quality_audit.md` | Confirms main files are present |
| `docs/31_final_reproducibility_check.md` | Confirms reproducibility-related artifacts |

## 10. Correct Final Claim
The project should be presented as:

`A lightweight MBSE/RFLP and MATLAB/Simulink verification workflow for concept-level emergency brake-request logic in a low-speed urban EV.`

## 11. Scope Limitation
The project does not claim:

- real-vehicle brake-hardware system validation
- real brake actuator hardware testing
- real sensor fusion
- HIL/SIL validation
- ISO 26262-level industrial safety assessment
- complete autonomous emergency braking system design

## Final Evaluation Note
The project is ready for presentation when the MATLAB workflow runs, the Simulink models open correctly, the scenario-based results are available, and the Test Manager suite shows six successful scenario tests.
