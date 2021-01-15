%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: project_505384217_p2.m
%
% Description: A main script which loads the provided initial conditions,
% uses the solveSpatialSIR.m function to solve the differential equation in
% the dynamicsSIR.m function, and uses the plotTimeSeries.m function and
% animate.m function to visualize the results.
%   Inputs: The values of alpha, beta, and gamma, along with the initial
%   conditions and the time to end at.
%   Outputs: The solution to the differential equation in dynamicsSIR.m and
%   three plots of the infected, susceptible, and recovered over time at
%   certain spots in the simulation, along with an animation of the illness
%   spreading over time.
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all

alpha = 0.1; %Defining the given parameters
beta = 0.05;
gamma = 0.1;
tFinal = 60;

load initialValues.mat; %Loading the initial conditions

tic

[t_rk, x_rk] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, ...
    gamma, @RK4); %Solving the diff eqs with the RK4

rkRuntime = toc; %Saving the time taken for the RK4
fprintf('RK4 Runtime: %fs\n', rkRuntime);
tic

[t_ode, x_ode] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, ...
    gamma, @ode45); %Solving the diff eqs with the ode45

odeRuntime = toc; %Saving the time taken for the ode45
fprintf('ode45 Runtime: %fs\n', odeRuntime);

figure(1)
plotTimeSeries(t_rk, x_rk, 1, 1); %Plotting susceptible, infected, ...
%at (1,1)

figure(2)
plotTimeSeries(t_rk, x_rk, 5, 18); %Plotting at (5,18)

figure(3)
plotTimeSeries(t_rk, x_rk, 30, 70); %Plotting at (30,70)

figure(4)
animate(x_rk); %Using the animate function to animate the entire spread




