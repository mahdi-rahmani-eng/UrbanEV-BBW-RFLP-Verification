# 05 — Concept Screening

## Purpose

This document explains the first-level screening of the three low-speed urban EV concepts.

Concept screening is used as a quick qualitative comparison before the more detailed MATLAB-based concept scoring and selection.

---

## Link to the Course Method

In the concept-selection process, concept screening is a preliminary evaluation step used to reduce or compare design alternatives before detailed scoring.

The screening matrix compares each concept against a reference concept using a simple qualitative scale.

---

## Screening Scale

| Symbol | Meaning |
|---|---|
| + | Better than the reference concept for the selected criterion. |
| 0 | Approximately equal to the reference concept. |
| - | Worse than the reference concept for the selected criterion. |

---

## Reference Concept

Concept C2 is used as the reference concept because it represents the balanced urban EV option.

C2 is neither the lightest nor the most powerful concept. Instead, it provides a middle-ground configuration between C1 and C3.

---

## Concepts Compared

| Concept ID | Concept Name | Role in Screening |
|---|---|---|
| C1 | Campus-focused lightweight EV | Compared against C2. |
| C2 | Balanced urban EV | Reference concept. |
| C3 | Extended urban EV | Compared against C2. |

---

## Screening Criteria

The concepts are compared using the following qualitative criteria:

- range adequacy;
- braking feasibility;
- mass suitability;
- motor adequacy;
- implementation simplicity;
- urban usability;
- overall balance.

---

## Screening Matrix

The detailed screening matrix is stored in:

`data/concept_screening.csv`

| Criterion | C1 Campus Lightweight | C2 Balanced Reference | C3 Extended Urban | Interpretation |
|---|---|---|---|---|
| Range adequacy | - | 0 | + | C3 has higher range potential; C1 is limited. |
| Braking feasibility | + | 0 | - | C1 benefits from lower mass and speed; C3 has higher braking demand. |
| Mass suitability | + | 0 | - | C1 is the lightest; C3 is the heaviest. |
| Motor adequacy | - | 0 | + | C3 has the strongest motor; C1 is limited. |
| Implementation simplicity | + | 0 | - | C1 is simplest; C3 is more complex. |
| Urban usability | - | 0 | + | C3 supports broader urban use; C1 is campus-focused. |
| Overall balance | - | 0 | 0 | C2 remains the balanced reference. |

---

## Screening Interpretation

C1 performs well in mass suitability, braking feasibility, and implementation simplicity. However, it is weaker in range adequacy, motor adequacy, and urban usability.

C3 performs well in range adequacy, motor adequacy, and urban usability. However, it is weaker in mass suitability, braking feasibility, and implementation simplicity.

C2 remains the most balanced concept because it avoids the main weaknesses of both C1 and C3.

---

## Link to MATLAB-Based Concept Scoring

The screening step is qualitative and preliminary.

The final concept decision is made using MATLAB-based concept scoring, where range, braking distance, mass, motor adequacy, and feasibility are evaluated with weighted criteria.

---

## Scope Note

This screening is a university-level design-support step. It is not a full industrial product evaluation or market benchmark.
