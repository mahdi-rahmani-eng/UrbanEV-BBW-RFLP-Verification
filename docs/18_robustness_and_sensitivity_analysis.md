# 18 - Robustness and Sensitivity Analysis

## Purpose

This document explains the robustness and sensitivity analysis added to the project.

The goal is to check whether the concept-level warning and brake-request logic remains stable when key scenario inputs vary slightly.

This is a lightweight Monte Carlo analysis suitable for a university-level MATLAB verification project.

It does not claim production validation, formal statistical safety assurance, ISO 26262 compliance, SOTIF compliance, HIL testing, or SIL testing.

---

## Why Robustness Analysis Was Added

The basic scenario verification uses fixed deterministic input values.

However, real engineering inputs may include uncertainty or small variations.

Therefore, this project adds a simplified robustness analysis using random variation around representative base scenarios.

This strengthens the project by checking whether the warning state remains reasonable when inputs such as speed, distance, friction, and actuator delay change slightly.

---

## MATLAB Script

The robustness analysis is implemented in:

`matlab/robustness_monte_carlo_analysis.m`

The script generates:

- `results/robustness_results.csv`
- `results/robustness_sample_points.csv`
- `figures/robustness_pass_rate.png`
- `figures/threshold_sensitivity_map.png`

---

## Analysed Robustness Cases

| Case ID | Case Name | Expected State | Purpose |
|---|---|---|---|
| ROB-01 | Safe dry following | SAFE | Check false emergency brake risk in a safe case. |
| ROB-02 | Wet-road warning case | WARNING | Check warning stability under wet-road uncertainty. |
| ROB-03 | Emergency dry obstacle | EMERGENCY_BRAKE | Check emergency brake-request stability. |
| ROB-04 | Delay-sensitive wet case | WARNING | Check sensitivity to delay and wet-road conditions. |

---

## Input Variations

The Monte Carlo analysis applies small random variations to:

| Input | Variation Type |
|---|---|
| ego speed | Gaussian variation around base speed |
| target distance | Gaussian variation around base distance |
| relative speed | Gaussian variation around base relative speed |
| friction coefficient | Gaussian variation around base road friction |
| actuator delay | Gaussian variation around base delay |

The values are limited to remain physically reasonable and inside the defined project ODD.

---

## Evaluation Metrics

| Metric | Meaning |
|---|---|
| expected_state_rate_percent | Percentage of Monte Carlo samples that keep the expected warning state. |
| emergency_brake_rate_percent | Percentage of samples classified as EMERGENCY_BRAKE. |
| false_emergency_rate_percent | Emergency brake rate in cases expected to be SAFE or CAUTION. |
| dominant_state | Most frequent calculated warning state in the sampled case. |

---

## Interpretation

A high expected-state rate indicates that the logic is stable around the selected base case.

A low expected-state rate indicates that the scenario is close to a threshold or sensitive to input uncertainty.

This does not mean the system is validated for production use.

It only provides concept-level evidence that the warning logic behaves consistently under simplified input variation.

---

## Output Files

| Output File | Purpose |
|---|---|
| results/robustness_results.csv | Summary of robustness metrics for each analysed case. |
| results/robustness_sample_points.csv | Sample-level Monte Carlo outputs. |
| figures/robustness_pass_rate.png | Bar chart of expected-state rate. |
| figures/threshold_sensitivity_map.png | Scatter plot showing state sensitivity across speed and distance variations. |

---

## Link to ODD and Scenario Verification

The robustness analysis remains inside the project ODD:

- low-speed urban/campus operation;
- dry or wet asphalt;
- straight-road assumption;
- simplified scenario-level inputs;
- lead vehicle or stationary obstacle interpretation.

It extends the scenario-based verification by testing small variations around representative cases.

---

## Scope Note

This robustness analysis is intentionally lightweight.

It is not a substitute for real-world validation, certified brake-by-wire testing, formal safety assurance, HIL/SIL testing, or production AEB verification.

---

## Conclusion

The robustness and sensitivity analysis strengthens the project by adding verification under simplified uncertainty.

It improves the MATLAB engineering value of the project while keeping the scope realistic and suitable for university-level automotive systems engineering work.
