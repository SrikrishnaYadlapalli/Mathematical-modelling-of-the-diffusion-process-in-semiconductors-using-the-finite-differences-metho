clear all
clc
close all
C=zeros(1,100);
C(1:2)=2e19;
 
iterations=100
for runs=1:1:iterations
    
    for n=2:1:99
        C(1)=2e19;  %% C(1) is kept constant for each iteration as there is no left point to that
        C(n)=0.5*(C(n-1)+C(n+1));
    
    end
   if mod(runs,10)==1
    plot(C)
    hold on
    title('Constant source Diffusion');
    xlabel('Depth(m)');
    ylabel('Concentration (cm^-3)');
    lgd.FontSize=18;
    drawnow;
    F(runs)=getframe(gcf);
    runs
   end
end
