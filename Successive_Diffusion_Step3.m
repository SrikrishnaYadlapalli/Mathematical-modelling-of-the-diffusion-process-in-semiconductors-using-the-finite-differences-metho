clc;
close all;
rootoverD = 0.8282e-4; %% Diffusivityw
D=rootoverD*rootoverD
dx= 0.01e-4;    %% Î”x=0.01microns.
X=0:dx:1000e-6;  %% depth is given as a micron 
dt=0.00016;      %% Time interval
C=zeros(1,length(X));
C(1:2)=2e19;
variable=(D*dt)/(dx^2)
iterations=14400;     
for runs=1:iterations
    for i=1:1:length(X)-1
        if i==1
          C(i)=C(i)+(variable*(C(i)+C(i+1)-(2*C(i))));   
        else
           C(i)=C(i)+(variable*(C(i-1)+C(i+1)-(2*C(i))));    
        end
    end
     
    figure(1);   
     
        plot(X,C);
end
title('Drive in');
    xlabel('Depth(cm)');
    ylabel('Concentration (cm^-3)');
