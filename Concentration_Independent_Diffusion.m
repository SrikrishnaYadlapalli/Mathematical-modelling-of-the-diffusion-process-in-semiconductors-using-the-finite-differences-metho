clear all;
clc;
close all;
C=zeros(1,50); 
C(1:2)=1e20;
iterations=1000;
 for runs=1:iterations
    for i=1:1:49
        if i==1
             C(i)=0.5*(C(i+1)+C(i));
        else
             C(i)=0.5*(C(i-1)+C(i+1)); 
        end
    end
    if mod(runs,100)==1
    plot(C);
    hold on;
    title('Drive in');
    xlabel('Depth(m)');
    ylabel('Concn (cm^-3)');
    drawnow;
    F(runs) = getframe(gcf);
    end
end
