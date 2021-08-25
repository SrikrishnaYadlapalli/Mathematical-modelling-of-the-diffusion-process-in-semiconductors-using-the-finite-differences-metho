clear all
clc
close all
C=zeros(1,100);
C_ERFC=zeros(1,100);
C(1:2)=2e19;
iterations=100
for runs=1:iterations
    for i=2:1:99
        C(1)=2e19;  %% C(1) is kept constant for each iteration as there is no left point to that
        C(i)=0.5*(C(i-1)+C(i+1));
        Calc=(i)/(2*sqrt((iterations)));
        C_ERFC(i)=(2.25e19)*(erfc(Calc));
    end
    plt=figure(1);
    plt.Position=[0 0 1280 720];
    plot(C);
    hold on
    plot(C_ERFC)
    hold off
    title('Constant source Diffusion');
    xlabel('Depth(m)');
    ylabel('Concentration (cm^-3)');
    lgd=legend({'Diffusion','ERFC'},'Position',[0.69 0.7 0.2 0.2]);
    lgd.FontSize=18;
    drawnow;
    F(runs)=getframe(gcf);
    runs
end
