%%%Evaluate the function
%%%Solve for x such that f(x)=0
clear all
x1=-2:0.1:2;
x2=x1;
[xx2,xx1]= meshgrid(x2,x1);
zz1=0*xx2;
zz2=0*xx2;

for idx = 1:length(x1)
    for jdx = 1:length(x2)
        xij=[x1(idx);x2(jdx)];
        out = f(xij);
        zz1(idx,jdx)= out(1);
        zz2(idx,jdx)=out(2);
    end
end
figure()
mesh(xx1,xx2,zz1)
hold on 
surf(xx1,xx2,zz2)
x =[1 2]' %initial guess
e=[];
e_k=[];
i=1;
%%%Newton's Method     
while err(x) > 1e-16
   S = -inv(J(x))*f(x);
   x = x + S;
   e_k=[e_k,x-err(x);
   i=i+1;
end

figure()
loglog(e_k(1:end-1),e_k(2:end),'o-'); 
xlabel('log |e_k|'); ylabel('log |e_{k+1}|'); 
disp("----------------------------")
disp("Newtons Solution")
disp(x)
disp("Newtons Error")
disp(err(x))
disp("----------------------------")
%%%Broyden's method
%%%Solve for x such that f(x)=0 
e_k2=[];
B = [1 0; 0 1]; %%%Take B as identity matrix
while err(x) > 1e-16
   S = -inv(B)*f(x);
   x1 = x + S;
   y = f(x1) - f(x);
   x = x1;
   e_k2(e_k2,err(x))
   %%%Update B
   if abs(S'*S) > 1e-2
       B = B + ((y-B*S)*S')/(S'*S);
   end  
end
figure()
loglog(e_k2(1:end-1),e_k2(2:end),'o-'); 
xlabel('log |e_k|'); ylabel('log |e_{k+1}|'); 
disp("Broydens Solution")
disp(x)
disp("Broydens Error")
disp(err(x))
disp("----------------------------")

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

%%%Calculating approx Jacobian
function out = Japprox(x)
den = 1e-2;
dx1 = [den;0];
out(:,1) = (f(x+dx1)-f(x-dx1))/den;
dx2 = [0;den];
out(:,2) = (f(x+dx2)-f(x-dx2))/den;
end

%%%Calculate exact Jacobian
function out = J(x)
x1=x(1);
x2=x(2);
out=[1 2; 2*x1 8*x2];
end