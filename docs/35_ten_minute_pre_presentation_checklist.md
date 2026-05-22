# 10-Minute Pre-Presentation Checklist

## Purpose
This checklist should be used 10 minutes before the final presentation to make sure that the project, models, results, and presentation materials are ready.

## 1. Open the Correct Repository

MATLAB current folder should be:

`C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH`

Check with:

```matlab
pwd
dir
```

Expected key folders:

- `data/`
- `docs/`
- `figures/`
- `matlab/`
- `models/`
- `results/`

## 2. Check Git Status

Run:

```matlab
system("git status --short")
```

Expected result:

`No output`

This means there are no uncommitted changes.

## 3. Open the Presentation-Ready Simulink Model

Run:

```matlab
open_system("models/urban_ev_bbw_warning_logic_final_presentation.slx")
```

Check that the model shows five main subsystems:

1. Scenario Definition
2. Risk Estimation
3. Warning and Brake Decision
4. Requirement Verification
5. Results and Logging

## 4. Open the Test-Validation Model

Run:

```matlab
open_system("models/urban_ev_bbw_warning_logic_test_validation.slx")
```

This is the model used for scenario-based testing.

## 5. Check Scenario-Based Results

Run:

```matlab
T = readtable("results/simulink_test_validation_results.csv");
disp(T)
```

Expected result:

All scenarios from SCN-01 to SCN-06 should show PASS.

## 6. Open Simulink Test Manager

Run:

```matlab
sltest.testmanager.view
```

Open:

`UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx`

Expected result:

The suite should contain six scenario test cases and show successful results.

## 7. Keep These Files Ready

| File | Why it is important |
|---|---|
| `README.md` | General project overview |
| `data/scenarios.csv` | Shows the six verification scenarios |
| `models/urban_ev_bbw_warning_logic_final_presentation.slx` | Main Simulink architecture |
| `results/simulink_test_validation_results.csv` | Scenario-based PASS/FAIL evidence |
| `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Official Test Manager evidence |
| `docs/21_requirements_not_fully_tested_justification.md` | Scope-safe limitation explanation |
| `docs/34_what_to_show_during_presentation.md` | Presentation artifact guide |

## 8. Key Sentence to Say

`This project demonstrates a lightweight MBSE/RFLP and MATLAB/Simulink verification workflow for concept-level emergency brake-request logic in a low-speed urban EV.`

## 9. Key Limitation to Say

`This is not a production brake-by-wire system, not a certified safety system, and not an ISO 26262-compliant validation.`

## 10. Final Confidence Check

Before presenting, confirm that you can explain:

- Why the project starts from needs and requirements
- What the black-box inputs and outputs are
- How the white-box Simulink architecture works
- How stopping distance and TTC are calculated
- When warning_state_code becomes 3
- Why brake_request becomes 1 only in EMERGENCY_BRAKE
- How SCN-01 to SCN-06 were tested
- Why Test Manager results make the testing stronger
- Which aspects were not tested and why

## Final Reminder
The strongest way to present this project is to keep the claim realistic:

`Concept-level verification, not production validation.`
