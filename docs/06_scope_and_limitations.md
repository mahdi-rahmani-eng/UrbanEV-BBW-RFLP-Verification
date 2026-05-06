# Scope and Limitations

## Project Scope

This project includes:

- Low-speed urban EV concept comparison
- MATLAB-based range estimation
- MATLAB-based stopping-distance calculation
- TTC calculation using target distance and relative speed
- Warning-state classification
- Concept-level emergency brake-request logic
- Actuator concept selection
- Lightweight RFLP decomposition
- Scenario-based MATLAB verification
- Requirement-to-verification traceability

## What This Project Does Not Claim

This project does not claim:

- Production-ready brake-by-wire design
- Complete industrial MBSE implementation
- ISO 26262 compliance
- SOTIF compliance
- Real perception or sensor fusion
- ROS2 integration in the main version
- Hardware-in-the-loop or software-in-the-loop validation
- Real actuator dynamics
- Full autonomous emergency braking
- Production AEB functionality

## Important Note

The brake-by-wire part of this project is treated only as concept-level emergency brake-request logic. It does not model redundancy, diagnostics, hydraulic backup, detailed actuator dynamics, pressure control, or failure handling.
