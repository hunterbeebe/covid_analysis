%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: RK4.m
%
% Description: A function which utilizes the Fourth-Order Runge-Kutta
% Algorithm to solve the inputted differential equation, hardcoded for this
% specific problem
%   Inputs: The differential equation being solved, the starting and ending
%   time value, and the initial conditions
%   Outputs: An array of time values, and a txn matrix of the solution for
%   each time step, with n having the same dimension as the inputted y0.
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [t, y] = RK4(f, tspan, y0)
% RK4 Numerically solves the differential equation using the 
%   fourth-order Runge-Kutta algorithm
% Inputs:
%   f: function handle of f(t, y)
%   tspan: the time period for simulation (should be a 1x2 array 
%       contain start time and end time)
%   y0: the initial conditions for the differential equation
% Outputs:
%   t: corresponding time sequence as a T x 1 vector
%   y: the solution of the differential equation as a T x n matrix, 
%       where T is the number of time steps and n is the dimension of y

h = 0.1; %Given step size
tsize = tspan(1):h:tspan(2); %Find each possible t value

t = zeros(1,length(tsize)); %Create the t value array
y = zeros(3,length(y0)); %Create the y value array

y(1,:) = y0; %Define initial conditions
t(1) = tspan(1); 


nSteps = length(tsize) - 1; %Find the number of steps
i = 0; %Counting variable

tk = tspan(1); %Initial t value plugged in
yk = y0; %Initial y values plugged in

while i < nSteps %While within the total number of steps
    k1 = h*f(tk,yk); %Find the Runge-Kutta values
    k2 = h*f(tk + .5*h, yk + .5*h*k1);
    k3 = h*f(tk + .5*h, yk + .5*h*k2);
    k4 = h*f(tk + h, yk + h*k3);
    tk = tk + h; %Find the new tk
    yk = yk + (k1 + 2*k2 + 2*k3 + k4)/6; %Find the new yk
    t(i + 2) = tk; %Store the new values
    y(i + 2,:) = yk;
    i = i + 1; %Increment the count
end 
end 



