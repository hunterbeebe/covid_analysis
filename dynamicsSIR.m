%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: dynamicsSIR.m
%
% Description: Takes in the vectorized data, grid size, and parameters to
% represent the S.I.R. model with the given differential equations, using
% an algorithm to find the weight values of gridpoints which are
% incorporated into the equations
%   Inputs: The vectorized state of the data, the grid size, and the
%   designated parameters
%   Outputs: The derivative of each variable passed in, formed as a column
%   vector
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dxdt = dynamicsSIR(x, M, N, alpha, beta, gamma)
%dynamicsSIR Computes the rate of change of the model
%   Inputs:
%       x: vectorized state
%       M, N: size of the grid
%       alpha, beta, gamma: model parameters
%   Output:
%       dxdt: vectorized time derivative of state

newX = reshape(x, [M, N, 3]); %Reshape the vectorized data to work with
finalresults = zeros(M,N,3); %Create a results array

%newX(i,j,1) = S
%newX(i,j,2) = I
%newX(i,j,3) = R

weighteasy = zeros(M+2,N+2); %Create an array large enough to ...                             %completely surround the data with zeros
for i = 1:M
    for j = 1:N
        weighteasy(i+1,j+1) = 1; %Fill the location of where the data ...
                                 %would be with 1's
    end 
end 


for i = 1:M %Initialize the loop to find the sum of W
    for j = 1:N
 
        W = 0; %Start the summation with a value of zero
 
 if weighteasy(i,j) ~= 0 %Check the square up and to the left
     W = W + newX(i-1,j-1,2)/sqrt(2); %If it's not zero, use the ...
%appropriate weighting value multiplied by the infected in that square
 end 
 if weighteasy(i+1,j) ~= 0 %Continue the same process, moving ...
 %counterclockwise around the data checking each boundary square
     W = W + newX(i,j-1,2);
 end 
 if weighteasy(i+2,j) ~= 0
     W = W + newX(i+1,j-1,2)/sqrt(2);
 end 
 if weighteasy(i+2,j+1) ~= 0
     W = W + newX(i+1,j,2);
 end 
 if weighteasy(i+2,j+2) ~= 0 
     W = W + newX(i+1,j+1,2)/sqrt(2);
 end 
 if weighteasy(i+1,j+2) ~= 0 
     W = W + newX(i,j+1,2);
 end 
 if weighteasy(i,j+2) ~= 0 
     W = W + newX(i-1,j+1,2)/sqrt(2);
 end 
 if weighteasy(i,j+1) ~= 0 %This is the last square needed to be checked.
     W = W + newX(i-1,j,2); 
 end 
 
 %Use the given differential equations to find the S,I, and R values in
 %that order, with them each being their own dimension
 finalresults(i,j,1) = -(beta*newX(i,j,2) + alpha*W)*newX(i,j,1);
 finalresults(i,j,2) = (beta*newX(i,j,2) + alpha*W)*newX(i,j,1) ...
     - gamma*newX(i,j,2); 
 finalresults(i,j,3) = gamma*newX(i,j,2);
        
    end 
end

dxdt = finalresults(:); %Output the results as a column vector
end 



 
