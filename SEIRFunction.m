function [S,E,I,R] = SEIRFunction(beta,gamma,delta,I0,T,f,R0,S0,dt)
   
    S = zeros(1,T/dt); %Create array of zeros
    S(1) = S0; %Initial number of Susceptible as of 1/1/2021
    E =zeros(1,T/dt);
    I = zeros(1,T/dt);
    I(1) = I0; %Initial number of Infected as of 1/1/2021
    R = zeros(1,T/dt);
    R(1) = R0; %Initial number of Recovered as of 1/1/2021
    for tt = 1:(T/dt)-1 
        % Equations of the model
        
        dS = (-beta*I(tt)*S(tt) + delta*R(tt)) * dt;
        dE = (beta*I(tt)*S(tt)-f*E(tt))*dt; 
        dI = (f*E(tt) - gamma*I(tt)) * dt;
        dR = (gamma*I(tt) - delta*R(tt)) * dt;
        
        S(tt+1) = S(tt) + dS;
        E(tt+1) = E(tt) + dE;
        I(tt+1) = I(tt) + dI;
        R(tt+1) = R(tt) + dR;
    end
end

