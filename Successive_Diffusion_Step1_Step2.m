clc;
close all;
rootoverD = 0.5e-4; %% Diffusivityw
rootoverD2=0.65-4;
D=rootoverD*rootoverD
D2=rootoverD2*rootoverD2
dx= 0.01e-4;    %% Î”x=0.01microns.
X=0:dx:1000e-6;  %% depth is given as a micron 
dt=0.00016;      %% Time interval
C=zeros(1,length(X));
C(1:2)=2e19;
variable=(D*dt)/(dx^2)
variable2=(D2*dt)/(dx^2)
iterations=8856;     
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

D=C;
Iterations2=10800;     
for runs=1:iterations2
    for i=1:1:length(X)-1
        if i==1
          D(i)=D(i)+(variable2*(D(i)+D(i+1)-(2*D(i))));   
        else
           D(i)=D(i)+(variable2*(D(i-1)+D(i+1)-(2*D(i))));    
        end
    end
    figure(2);   
        plot(X,D);
end
title('Drive in');
    xlabel('Depth(cm)');
    ylabel('Concentration (cm^-3)');
