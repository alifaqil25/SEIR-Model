%% SEIR MODEL 
%Prediction model for covid19 spreading pattern as of 11 January 2020
%S = Susceptible, E = Exposed , I = Infected, R = Removed

%%
clear all;
%% Model parameters (Updated to 1 Jan 2020)
beta0 = 8.333*10^-9; % Effective transmission Rate
incub_per = 5.2; %Average days to exposed person become infectious
recov_per = 10;
f0 = 1/incub_per; %Infection Rate
gamma = 1/recov_per; % rate of recovery
delta = 1/60; % rate of immunity loss
T = 365; % period of 365 days
dt = 1/4; % time interval of 6 hours (1/4 of a day)
N = 32.7*10^6;
tt = 0:dt:T-dt; %Setting range and sampling rate
% Total population N = S+E+I+R 
%Data updated to 2020 from Department of Statistic Malaysia
%% Initial Value
%%Data sources are from Department of Statistic Malaysia updated to 1/1/2021
I0 = 23433; %Number of infected person in 1/1/2021
R0 = 91645;  %Number of recovered+death person in 1/1/2021
S0 = N - I0 - R0;

%% Spreading Pattern of Factor Density of Population
fig=1;
%% Low Density Population
% Theoretically, low population density will conduct to low contact rate
% (no change in constant value )
beta = beta0; %Assume beta does not change
f=f0;
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt); %Call function
R_0 =N*beta/(dt); %Reproductivity number as of 1 Jan 2021
TITLE = 'Spreading Pattern with low population density';
n=1;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)
%% High Population Density
%Theoretically, higher population density will conduct to higher contact rate
%Assume contact rate increase by 2
beta = beta0 * 2;
R_0 =N*beta/(dt);
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt);
TITLE = 'Spreading Pattern with high population density';
n=2;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)

%% Spreading Pattern on Factor of Social Distancing
fig = 2;

%% With Social Distancing (Assume beta multiply by factor 1.1)
beta = beta0 * 1.1;
f = f0;
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt); %Call function
R_0 =N*beta/(dt); %Reproductivity number as of 1 Jan 2021
TITLE = 'Spreading Pattern With Social Distancing';
n=1;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)
%% Without Social Distancing (Assume beta multiply by factor 3.21)
beta = beta0 * 3.21; 
f = f0;
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt); %Call function
R_0 =N*beta/(dt); %Reproductivity number as of 1 Jan 2021
TITLE = 'Spreading Pattern With No Social Distancing';
n=2;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)

%% Spreading Pattern on Factor Environment
fig =3;beta = beta0;R_0 =N*beta/(dt); %Assume beta and reproductivity number does not change

%% Cold Climate Countries (switzerland)
%Assume infection rate is increased by 26.32 from normal infection rate
f = f0*26.32; %Infection rate of 5.5 (switzerland)
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt); %Call function
TITLE = 'Spreading Pattern in Switzerland';
n=1;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)
%% Hot Climate Countries (malaysia)
f = f0;   %normal infection rate of 0.19
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt); %Call function
TITLE = 'Spreading Pattern in Malaysia';
n=2;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)

%% Spreading Pattern on Age Factor
fig =4;
%% Young Adults
%Assume infection fatality rate increase progressively with age
%younger people have less infection fatality rate
beta = beta0; %Assume beta does not change
f = f0;
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt); %Call function
R_0 =N*beta/(dt); %Reproductivity number from 1 Jan 2021
TITLE = 'Spreading Pattern among Younger Age';
n=1;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)
%% Older Adults
%older people have higher infection fatality rate
beta = beta0;
f = f0;
gamma = gamma * 0.25;  %assume older people have low immunity
[S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt); %Call function
R_0 =N*beta/(dt); %Reproductivity number from 1 Jan 2021
TITLE = 'Spreading Pattern among Older Age';
n=2;
Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)