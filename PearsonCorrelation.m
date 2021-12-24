S%% Clear Memory
clear;
clc;

%% Read and store the file
% All the data was found on the "www.statista.com"
% The data of population of density is updated as 0f last quarter of 2020
% The total covid-19 cases is updated as of 8 January 2021

file = load('PopulationDensity.mat'); %Read the file
file.Properties.VariableNames = {'DensityPopulation', 'Cases'};
A = file.unnamed(:,1); % Store column 1 in A
B= file.unnamed(:,2); % Store column 2 in B

%% Plot the graph population density vs number of cases
figure(1)
s= scatter(A,B,'+'); %plot graph type scatter
s.LineWidth = 2; %the width of the line
s.MarkerEdgeColor = 'red';  % Set the color of the marker        
title('Correlation Coefficient of Density of Population and Number of Cases') % Set graph title
xlabel('Density of Population') % Set axis-x label
ylabel('Number of Cases') % Set axis-x labe
box 'on' %display axes outline
axis square; % set axis style
%ticks off
set(gca,'Ticklength',[0 0]) 

%% Determine Coefficient Correlation
R1 = corrcoef(A,B); %Built in function for correlation coefficient
disp(R1(1,2)); %Display Correlation Coefficient berween A and B

%% Printing Coefficient Correlation in the graph

str=sprintf('  R= %1.2f',R1(1,2)); % set string R
T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str); %Set text
set(T, 'fontsize', 14, 'verticalalignment', 'top', 'horizontalalignment', 'left'); %Set the position of printing R

%% Coefficient Correlation Between Median Age and Total Cases

%% Load File
file = load('agemed.mat'); %read file
file.Properties.VariableNames = {'Median Age', 'Cases'};
C = file.unnamed(:,1); %store column 1 in C
D= file.unnamed(:,2); %store column 2 in D

%% Plotting
figure(2)
a= scatter(C,D,'+'); %plot graph type scatter
a.LineWidth = 2; %the width of the line
a.MarkerEdgeColor = 'red';  % Set the color of the marker        
title('Correlation Coefficient of Median Age and Number of Cases') % Set graph title
xlabel('Median Age') % Set axis-x label
ylabel('Number of Cases') % Set axis-x labe
box 'on' %display axes outline
axis square; % set axis style
%ticks off
set(gca,'Ticklength',[0 0]) 

%% Determine Coefficient Correlation
R2 = corrcoef(C,D); %Built in function for correlation coefficient
disp(R2(1,2)); %Display Correlation Coefficient berween A and B

%% Printing Coefficient Correlation in the graph

str=sprintf('  R= %1.2f',R2(1,2)); % set string R
T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str); %Set text
set(T, 'fontsize', 14, 'verticalalignment', 'top', 'horizontalalignment', 'left'); %Set the position of printing R