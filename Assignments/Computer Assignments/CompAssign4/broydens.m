%%%Evaluate the function
%%%Solve for x such that f(x)=0
 
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
 
%%%Newton's Method
     
while err(x) > 1e-10
   S = -inv(J(x))*f(x);
   x = x + S;
end
disp("----------------------------")
disp("Newtons Solution")
disp(x)
disp("Newtons Error")
disp(err(x))

disp("----------------------------")
 


%%%Broyden's method
%%%Solve for x such that f(x)=0
e=[];
B = [1 0; 0 1]; %%%Take B as identity matrix
while err(x) > 1e-100
   S = -inv(B)*f(x);
   x1 = x + S;
   y = f(x1) - f(x);
   x = x1;
   e=err(x);
   %%%Update B
   if abs(S'*S) > 1e-2
       B = B + ((y-B*S)*S')/(S'*S);
   end
end
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
 
%%%Calculate exact Jacobian
function out = J(x)
x1=x(1);
x2=x(2);
out=[1 2; 2*x1 8*x2];
end
