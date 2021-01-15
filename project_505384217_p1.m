%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name of the script: project_505384217_p1.m
%
% Description: This script runs the myPCA.m function on the given
% covid_countries.csv and generates a biplot with the results of the
% function.
%   Inputs: The data and variable names can be changed to plot different
%   data with different labels
%   Outputs: A biplot with proper labels corresponding to each of the data
%   types
%
% Name: Hunter Beebe (hunterbeebe@g.ucla.edu)
% UID: 505384217
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all

data = csvread('covid_countries.csv', 1, 2); %Import data
[sortedvctrs, pcaData] = myPCA(data); %Run myPCA function

vbls = {'Infections', 'Deaths', 'Cures', 'Mortiality Rate', ...
    'Cure Rate', 'Infection Rate'}; %Create the data labels
biplot(sortedvctrs(:,1:2),'Scores',pcaData(:,1:2),'Varlabels',vbls);
title('myPCA of Covid Data')


