function [ graphsloaded ] = GraphTrials( sbjtnum )
%GraphTrials takes the trials per condition and creates graphical
%representations to determine if there are outliers
%   Pulls in data from each condtion via CSV files produced by MATLAB after V3D processes and graphs it
%   Creates sub folder(S#-ConditionGraphs)for graphs after they have been created
%       Inputs: sbjtnum (participant number in string format)
%       Outputs: graphsloaded (boolian value determining if function was
%       successful or not, subfolder created with saved graphs in it
%       (graphs saved as png images numbered 1-31)
%   Created by Victoria Price (Fall 2016, Matlab 2014a)

%% Directory for files, defaults to current file if not edited.
%DIRECTORY = cd('U:\test');
graphsloaded = false;       %notes graphs are not loaded
SubFolderNAME = strcat(sbjtnum, '-Condtion Graphs');
mkdir(SubFolderNAME);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for EMG (electromyography)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Read File with data
EMGfile = strcat(sbjtnum, '-EMG.csv');
[EMG, TitleLabels] = xlsread(EMGfile);

%Find trials for C1
Find_EMGC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
EMGC1 = find(~cellfun(@isempty,Find_EMGC1));
   VLC1= EMG(:, EMGC1:4:EMGC1(end));      %Vastus Lateralis
   BFC1= EMG(:, EMGC1+1:4:EMGC1(end));    %Biceps Femoris
   LGC1= EMG(:, EMGC1+2:4:EMGC1(end));    %Lateral Gastrocnemius
   ATC1= EMG(:, EMGC1+3:4:EMGC1(end));    %Anterior Tibialis

% Find trials for C2
Find_EMGC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
EMGC2 = find(~cellfun(@isempty,Find_EMGC2));
   VLC2= EMG(:, EMGC2:4:EMGC2(end));
   BFC2= EMG(:, EMGC2+1:4:EMGC2(end));
   LGC2= EMG(:, EMGC2+2:4:EMGC2(end));
   ATC2= EMG(:, EMGC2+3:4:EMGC2(end));
   
% Find trials for C3
Find_EMGC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
EMGC3 = find(~cellfun(@isempty,Find_EMGC3));
   VLC3= EMG(:, EMGC3:4:EMGC3(end));
   BFC3= EMG(:, EMGC3+1:4:EMGC3(end));
   LGC3= EMG(:, EMGC3+2:4:EMGC3(end));
   ATC3= EMG(:, EMGC3+3:4:EMGC3(end));
   
% Plot graphs (each muscle group) for each condtion
%C1 Graphs
h(1)= figure ('Name','EMG C1','Visible','off');
subplot (4,1,1);
plot(BFC1);
xlabel('Time');
ylabel('Frequency');
title('Biceps Femoris'); 
legend ('show');
subplot (4,1,2);
plot(VLC1);
xlabel('Time');
ylabel('Frequency');
title('Vastus Lateralis');
subplot (4,1,3);
plot(LGC1);
xlabel('Time');
ylabel('Frequency');
title('Lateral Gastrocnemius');
subplot (4,1,4);
plot(ATC1);
xlabel('Time');
ylabel('Frequency');
title('Anterior Tibialis');


%C2 Graphs
h(2)=figure ('Name','EMG C2', 'Visible','off')
subplot (4,1,1);
plot(BFC2);
xlabel('Time');
ylabel('Frequency');
title('Biceps Femoris'); 
legend ('show');
subplot (4,1,2);
plot(VLC2);
xlabel('Time');
ylabel('Frequency');
title('Vastus Lateralis');
subplot (4,1,3);
plot(LGC2);
xlabel('Time');
ylabel('Frequency');
title('Lateral Gastrocnemius');
subplot (4,1,4);
plot(ATC2);
xlabel('Time');
ylabel('Frequency');
title('Anterior Tibialis');

%C3 Graphs
h(3)=figure ('Name','EMG C3', 'Visible','off');
subplot (4,1,1);
plot(BFC3);
xlabel('Time');
ylabel('Frequency');
title('Biceps Femoris');
legend ('show');
subplot (4,1,2);
plot(VLC3);
xlabel('Time');
ylabel('Frequency');
title('Vastus Lateralis');
subplot (4,1,3);
plot(LGC3);
xlabel('Time');
ylabel('Frequency');
title('Lateral Gastrocnemius');
subplot (4,1,4);
plot(ATC3);
xlabel('Time');
ylabel('Frequency');
title('Anterior Tibialis');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for GRF (ground reaction force)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
GRFfile = strcat(sbjtnum, '-GRF.csv');
[GRF, TitleLabels] = xlsread(GRFfile);

%Find trials for C1
Find_GRFC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
GRFC1 = find(~cellfun(@isempty,Find_GRFC1));
   GRForceC1= GRF(:, GRFC1+2:6:GRFC1(end));      %GRF- z axis
   COPC1= GRF(:, GRFC1+5:6:GRFC1(end));      %Center of pressure- z axis

%Find trials for C2
Find_GRFC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
GRFC2 = find(~cellfun(@isempty,Find_GRFC2));
   GRForceC2= GRF(:, GRFC2+2:6:GRFC2(end));      
   COPC2= GRF(:, GRFC2+5:6:GRFC2(end));      

%Find trials for C3
Find_GRFC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
GRFC3 = find(~cellfun(@isempty,Find_GRFC3));
   GRForceC3= GRF(:, GRFC3+2:6:GRFC3(end));     
   COPC3= GRF(:, GRFC3+5:6:GRFC3(end));     

% Plot graphs for each condtion
%C1 Graphs
h(4)=figure ('Name','GRF C1','Visible','off');
subplot (2,1,1);
plot(GRForceC1);
xlabel('Time');
ylabel('Force (N)');
title('Vertical Ground Reaction Force'); 
legend ('show');
subplot (2,1,2);
plot(COPC1);
xlabel('Time');
ylabel('Frequency');
title('Center of Pressure');

%C2 Graphs
h(5)=figure ('Name','GRF C2','Visible','off');
subplot (2,1,1);
plot(GRForceC2);
xlabel('Time');
ylabel('Force (N)');
title('Vertical Ground Reaction Force'); 
legend ('show');
subplot (2,1,2);
plot(COPC2);
xlabel('Time');
ylabel('Frequency');
title('Center of Pressure');

%C3 Graphs
h(6)=figure ('Name','GRF C3','Visible','off');
subplot (2,1,1);
plot(GRForceC3);
xlabel('Time');
ylabel('Force (N)');
title('Vertical Ground Reaction Force'); 
legend ('show');
subplot (2,1,2);
plot(COPC3);
xlabel('Time');
ylabel('Frequency');
title('Center of Pressure');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for JMF (joint moment force- torque)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Read File with data
JMFfile = strcat(sbjtnum, '-JMF.csv');
[JMF, TitleLabels] = xlsread(JMFfile);

%Find trials for C1
Find_JMFC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
JMFC1 = find(~cellfun(@isempty,Find_JMFC1));
   AnkleTorqueC1= JMF(:, JMFC1+1:12:JMFC1(end));     %Ankle Torque- y axis
   KneeTorqueC1= JMF(:, JMFC1+4:12:JMFC1(end));      %Knee Torque- y axis 
   HipTorqueC1= JMF(:, JMFC1+7:12:JMFC1(end));       %Hip Torque- y axis
   SupportTorqueC1= JMF(:, JMFC1+10:12:JMFC1(end));   %Support Torque- y axis

%Find trials for C2
Find_JMFC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
JMFC2 = find(~cellfun(@isempty,Find_JMFC2));
   AnkleTorqueC2= JMF(:, JMFC2+1:12:JMFC2(end));     
   KneeTorqueC2= JMF(:, JMFC2+4:12:JMFC2(end));      
   HipTorqueC2= JMF(:, JMFC2+7:12:JMFC2(end));      
   SupportTorqueC2= JMF(:, JMFC2+10:12:JMFC2(end));   
   
%Find trials for C3
Find_JMFC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
JMFC3 = find(~cellfun(@isempty,Find_JMFC3));
   AnkleTorqueC3= JMF(:, JMFC3+1:12:JMFC3(end));    
   KneeTorqueC3= JMF(:, JMFC3+4:12:JMFC3(end));      
   HipTorqueC3= JMF(:, JMFC3+7:12:JMFC3(end));      
   SupportTorqueC3= JMF(:, JMFC3+10:12:JMFC3(end));  

% Plot graphs for each condtion
%C1 Graphs
h(7)=figure ('Name','JMF C1','Visible','off');
subplot (4,1,1);
plot(SupportTorqueC1);
xlabel('Time');
ylabel('Torque (Nm)');
title('Support Torque'); 
legend ('show');
subplot (4,1,2);
plot(HipTorqueC1);
xlabel('Time');
ylabel('Torque (Nm)');
title('Hip Torque');
subplot (4,1,3);
plot(KneeTorqueC1);
xlabel('Time');
ylabel('Torque (Nm)');
title('Knee Torque');
subplot (4,1,4);
plot(AnkleTorqueC1);
xlabel('Time');
ylabel('Torque (Nm)');
title('Ankle Torque');

%C2 Graphs
h(8)=figure ('Name','JMF C2','Visible','off');
subplot (4,1,1);
plot(SupportTorqueC2);
xlabel('Time');
ylabel('Torque (Nm)');
title('Support Torque'); 
legend ('show');
subplot (4,1,2);
plot(HipTorqueC2);
xlabel('Time');
ylabel('Torque (Nm)');
title('Hip Torque');
subplot (4,1,3);
plot(KneeTorqueC2);
xlabel('Time');
ylabel('Torque (Nm)');
title('Knee Torque');
subplot (4,1,4);
plot(AnkleTorqueC2);
xlabel('Time');
ylabel('Torque (Nm)');
title('Ankle Torque');

%C3 Graphs
h(9)=figure ('Name','JMF C3','Visible','off');
subplot (4,1,1);
plot(SupportTorqueC3);
xlabel('Time');
ylabel('Torque (Nm)');
title('Support Torque'); 
legend ('show');
subplot (4,1,2);
plot(HipTorqueC3);
xlabel('Time');
ylabel('Torque (Nm)');
title('Hip Torque');
subplot (4,1,3);
plot(KneeTorqueC3);
xlabel('Time');
ylabel('Torque (Nm)');
title('Knee Torque');
subplot (4,1,4);
plot(AnkleTorqueC3);
xlabel('Time');
ylabel('Torque (Nm)');
title('Ankle Torque');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for JP  (joint angular posistion)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
JPfile = strcat(sbjtnum, '-JP.csv');
[JP, TitleLabels] = xlsread(JPfile);

%Find trials for C1
Find_JPC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
JPC1 = find(~cellfun(@isempty,Find_JPC1));
   AnkleAngPosC1= JP(:, JPC1+1:9:JPC1(end));     %Ankle Angular Position - y axis
   KneeAngPosC1= JP(:, JPC1+4:9:JPC1(end));      %Knee Angular Position- y axis 
   HipAngPosC1= JP(:, JPC1+7:9:JPC1(end));       %Hip Angular Position- y axis
   
%Find trials for C2
Find_JPC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
JPC2 = find(~cellfun(@isempty,Find_JPC2));
   AnkleAngPosC2= JP(:, JPC2+1:9:JPC2(end));    
   KneeAngPosC2= JP(:, JPC2+4:9:JPC2(end));     
   HipAngPosC2= JP(:, JPC2+7:9:JPC2(end));       
   
%Find trials for C3
Find_JPC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
JPC3 = find(~cellfun(@isempty,Find_JPC3));
   AnkleAngPosC3= JP(:, JPC3+1:9:JPC3(end));     
   KneeAngPosC3= JP(:, JPC3+4:9:JPC3(end));       
   HipAngPosC3= JP(:, JPC3+7:9:JPC3(end));  
   
%C1 Graphs
h(10)=figure ('Name','JP C1','Visible','off');
subplot (3,1,1);
plot(HipAngPosC1);
xlabel('Time');
ylabel('Postion (m)');
title('Hip Angular Position');
legend ('show');
subplot (3,1,2);
plot(KneeAngPosC1);
xlabel('Time');
ylabel('Postion (m)');
title('Knee Angular Position');
subplot (3,1,3);
plot(AnkleAngPosC1);
xlabel('Time');
ylabel('Postion (m)');
title('Ankle Angular Position');

%C2 Graphs
h(11)=figure ('Name','JP C2','Visible','off');
subplot (3,1,1);
plot(HipAngPosC2);
xlabel('Time');
ylabel('Postion (m)');
title('Hip Angular Position');
legend ('show');
subplot (3,1,2);
plot(KneeAngPosC2);
xlabel('Time');
ylabel('Postion (m)');
title('Knee Angular Position');
subplot (3,1,3);
plot(AnkleAngPosC2);
xlabel('Time');
ylabel('Postion (m)');
title('Ankle Angular Position');

%C3 Graphs
h(12)=figure ('Name','JP C3','Visible','off');
subplot (3,1,1);
plot(HipAngPosC3);
xlabel('Time');
ylabel('Postion (m)');
title('Hip Angular Position');
legend ('show');
subplot (3,1,2);
plot(KneeAngPosC3);
xlabel('Time');
ylabel('Postion (m)');
title('Knee Angular Position');
subplot (3,1,3);
plot(AnkleAngPosC3);
xlabel('Time');
ylabel('Postion (m)');
title('Ankle Angular Position');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for JRF  (joint reaction force)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
JRFfile = strcat(sbjtnum, '-JRF.csv');
[JRF, TitleLabels] = xlsread(JRFfile);

%Find trials for C1
Find_JRFC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
JRFC1 = find(~cellfun(@isempty,Find_JRFC1));
   AnkleForceC1= JRF(:, JRFC1+2:9:JRFC1(end));     %Ankle Force - z axis
   KneeForceC1= JRF(:, JRFC1+5:9:JRFC1(end));       %Knee Force - z axis
   HipForceC1= JRF(:, JRFC1+8:9:JRFC1(end));        %Hip Force - z axis
   
%Find trials for C2
Find_JRFC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
JRFC2 = find(~cellfun(@isempty,Find_JRFC2));
   AnkleForceC2= JRF(:, JRFC2+2:9:JRFC2(end));     
   KneeForceC2= JRF(:, JRFC2+5:9:JRFC2(end));       
   HipForceC2= JRF(:, JRFC2+8:9:JRFC2(end));  
   
%Find trials for C3
Find_JRFC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
JRFC3 = find(~cellfun(@isempty,Find_JRFC3));
   AnkleForceC3= JRF(:, JRFC3+2:9:JRFC3(end));     
   KneeForceC3= JRF(:, JRFC3+5:9:JRFC3(end));       
   HipForceC3= JRF(:, JRFC3+8:9:JRFC3(end));  
   
%C1 Graphs
h(13)=figure ('Name','JRF C1','Visible','off');
subplot (3,1,1);
plot(HipForceC1);
xlabel('Time');
ylabel('Force (N)');
title('Hip Joint Force');
legend ('show');
subplot (3,1,2);
plot(KneeForceC1);
xlabel('Time');
ylabel('Force (N)');
title('Knee Joint Force');
subplot (3,1,3);
plot(AnkleForceC1);
xlabel('Time');
ylabel('Force (N)');
title('Ankle Joint Force');

%C2 Graphs
h(14)=figure ('Name','JRF C2','Visible','off');
subplot (3,1,1);
plot(HipForceC2);
xlabel('Time');
ylabel('Force (N)');
title('Hip Joint Force');
legend ('show');
subplot (3,1,2);
plot(KneeForceC2);
xlabel('Time');
ylabel('Force (N)');
title('Knee Joint Force');
subplot (3,1,3);
plot(AnkleForceC2);
xlabel('Time');
ylabel('Force (N)');
title('Ankle Joint Force');

%C3 Graphs
h(15)=figure ('Name','JRF C3','Visible','off');
subplot (3,1,1);
plot(HipForceC3);
xlabel('Time');
ylabel('Force (N)');
title('Hip Joint Force');
legend ('show');
subplot (3,1,2);
plot(KneeForceC3);
xlabel('Time');
ylabel('Force (N)');
title('Knee Joint Force');
subplot (3,1,3);
plot(AnkleForceC3);
xlabel('Time');
ylabel('Force (N)');
title('Ankle Joint Force');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for JV  (joint velocity)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
JVfile = strcat(sbjtnum, '-JV.csv');
[JV, TitleLabels] = xlsread(JVfile);

%Find trials for C1
Find_JVC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
JVC1 = find(~cellfun(@isempty,Find_JVC1));
   AnkleVelC1= JV(:, JVC1:9:JVC1(end));     %Ankle Velocity- x axis
   KneeVelC1= JV(:, JVC1+3:9:JVC1(end));    %Knee Velocity- x axis    
   HipVelC1= JP(:, JVC1+6:9:JVC1(end));      %Hip Velocity- x axis
   
%Find trials for C2
Find_JVC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
JVC2 = find(~cellfun(@isempty,Find_JVC2));
   AnkleVelC2= JV(:, JVC2:9:JVC2(end));     
   KneeVelC2= JV(:, JVC2+3:9:JVC2(end));       
   HipVelC2= JP(:, JVC2+6:9:JVC2(end));  
   
%Find trials for C3
Find_JVC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
JVC3 = find(~cellfun(@isempty,Find_JVC3));
   AnkleVelC3= JV(:, JVC3:9:JVC3(end));     
   KneeVelC3= JV(:, JVC3+3:9:JVC3(end));       
   HipVelC3= JP(:, JVC3+6:9:JVC3(end));  
   
%C1 Graphs
h(16)=figure ('Name','JV C1','Visible','off');
subplot (3,1,1);
plot(HipVelC1);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Hip Velocity');
legend ('show');
subplot (3,1,2);
plot(KneeVelC1);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Knee Velocity');
subplot (3,1,3);
plot(AnkleVelC1);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Ankle Velocity');

%C2 Graphs
h(17)=figure ('Name','JV C2','Visible','off');
subplot (3,1,1);
plot(HipVelC2);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Hip Velocity');
legend ('show');
subplot (3,1,2);
plot(KneeVelC2);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Knee Velocity');
subplot (3,1,3);
plot(AnkleVelC2);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Ankle Velocity');

%C3 Graphs
h(18)=figure ('Name','JV C3','Visible','off');
subplot (3,1,1);
plot(HipVelC3);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Hip Velocity');
legend ('show');
subplot (3,1,2);
plot(KneeVelC3);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Knee Velocity');
subplot (3,1,3);
plot(AnkleVelC3);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Ankle Velocity');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for LP  (linear position)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
LPfile = strcat(sbjtnum, '-LP.csv');
[LP, TitleLabels] = xlsread(LPfile);

%Find trials for C1
Find_LPC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
LPC1 = find(~cellfun(@isempty,Find_LPC1));  
   MetheadLPosC1= LP(:, LPC1+2:15:LPC1(end));     %Methead Linear Position- z axis    
   AnkleLPosC1= LP(:, LPC1+5:15:LPC1(end));     %Ankle Linear Position- z axis       
   KneeLPosC1= LP(:, LPC1+8:15:LPC1(end));     %Knee Linear Position- z axis
   HipLPosC1= LP(:, LPC1+11:15:LPC1(end));     %Hip Linear Position- z axis
   PelvisLPosC1= LP(:, LPC1+14:15:LPC1(end));     %Proximal Pelvis Linear Position- z axis
   
%Find trials for C2
Find_LPC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
LPC2 = find(~cellfun(@isempty,Find_LPC2));
   MetheadLPosC2= LP(:, LPC2+2:15:LPC2(end));     
   AnkleLPosC2= LP(:, LPC2+5:15:LPC2(end));       
   KneeLPosC2= LP(:, LPC2+8:15:LPC2(end));
   HipLPosC2= LP(:, LPC2+11:15:LPC2(end));
   PelvisLPosC2= LP(:, LPC2+14:15:LPC2(end));
   
%Find trials for C3
Find_LPC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
LPC3 = find(~cellfun(@isempty,Find_LPC3));
   MetheadLPosC3= LP(:, LPC3+2:15:LPC3(end));     
   AnkleLPosC3= LP(:, LPC3+5:15:LPC3(end));       
   KneeLPosC3= LP(:, LPC3+8:15:LPC3(end));
   HipLPosC3= LP(:, LPC3+11:15:LPC3(end));
   PelvisLPosC3= LP(:, LPC3+14:15:LPC3(end));
   
%C1 Graphs
h(19)=figure ('Name','LP C1','Visible','off');
subplot (5,1,1);
plot(PelvisLPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Proximal Pelvis Position');
legend ('show');
subplot (5,1,2);
plot(HipLPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Hip Position');
subplot (5,1,3);
plot(KneeLPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Knee Position');
subplot (5,1,4);
plot(AnkleLPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Ankle Position');
subplot (5,1,5);
plot(MetheadLPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Methead Position');

%C2 Graphs
h(20)=figure ('Name','LP C2','Visible','off');
subplot (5,1,1);
plot(PelvisLPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Proximal Pelvis Position');
legend ('show');
subplot (5,1,2);
plot(HipLPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Hip Position');
subplot (5,1,3);
plot(KneeLPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Knee Position');
subplot (5,1,4);
plot(AnkleLPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Ankle Position');
subplot (5,1,5);
plot(MetheadLPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Methead Position');

%C3 Graphs
h(21)=figure ('Name','LP C3','Visible','off');
subplot (5,1,1);
plot(PelvisLPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Proximal Pelvis Position');
legend ('show');
subplot (5,1,2);
plot(HipLPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Hip Position');
subplot (5,1,3);
plot(KneeLPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Knee Position');
subplot (5,1,4);
plot(AnkleLPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Ankle Position');
subplot (5,1,5);
plot(MetheadLPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Methead Position');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for MVC  (max voluntary contraction)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
MVCfile = strcat(sbjtnum, '-MVC.csv');
[MVC] = xlsread(MVCfile);

%Select max trial condition
   MaxVL= MVC(:, MVC(14));      %Vastus Lateralis
   MaxBF= MVC(:, MVC(7));    %Biceps Femoris
   MaxLG= MVC(:, MVC(13));    %Lateral Gastrocnemius
   MaxAT= MVC(:, MVC(4));    %Anterior Tibialis

%Graph
h(22)=figure ('Name','MVC','Visible','off');
subplot (4,1,1);
plot(MaxBF);
xlabel('Time');
ylabel('Frequency');
title('Max Voluntary Contraction- Biceps Femoris');
subplot (4,1,2);
plot(MaxVL);
xlabel('Time');
ylabel('Frequency');
title('Max Voluntary Contraction- Vastus Lateralis');
subplot (4,1,3);
plot(MaxLG);
xlabel('Time');
ylabel('Frequency');
title('Max Voluntary Contraction- Lateral Gastrocnemius');
subplot (4,1,4);
plot(MaxAT);
xlabel('Time');
ylabel('Frequency');
title('Max Voluntary Contraction- Anterior Tibialis');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for PWR  (power)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
PWRfile = strcat(sbjtnum, '-PWR.csv');
[PWR, TitleLabels] = xlsread(PWRfile);

%Find trials for C1
Find_PWRC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
PWRC1 = find(~cellfun(@isempty,Find_PWRC1));    
   AnklePwrC1= PWR(:, PWRC1+1:12:PWRC1(end));       %Ankle power- y direction 
   KneePwrC1= PWR(:, PWRC1+4:12:PWRC1(end));        %Knee power- y direction
   HipPwrC1= PWR(:, PWRC1+7:12:PWRC1(end));         %Hip power- y direction
   TotalPwrC1= PWR(:, PWRC1+10:12:PWRC1(end));      %Total power- y direction
   
%Find trials for C2
Find_PWRC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
PWRC2 = find(~cellfun(@isempty,Find_PWRC2));
   AnklePwrC2= PWR(:, PWRC2+1:12:PWRC2(end));    
   KneePwrC2= PWR(:, PWRC2+4:12:PWRC2(end));      
   HipPwrC2= PWR(:, PWRC2+7:12:PWRC2(end));      
   TotalPwrC2= PWR(:, PWRC2+10:12:PWRC2(end)); 
   
%Find trials for C3
Find_PWRC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
PWRC3 = find(~cellfun(@isempty,Find_PWRC3));
   AnklePwrC3= PWR(:, PWRC3+1:12:PWRC3(end));    
   KneePwrC3= PWR(:, PWRC3+4:12:PWRC3(end));      
   HipPwrC3= PWR(:, PWRC3+7:12:PWRC3(end));      
   TotalPwrC3= PWR(:, PWRC3+10:12:PWRC3(end));  

% Plot graphs for each condtion
%C1 Graphs
h(23)=figure ('Name','PWR C1','Visible','off');
subplot (4,1,1);
plot(TotalPwrC1);
xlabel('Time');
ylabel('Power (J/s)');
title('Total Power'); 
legend ('show');
subplot (4,1,2);
plot(HipPwrC1);
xlabel('Time');
ylabel('Power (J/s)');
title('Hip Power');
subplot (4,1,3);
plot(KneePwrC1);
xlabel('Time');
ylabel('Power (J/s)');
title('Knee Power');
subplot (4,1,4);
plot(AnklePwrC1);
xlabel('Time');
ylabel('Power (J/s)');
title('Ankle Power');

%C2 Graphs
h(24)=figure ('Name','PWR C2','Visible','off');
subplot (4,1,1);
plot(TotalPwrC2);
xlabel('Time');
ylabel('Power (J/s)');
title('Total Power'); 
legend ('show');
subplot (4,1,2);
plot(HipPwrC2);
xlabel('Time');
ylabel('Power (J/s)');
title('Hip Power');
subplot (4,1,3);
plot(KneePwrC2);
xlabel('Time');
ylabel('Power (J/s)');
title('Knee Power');
subplot (4,1,4);
plot(AnklePwrC2);
xlabel('Time');
ylabel('Power (J/s)');
title('Ankle Power');

%C3 Graphs
h(25)=figure ('Name','PWR C3','Visible','off');
subplot (4,1,1);
plot(TotalPwrC3);
xlabel('Time');
ylabel('Power (J/s)');
title('Total Power'); 
legend ('show');
subplot (4,1,2);
plot(HipPwrC3);
xlabel('Time');
ylabel('Power (J/s)');
title('Hip Power');
subplot (4,1,3);
plot(KneePwrC3);
xlabel('Time');
ylabel('Power (J/s)');
title('Knee Power');
subplot (4,1,4);
plot(AnklePwrC3);
xlabel('Time');
ylabel('Power (J/s)');
title('Ankle Power');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for SAP  (segment angular position)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
SAPfile = strcat(sbjtnum, '-SAP.csv');
[SAP, TitleLabels] = xlsread(SAPfile);

%Find trials for C1
Find_SAPC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
SAPC1 = find(~cellfun(@isempty,Find_SAPC1));    
   FootPosC1= SAP(:, SAPC1+2:12:SAPC1(end));     %Foot Position- z axis
   ShankPosC1= SAP(:, SAPC1+5:12:SAPC1(end));      %Shank Position- z axis
   ThighPosC1= SAP(:, SAPC1+8:12:SAPC1(end));      %Thigh position- z axis
   PelvisPosC1= SAP(:, SAPC1+11:12:SAPC1(end));      %Pelvis position- z axis
   
%Find trials for C2
Find_SAPC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
SAPC2 = find(~cellfun(@isempty,Find_SAPC2));
   FootPosC2= SAP(:, SAPC2+2:12:SAPC2(end));    
   ShankPosC2= SAP(:, SAPC2+5:12:SAPC2(end));      
   ThighPosC2= SAP(:, SAPC2+8:12:SAPC2(end));      
   PelvisPosC2= SAP(:, SAPC2+11:12:SAPC2(end));  
   
%Find trials for C3
Find_SAPC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
SAPC3 = find(~cellfun(@isempty,Find_SAPC3));
   FootPosC3= SAP(:, SAPC3+2:12:SAPC3(end));    
   ShankPosC3= SAP(:, SAPC3+5:12:SAPC3(end));      
   ThighPosC3= SAP(:, SAPC3+8:12:SAPC3(end));      
   PelvisPosC3= SAP(:, SAPC3+11:12:SAPC3(end));  

% Plot graphs for each condtion
%C1 Graphs
h(26)=figure ('Name','SAP C1','Visible','off');
subplot (4,1,1);
plot(PelvisPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Pelvis Position'); 
legend ('show');
subplot (4,1,2);
plot(ThighPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Thigh Position');
subplot (4,1,3);
plot(ShankPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Shank Position');
subplot (4,1,4);
plot(FootPosC1);
xlabel('Time');
ylabel('Position (m)');
title('Foot Position');

%C2 Graphs
h(27)=figure ('Name','SAP C2','Visible','off');
subplot (4,1,1);
plot(PelvisPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Pelvis Position'); 
legend ('show');
subplot (4,1,2);
plot(ThighPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Thigh Position');
subplot (4,1,3);
plot(ShankPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Shank Position');
subplot (4,1,4);
plot(FootPosC2);
xlabel('Time');
ylabel('Position (m)');
title('Foot Position');

%C3 Graphs
h(28)=figure ('Name','SAP C3','Visible','off');
subplot (4,1,1);
plot(PelvisPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Pelvis Position'); 
legend ('show');
subplot (4,1,2);
plot(ThighPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Thigh Position');
subplot (4,1,3);
plot(ShankPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Shank Position');
subplot (4,1,4);
plot(FootPosC3);
xlabel('Time');
ylabel('Position (m)');
title('Foot Position');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot graphs for SAV  (Segment angle velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read File with data
SAVfile = strcat(sbjtnum, '-SAV.csv');
[SAV, TitleLabels] = xlsread(SAVfile);

%Find trials for C1
Find_SAVC1 = strfind(TitleLabels(1,:), '_C1', 'ForceCellOutput',true); %Find C1 files
SAVC1 = find(~cellfun(@isempty,Find_SAVC1));
   FootVelC1= SAV(:, SAVC1:12:SAVC1(end));    %foot velocity- x axis
   ShankVelC1= SAV(:, SAVC1+3:12:SAVC1(end));   %shank velocity- x axis   
   ThighVelC1= SAV(:, SAVC1+6:12:SAVC1(end));      %thigh velocity- x axis
   PelvisVelC1= SAV(:, SAVC1+9:12:SAVC1(end));  %pelvis velocity- x axis
   
%Find trials for C2
Find_SAVC2 = strfind(TitleLabels(1,:), '_C2', 'ForceCellOutput',true); %Find C2 files
SAVC2 = find(~cellfun(@isempty,Find_SAVC2));
   FootVelC2= SAV(:, SAVC2:12:SAVC2(end));    
   ShankVelC2= SAV(:, SAVC2+3:12:SAVC2(end));      
   ThighVelC2= SAV(:, SAVC2+6:12:SAVC2(end));      
   PelvisVelC2= SAV(:, SAVC2+9:12:SAVC2(end));  
   
%Find trials for C3
Find_SAVC3 = strfind(TitleLabels(1,:), '_C3', 'ForceCellOutput',true); %Find C3 files
SAVC3 = find(~cellfun(@isempty,Find_SAVC3));
   FootVelC3= SAV(:, SAVC3:12:SAVC3(end));    
   ShankVelC3= SAV(:, SAVC3+3:12:SAVC3(end));      
   ThighVelC3= SAV(:, SAVC3+6:12:SAVC3(end));      
   PelvisVelC3= SAV(:, SAVC3+9:12:SAVC3(end));  

% Plot graphs for each condtion
%C1 Graphs
h(29)=figure ('Name','SAV C1','Visible','off');
subplot (4,1,1);
plot(PelvisVelC1);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Pelvis Velocity'); 
legend ('show');
subplot (4,1,2);
plot(ThighVelC1);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Thigh Velocity');
subplot (4,1,3);
plot(ShankVelC1);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Shank Velocity');
subplot (4,1,4);
plot(FootVelC1);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Foot Velocity');

%C2 Graphs
h(30)=figure ('Name','SAV C2','Visible','off');
subplot (4,1,1);
plot(PelvisVelC2);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Pelvis Velocity'); 
legend ('show');
subplot (4,1,2);
plot(ThighVelC2);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Thigh Velocity');
subplot (4,1,3);
plot(ShankVelC2);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Shank Velocity');
subplot (4,1,4);
plot(FootVelC2);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Foot Velocity');

%C3 Graphs
h(31)=figure ('Name','SAV C3','Visible','off');
subplot (4,1,1);
plot(PelvisVelC3);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Pelvis Velocity'); 
legend ('show');
subplot (4,1,2);
plot(ThighVelC3);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Thigh Velocity');
subplot (4,1,3);
plot(ShankVelC3);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Shank Velocity');
subplot (4,1,4);
plot(FootVelC3);
xlabel('Time');
ylabel('Velocity (m/s)');
title('Foot Velocity');

%% Export the graphs to a new folder (S#-ConditionGraphs)- images are numbered 1-31

for h=1:31;
    baseFileName =  sprintf('%d.png', h);
    fullFileName = fullfile(SubFolderNAME, baseFileName);
    saveas(gcf, fullFileName);
end;

graphsloaded= true;
end

