clear all;
clc;
close all;
C=zeros(1,100);
 
C(1:2)=2e19;
iterations=100;
 for runs=1:iterations
    for i=1:1:99
        if i==1
             C(i)=0.5*(C(i+1)+C(i));
        else
             C(i)=0.5*(C(i-1)+C(i+1)); 
        end
    end
    if mod(runs,10)==1
    plot(C);
    hold on;
    title('Drive in');
    xlabel('Depth(m)');
    ylabel('Concn (cm^-3)');
    drawnow;
    F(runs) = getframe(gcf);
    end
end
