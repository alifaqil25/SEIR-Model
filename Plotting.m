function Plotting(S,E,I,R,TITLE,n,fig,tt,R_0)
% Curve
figure(fig) %Determine the figure
subplot(2,1,n); %Determin the area of the plot
plot(tt,S,'b',tt,E,'y',tt,I,'r',tt,R,'g','LineWidth',2);
grid on; %On the grid on the graph
xlabel('Days'); % Label the x-axis
ylabel('Number of individuals');% Label the y-axis
legend('Susceptible','Exposed','Infected','Removed'); %Determination for indicator
title(TITLE); % Determine the graph title

str=sprintf('  R0= %1.2f',R_0); % set string R
T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str); %Set text
set(T, 'fontsize', 14, 'verticalalignment', 'top', 'horizontalalignment', 'left'); %Set the position of printing R
end

