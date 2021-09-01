tic
clc;
close all;
rootoverD = 0.5e-4; %% Diffusivity
D=rootoverD*rootoverD;
dx=0.01e-4;    %% Î”x=0.01microns.
X=0:dx:1000e-6;  %% depth is given as a micron 
dt=0.00016;      %% Time interval
C=zeros(1,length(X));
C(1:2)=2e19;
variable=(D*dt)/(dx^2)
iterations=8856;    %%Diffusion for 2.46 hours = 8856 seconds 
tic
for runs=1:0.05:iterations    %%Iteration interval is increased to increase the resolution
    for i=2:1:length(X)-1
      C(1)=2e19   ; %% initial concentration 
        C(i)=C(i)+(variable*(C(i-1)+C(i+1)-(2*C(i))));
    end
    figure(1);   
        plot(X,C);       
end
toc
     title('Constant source Diffusion');
    xlabel('Depth(cm)');
    ylabel('Concentration (cm^-3)');
    drawnow;
    F(runs)=getframe(gcf);
    runs;
    toc
