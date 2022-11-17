%preset
%warning off
clc
clear 
close all

set(0,'DefaultTextFontName','Times',...
'DefaultTextFontSize',18,...
'DefaultAxesFontName','Times',...
'DefaultAxesFontSize',18,...
'DefaultLineLineWidth',2,...
'DefaultLineMarkerSize',7.75)

% Define the number of variales and model parameters
Nx = 2; %%  Ca, Cb          %--CHANGE HERE-- number of states--NUMBER OF DIFFERENTIAL EQUATIONS
Nu = 1; %%  q              %--CHANGE HERE-- number of inputs--NUMBER OF MVS
Nd = 3; %%  Caf, k1, k2     %--CHANGE HERE-- number of disturbances--NUMBER OF DVS
Np = 2; %%  V, k3           %--CHANGE HERE-- number of model parameters--CONSTANT VALUES
Ny = Nx;% Do not change--number of outputs---equal to number of states


%% INITIALIZING
%Model parameters
% Volume, k3
V = 10000;    %Volume
k3 = 1 / 6;   %k3

p = [V; k3];  %Parameters

% Nominal values
q_nom = 5000;
%   u = [q_nom];

%Disturbances
Caf= 10;
k1 = 25/6;
k2 = 5/3;

d = [Caf; k1; k2];


%initializing states
Ca0 = 1.0332964;
Cb0 = k1*V*Ca0/(q_nom+k2*V);
Cc0=k2*V*Cb0/q_nom;
Cd0=k3*V*Ca0^2/q_nom/2;

x0 = [Ca0; Cb0]; % Initial states

%% Simulate a step increase on input (q)
q_step = 1.1;
Caf_step = 0;
k1_step = 0;
k2_step = 0;

% Set the time for giving the step on q
q_t_step = 1; 
Caf_t_step = 1;
k1_t_step = 1;
k2_t_step = 1;

%Defining setpoint value
Cb_set = 1.1*Cb0
%% Running Simulink!!
tsim = 10;
sim('projectSimulinkpart3') 


%% PLOT
%We are using subplots to plot the result.  
% We want 6 plots (3 columns and 3 rows)

figure(1)
subplot(221)
plot(ans.time,ans.x(:,1),'red')   
title('CA');
ylabel('CA [mol/L]');
xlabel('Time [min]');
%ylim([0.9 1.15]);
%xlim([0 6]);

subplot(222)
plot(ans.time,ans.x(:,2),'green')  
title('CB');
ylabel('CB [mol/L]');
xlabel('Time [min]');
%ylim([1.8 2.2]);
%xlim([0 6]);

subplot(223)
plot(ans.time,ans.u)
title('Step on q');
ylabel('q [L/min]');
xlabel('Time [min]');
%xlim([0 6]);

subplot(224)
plot(ans.time,ans.IAE(:,1))
title("IAE")
ylabel("IAE")
xlabel("Time")

%% Simulate a step increase on feed concentration (Caf)
q_step = 0;
Caf_step = 1.1;
k1_step = 0;
k2_step = 0;

% Set the time for giving the step on q
q_t_step = 1; 
Caf_t_step = 1;
k1_t_step = 1;
k2_t_step = 1;

%% Running Simulink!!
tsim = 10;
sim('projectSimulinkpart3') 


%% PLOT
figure(2)
subplot(221)
plot(ans.time,ans.x(:,1),'red')   
title('CA');
ylabel('CA [mol/L]');
xlabel('Time [min]');
%ylim([0.9 1.15]);
%xlim([0 6]);

subplot(222)
plot(ans.time,ans.x(:,2),'green')  
title('CB');
ylabel('CB [mol/L]');
xlabel('Time [min]');
%ylim([1.8 2.2]);
%xlim([0 6]);

subplot(223)
plot(ans.time,ans.d(:,1))
title('Step on Caf');
ylabel('Caf [mol/L]');
xlabel('Time [min]');
%xlim([0 6]);

subplot(224)
plot(ans.time,ans.IAE(:,1))
title("IAE")
ylabel("IAE")
xlabel("Time")


%% Simulate a step increase on k1
q_step = 0;
Caf_step = 0;
k1_step = 1.1;
k2_step = 0;

% Set the time for giving the step on q
q_t_step = 1; 
Caf_t_step = 1;
k1_t_step = 1;
k2_t_step = 1;

%% Running Simulink!!
tsim = 10;
sim('projectSimulinkpart3') 


%% PLOT
figure(3)
subplot(221)
plot(ans.time,ans.x(:,1),'red')   
title('CA');
ylabel('CA [mol/L]');
xlabel('Time [min]');
%ylim([0.9 1.15]);
%xlim([0 6]);

subplot(222)
plot(ans.time,ans.x(:,2),'green')  
title('CB');
ylabel('CB [mol/L]');
xlabel('Time [min]');
%ylim([1.8 2.2]);
%xlim([0 6]);

subplot(223)
plot(ans.time,ans.d(:,2))
title('Step on k1');
ylabel('k1 [1/min]');
xlabel('Time [min]');
%xlim([0 6]);

subplot(224)
plot(ans.time,ans.IAE(:,1))
title("IAE")
ylabel("IAE")
xlabel("Time")


%% Simulate a step increase on k2
q_step = 0;
Caf_step = 0;
k1_step = 0; 
k2_step = 1.1;

% Set the time for giving the step on q
q_t_step = 1; 
Caf_t_step = 1;
k1_t_step = 1;
k2_t_step = 1;

%% Running Simulink!!
tsim = 10;
sim('projectSimulinkpart3') 


%% PLOT
figure(4)
subplot(221)
plot(ans.time,ans.x(:,1),'red')   
title('CA');
ylabel('CA [mol/L]');
xlabel('Time [min]');
%ylim([0.9 1.15]);
%xlim([0 6]);

subplot(222)
plot(ans.time,ans.x(:,2),'green')  
title('CB');
ylabel('CB [mol/L]');
xlabel('Time [min]');
%ylim([1.8 2.2]);
%xlim([0 6]);

subplot(223)
plot(ans.time,ans.d(:,3))
title('Step on k2');
ylabel('k2 [1/min]');
xlabel('Time [min]');
%xlim([0 6]);

subplot(224)
plot(ans.time,ans.IAE(:,1))
title("IAE")
ylabel("IAE")
xlabel("Time")




