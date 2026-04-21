% Units [m, Nm, rad, s]
clc
close all
clear all


%% GUI
% th = 0*pi/180; 
%rng('shuffle');
%th = (0:30:330)*pi/180; 
% th = thi(randperm(length(thi)));
%maxTorque = [1.5 1.5]; % [1.5 1.5] [FE RU] [N] 
maxTorque = [1.5 1.5]; % [1.5 1.5] [FE RU] [N] 
pulseGuiPeriod = 0.1; % [s]
pulseGuiPulseWidth = 10; % [% of period]

%% Input - Stiffness ROM
% Training %
% mvtReps = 1; % 1 for training, 3 for study
% dsStiff = 2; % 2 for training, 1 for study

% Study %
mvtReps = 1; % 1 for training, 3 for study
dsStiff = 1; % 2 for training, 1 for study

%% Control Gains
%%% Force Control %%%
kPstudyZF = [175 225]; %[175 225] [Nm/rad]
kDstudyZF = [0.05 0.05]; % [Nms/rad]
tauDzStudyZF = [0.15 .15];%[0.15 .15]; % [Nm]
tauNoMvtStudyZF = [.2 .2];%[.2 .2]; % [Nm]  
cablePTstudyZF = [-3.5 -5.5]; % [N]
scopeDecStudyZF = 500; 
maxGuiAngle = 150*(pi/180); % [rad]

% kPstudyZF = [175 225]; % [Nm/rad]
% kDstudyZF = [0.05 0.05]; % [Nms/rad]
% tauDzStudyZF = [0.15 .15]; % [Nm]
% tauNoMvtStudyZF = [.2 .2]; % [Nm]
% cablePTstudyZF = [-3.5 -5.5]; % [N]
% scopeDecStudyZF = 500; 

% % Zero Force %
% kPTorqueCtrl = [175 250]; % [Nm/rad]
% kDTorqueCtrl = [0.05 0.05]; % [Nms/rad]
% tauDzTorqueCtrl = [0.02 .02]; % .2 .2 [Nm]
% % tauDzTorqueCtrl = [0.05 .05]; % .2 .2 [Nm]
% tauNoMvtTorqueCtrl = [.3 .3]; % .3 .3 [Nm]
% % cablePTTorqueCtrl = [3.5 3.5]; % -3.5 -3.5 [N] in past versions this value was neg, here positive
% cablePTTorqueCtrl = [.5 .5]; % -3.5 -3.5 [N] in past versions this value was neg, here positive

%%% Pos control %%%
kPposStudyPC = [15 30]; % [10 30] [25 40] % [Nm/rad]
kDposStudyPC = [0.1 0.1]; % [Nms/rad]
motPosFfTauStudyPC = 0.3; % [Nm]
motNegFfTauStudyPC = -0.1; % [Nm]
posCmdRateLimSTudyPC = 0.2; % [rad/s]
scopeDecStudyPC = 500; 


% % %% ROM Th Gen
% % if 1
% th = (0:15:345)*pi/180;    
% thBlock1 = th(randperm(length(th)));
% thBlock2 = th(randperm(length(th)));
% thBlock3 = th(randperm(length(th)));
% thetaSelStudyZF = [thBlock1 thBlock2 thBlock3];   
% % end


%% Software Limits 
% Joint Limits %
%xJlim = [120 72 70 60]*pi/180; % [F E U R], [rad]
xJdotLim = 10; % [rad/s]
tauJlim = 3; % [Nm]

% Motor Limits %
%xMlim = [160 160 160 160]*pi/180; % [F E U R] [rad]
xMdotLim = 10; % [rad/s]
tauMlim = 5; % 8 max, [Nm]

% Current 
iCmdSat = 3.17; % [A]
iCmdLim = 4; % [A]
iMeasLim = 3.75; % [A] 

    
%% Set Pars
% Motor %
iCmd2Volt = [2.5363 2.5798 2.4633 2.5251]; % [V/A]
iCont = 3.17; % [A]
iPeak = 42.4; % [A]
i2tTimeLim = 2; % [s]
iSign = [-1 -1 -1 -1]; 
motG = 43; 
motKt = 0.0603*motG; % [Nm/A] 

% Encoder %
sprEncCnts2Rad = (2*pi)/40000; % [rad/cnt]
sprEncSign = [1 -1 1 -1]; 
motEncCnts2Rad = (2*pi)/(4*2048*motG); % [rad/cnt]
motEncSign = [1 1 1 1];

% Physical Dimensions %
kS = [75.957 77.229]'; % [Nm/rad]
motPulleyRad = 0.034925; % [m] 

% Servo Amp %
iMeasServoConv = 2.2; % [A/V]

% Simulation Parameters % 
tS = 0.001; % [s]
fS = 1/tS; % [1/s]
xJlimPos = xJlim([1 3])';
xJlimNeg = -xJlim([2 4])';
xMlimPos = xMlim';
xMlimNeg = -xMlim([2 1 4 3])';