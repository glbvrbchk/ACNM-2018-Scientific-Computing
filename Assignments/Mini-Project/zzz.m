%%%Evaluate the function
%%%Solve for x such that f(x)=0
 
x1=-2:0.1:2;
x2=x1;
[fx2,fx1]= meshgrid(x2,x1);
zz_1=0*fx2;
zz_2=0*fx2;
 
for i_dx = 1:length(x1)
    for j_dx = 1:length(x2)
        xij=[x1(i_dx);x2(j_dx)];
        out = f(xij);
        zz_1(i_dx,j_dx)= out(1);
        zz_2(i_dx,j_dx)=out(2);
    end
end
figure()
mesh(fx1,fx2,zz_1)
hold on 
surf(fx1,fx2,zz_2)
x =[1 2]' %initial guess
 
%%%Newton's Method
e_k=[];
while err(x) > 1e-10
   S = -inv(J(x))*f(x);
   x = x + S;
   e_k=[e_k,err(x)];
end
disp("----------------------------")
disp("Newtons Solution")
disp(x)
disp("Newtons Error")
disp(err(x))
disp("----------------------------")
figure()
loglog(e_k(1:end-1),e_k(2:end),'o-'); 
xlabel('log |e_k|'); ylabel('log |e_{k+1}|'); 
title("Newtons.")
%%%Broyden's method
%%%Solve for x such that f(x)=0
x =[1 2]'
e_k1=[];
B = [1 0; 0 1]; %%%Take B as identity matrix
while err(x) > 1e-10
   S = -inv(B)*f(x);
   x1 = x + S;
   y = f(x1) - f(x);
   x = x1;
   e_k1=[e_k1,err(x)];%somehow this formula is not working properly for this code.
   %%%Update B
   if abs(S'*S) > 1e-2
       B = B + ((y-B*S)*S')/(S'*S);
   end
end
disp("----------------------------")
disp("Broydens Solution")
disp(x)
disp("Broydens Error")
disp(err(x))
disp("----------------------------")
figure()
loglog(e_k1(1:end-1),e_k1(2:end),'o-'); 
xlabel('log |e_k|'); ylabel('log |e_{k+1}|'); 
title("Broydens.")
figure()
loglog(e_k(1:end),e_k1(1:length(e_k)),'o-'); 
title("Newtons/Broydens")


%%%Calculate the error
function outerr = err(x)
out =f(x); %evaluate f(x)
outerr=out(1)^2 + out(2)^2;
end
 
%%%Calculate f(x)
function out = f(x)
x1=x(1);
x2=x(2);
out =[x1+2*x2-2;x1^2+4*x2^2-4];
end
  
%%%Calculate exact Jacobian
function out = J(x)
x1=x(1);
x2=x(2);
out=[1 2; 2*x1 8*x2];
end


