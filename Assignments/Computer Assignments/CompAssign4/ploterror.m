function [P]=ploterror(u0)

[UE,UE2,t,t2]=exact(u0);


E=euler(@(u)u*(1-u^2),0,5,u0,50);
E2=euler(@(u)u*(1-u^2),0,5,u0,25);

[LER,GER] = err(E,t,0.1);
[LER2,GER2] = err(E2,t2,0.2);

figure(1)
xlabel('t'), ylabel('Error');
plot(t,GER,t,LER);
title('Local and Global Error h=0.1');
legend('Global error','Local error');

figure(2);
xlabel('t'), ylabel('Error');
plot(t2,GER2,t2,LER2);
legend('Global error','Local error');
title('Local and Global Error h=0.2')




end