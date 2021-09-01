clear all
clc
close all
C=zeros(1,100);
C(1:2)=2e19;
iterations=100
for runs=1:iterations
    for i=2:99
        C(1)=2e19;  %% C(1) is kept constant for each iteration as there is no left point to that
        C(i)=0.6*(C(i-1)+C(i+1));
    end
    plt=figure(1);
    plt.Position=[0 0 1280 720];
    if mod(runs,10)==1
    plot(C);
    hold on
    title('Constant source Diffusion');
    xlabel('Depth(m)');
    ylabel('Concentration (cm^-3)');
    drawnow;
    F(runs)=getframe(gcf);
    runs
    end
end
