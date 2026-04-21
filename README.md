# Haptic Feedback System for Isometric Torque Control

## Overview
The focus is on developing a real-time haptic feedback system to provide force control for a robotic wrist exoskeleton (or any 2-jointed robot). The system enables controlled force interaction between the user and the device.

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
 
## Interaction Modes
- **User Active (Person Active)**:  
  The participant actively applies torque while the robotic system resists the motion.  
  This mode evaluates voluntary force generation and user-driven interaction.

- **User Passive (Person Reactive)**:  
  The robotic system actively applies torque while the participant provides a resistive response.  
  This mode evaluates how the user reacts to externally applied forces.


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
