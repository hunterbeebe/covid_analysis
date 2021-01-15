%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: animate.m
%
% Description: A function which creates an animation of the normalized
% amount of susceptible, infected, and recovered people across the entire
% defined plane.
%   Inputs: The four dimensionaldata from the solution of the ...
%           differential equation
%   Outputs: An animation showing the proportion of susceptible, infected,
%   and recovered people in each square of the graph, with the color
%   representing each state (blue = susceptible, red = infected, green =
%   recovered)
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function animate(X)
% animate: a function that shows the change in the ratio of susceptible,
% infected, and recovered individuals in the grid as an image.
%   Inputs:
%       X: an M*N*3*length(t) matrix, where each point in the M*N space
%          corresponds to a single grid with 3 numbers between 0 and 1
%          showing the SIR result. This 3D matrix is repeated for each
%          time step making it a 4D matrix.
%
%   Output: This function has no outputs.

S = size(X); %Variable to find rows and columns
M = S(1); %Rows
N = S(2); %Columns

for t= 1:10:size(X,4) %Take steps by 10 to the end time
    color = zeros(M, N, 3); %Create a colors array

    St = (X(:,:,1,t)); %Find Susceptible at that point
    It = (X(:,:,2,t)); %Find Infected at that point
    Rt = (X(:,:,3,t)); %Find recovered at that point
    
    color(:,:,3) = St; %Define St as blue
    color(:,:,1) = It; %Define It as red
    color(:,:,2) = Rt; %Define Rt as green
    
    image(color); %Display the image of the color 
    pause(0.1);
end 