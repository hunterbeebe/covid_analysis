%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: solveSpatialSIR.m
%
% Description: Function which takes in a final time value, initial
% conditions, model parameters, and a chosen method to solve a differential
% equation. This is all then used to solve the dynamicsSIR.m function.
%   Inputs: The final time value to generate the solution until, the
%   initial conditions of infected, susceptible, and recovered, the model
%   parameters, and the function handle to solve the ODE with.
%   Outputs: The time steps of the solution, and a four dimensional matrix
%   with the solution at each point on the plane for all three variables
%   for each time step.
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [t, x] = solveSpatialSIR(tFinal, initialConditions, alpha, ...
    beta, gamma, odeSolver)
%solveSpatialSIR Solves the spatial SIR model
%   Inputs:
%       tFinal: end time for the simulation (assuming start is t=0) 
%       initialCondition: a MxNx3 matrix that sums to 1 in third dimension
%       alpha, beta, gamma: model parameters
%       odeSolver: a function handle for an ode45-compatible solver
%   Outputs:
%       t: a vector of the time-steps
%       x: MxNx3xlength(t) matrix representing the state vs. time

[M,N,~] = size(initialConditions); %Find the rows and columns
tspan = [0 tFinal]; %Define the tspan
initialC = initialConditions(:); %Turn the initialconditions into a column

%Turn dynamicsSIR into a function handle
dSIRdt = @(t,x) dynamicsSIR(x, M, N, alpha, beta, gamma); 

%Use the inputted solver to solve dynamicsSIR
[t,sol] = odeSolver(dSIRdt, tspan, initialC);

%Reshape from 2D to 4D
solInt = reshape(sol, [length(t), M, N, 3]);

%Reorder
x = permute(solInt, [2, 3, 4, 1]);
end 