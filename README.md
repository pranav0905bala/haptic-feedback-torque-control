# Haptic Feedback System for Isometric Torque Control

## Overview
This project focuses on developing a real-time haptic feedback system to provide precise isometric torque control for a robotic wrist exoskeleton. The system enables controlled force interaction between the user and the device.

## Problem Statement
Accurate torque feedback is critical in rehabilitation and human-robot interaction systems. The challenge is to design a system that can deliver stable, real-time torque feedback with minimal delay and high precision.

## System Architecture
- Actuation system for torque generation  
- Feedback loop for real-time measurement  
- MATLAB/Simulink-based control system  
- QUARC for real-time implementation  
- Custom GUI for real-time monitoring and control 

## Tech Stack
- MATLAB  
- Simulink  
- QUARC  

## Implementation
- Designed and tuned a force-based PI controller for robot movements  
- Integrated hardware feedback with real-time control loop  
- Developed a custom GUI for:
  - Real-time torque visualization  
  - System monitoring and debugging  
  - Parameter tuning (gain adjustment, setpoints)  

## Results
- Achieved stable torque tracking under varying conditions  
- Improved system responsiveness through controller tuning  
- Reduced steady-state error and oscillations
- Enabled intuitive system interaction through GUI-based control

##Features
- Start/stop control for experiments  
- Adjustable control parameters (PI gains, torque setpoint)  
- Real-time feedback visualization for debugging and validation


## Future Work
- Adaptive control strategies  
- Integration with advanced rehabilitation protocols  
