# 30-Second Elevator Pitch

## Purpose
This document provides a very short explanation of the UrbanEV-BBW-RFLP-Verification project for oral presentation or quick Q&A.

## 30-Second Pitch

This project presents a lightweight MBSE/RFLP workflow for concept-level verification of emergency brake-request logic in a low-speed urban electric vehicle.

I started from system needs and black-box analysis, defined requirements and scenarios, then moved to white-box analysis by decomposing the system into Simulink functional blocks.

The model estimates stopping distance and time-to-collision, classifies the situation as SAFE, CAUTION, WARNING, or EMERGENCY_BRAKE, and generates a brake request only in the emergency state.

The logic was tested across six scenarios using MATLAB/Simulink and official Simulink Test Manager results. The project is traceable and scope-safe, but it does not claim production brake-by-wire validation or ISO 26262 compliance.

## Ultra-Short Version

This is a concept-level MBSE/RFLP and MATLAB/Simulink verification project for emergency brake-request logic. It connects requirements, scenarios, Simulink architecture, testing, Test Manager results, and traceability, while staying clearly outside production brake-by-wire validation.
