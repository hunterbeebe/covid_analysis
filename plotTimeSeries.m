%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: plotTimeSeries.m
%
% Description: Function which plots the susceptible, infected, and ...
% recovered in a given cell of an array, with the data being normalized.
% Dependent upon the amount of steps taken.
%   Inputs: The time steps of the solution, the solution itself, and the
%   coordinates of the point to look at for the statistics
%   Outputs: A graph with 3 subplots that shows the susceptible, infected,
%   and recovered at the chosen point
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plotTimeSeries (t, X, x, y)
% plotTimeSeries: a function that plots and saves the local S.I.R ...
% distribution at spatial coordinates (x,y).
%   Inputs: 
%       t: a vector of time steps
%       X: an M*N*3*length(t) matrix, where each point in the M*N space
%          corresponds to a local S.I.R. model with states whose values 
%          are between 0 and 1. This 3D matrix is repeated for each time
%          step, making it a 4D matrix.
%       x: the spatial x-coordinate on the grid
%       y: the spatial y-coordinate on the grid
%   Outputs:
%       This function has no outputs

%x is the M, y is the N
%t is the 4th dimension

subplot(3,1,1) %Generate a subplot
hold on %Turn hold on to get each point
for k = 1:length(t) %For each value of S
    S = X(x,y,1,k); %Find S at the point for the time value
    scatter(k/10, S, 'b', '.'); %Scatter each point, k scaled for accuracy
end 
xlabel('Time') %Label it all properly
ylabel('Susceptible Ratio')
title(sprintf('Susceptible Individuals at (%d,%d) - Normalized', x, y));
hold off

subplot(3,1,2) %Repeat the process
hold on
for k = 1:length(t)   
    I = X(x,y,2,k);
    scatter(k/10, I, 'r', '.');
end
xlabel('Time')
ylabel('Infected Ratio')
title(sprintf('Infected Individuals at (%d,%d) - Normalized', x, y));
hold off

subplot(3,1,3) %Repeat the process
hold on
for k = 1:length(t)
   R = X(x,y,3,k);
   scatter(k/10, R, 'g', '.');
end
xlabel('Time')
ylabel('Recovered Ratio')
title(sprintf('Recovered Individuals at (%d,%d) - Normalized', x, y));
hold off

%Save the image
imagefile = sprintf('time_series_%d_%d.png', x, y);
saveas(gcf, imagefile, 'png')
end 