clc;
close all; 
dx= 0.01e-4;    %% ?x=0.01microns. 
dt=0.0001;      %% Time interval
C=zeros(1,10);
C(1:2)=1e20;
iterations=1000;    %%Diffusion for 2.46 hours = 8856 seconds 
 
tic
for runs= 1:iterations
    for i=1:1:9
        if i==1
            D=1.66e-10;
            C(i)=C(i)+(((D*dt)/(dx^2))*(C(i)+C(i+1)-(2*C(i))));
        elseif i==2
            D=1.66e-10;
            C(i)=C(i)+(((D*dt)/(dx^2))*(C(i-1)+C(i+1)-(2*C(i))));
        else
            D=1.45e-11;
            C(i)=C(i)+(((D*dt)/(dx^2))*(C(i-1)+C(i+1)-(2*C(i))));
        end
        
    end
    if mod(runs,500)==1
   plot(C)
   hold on
    end
    title('Constant source Diffusion');
    xlabel('Depth(cm)');
    ylabel('Concentration (cm^-3)');
    drawnow;
    F(runs)=getframe(gcf);
    runs;    
end
toc
