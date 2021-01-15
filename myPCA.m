%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: myPCA.m
%
% Description: Generates the PCA projection of data that is inputted into
% the function, along with returning the eigenvectors.
%   Inputs: Raw data, with this being specifically tailored to intake the
%   country covid data.
%   Outputs: A matrix of the data projected onto principal components, and
%   the sorted eigenvectors
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [coeff0rth, pcaData] = myPCA(data)
% myPCA analyzes the principal components of given COVID-19 statistical ...
% data from multiple countries - covid_countries.csv
%   Inputs:
% data: A nxp matrix representing only the numerical parts of the dataset
%   Outputs:
% coeff0rth: a pxp matrix whose columns are the eigenvectors ...
%   corresponding to the sorted eigenvalues
% pcaData: a nxp matrix representing the data projected onto ...
%   the principal components

normalized = zeros(27,6); %Create normalized array
for i = 1:6
    avg = mean(data(:,i)); %Find average
    stdev = std(data(:,i)); %Find standard deviation
    normalized(:,i) = (data(:,i) - avg)/stdev; %Center the data    
end

c = cov(normalized); %Generate the covariance matrix
[vectors,values] = eig(c, 'vector'); %Find the eigenvalues/vectors of c
[~, index] = sortrows(values, 'descend'); %Sort the eigenvalues
coeff0rth = vectors(:, index); %Sort the vectors in the same way

pcaData = normalized * coeff0rth; %Create the pcaData
end 