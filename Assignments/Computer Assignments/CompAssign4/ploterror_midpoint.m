function [P]=ploterror_midpoint(u0)

[UE,UE2,t,t2]=exact(u0);


E=midpoint(@(u)u*(1-u^2),0,5,u0,50);
E2=midpoint(@(u)u*(1-u^2),0,5,u0,25);

[LER,GER] = err(E,UE,t);
[LER2,GER2] = err(E2,UE2,t2);

figure(1)
xlabel('t'), ylabel('Error');
plot(t,LER,t,GER);
title('Local and Global Error h=0.1');
legend('local error','global error');

figure(2);
xlabel('t'), ylabel('Error');
plot(t2,LER2,t2,GER2);
legend('local error','global error');
title('Local and Global Error h=0.2')




end