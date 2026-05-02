# Minimum-Thrust Rocket Trajectory (Euler–Lagrange)

## Overview
This project derives an optimal planar rocket trajectory using the Euler–Lagrange equations. The objective is to minimise a quadratic thrust-effort cost functional while transferring the rocket from an initial position to a specified final position.

## Problem Formulation
Determine a trajectory \( (x(t), y(t)) \) that minimises total thrust effort subject to motion under constant gravitational acceleration.

## Key Results
- Cubic time-dependent trajectory satisfying boundary conditions
- Closed-form expression for optimal flight time
- Analytical thrust acceleration profile
- Trade-off between acceleration cost and gravity cost

## Mathematical Approach
The problem is formulated using the calculus of variations. The Euler–Lagrange equations are applied to derive the trajectory that minimises total thrust effort.

This leads to:
- Fourth-order differential equations
- Cubic polynomial solutions in time
- A closed-form expression for the optimal flight time

## Repository Structure
- `report/` → Full LaTeX report (PDF)
- `matlab/` → MATLAB simulation script
- `figures/` → Generated plots

## Results
The trajectory is linear in space but nonlinear in time. The optimal solution balances:
- High acceleration cost for fast motion
- Gravity cost for longer duration

## How to Run
Run the MATLAB script:

```matlab
rocket_optimisation.m
