function [P]=plotgausserror()
f=@(x)1./(1-sin(x));
a=0; b=pi/3;
m=(2:10);
k=(1:3);
EXV=1+sqrt(3);
for i=1:length(m)
    n(i)=2^m(i);
    h(i)=(b-a)/n(i);
end
for i=1:length(k)
    for j=1:length(n)
        CP(j,i) = copmgaussquad(f,a,b,k(i),n(j));
        SP(j) = simpson(f, a, b, n(j));
        ERR1(i,j)=abs(EXV-CP(j,i));
        ERR2(j)=abs(EXV-SP(j));
        
    end
end
for i=1:length(k)
    for j=1:length(n)-1
        p1(i,j)=(log(ERR1(i,j))-log(ERR1(i,j+1)))/(log((b-a)/n(j))-log((b-a)/n(j+1)));
        p2(j)=(log(ERR2(j))-log(ERR2(j+1)))/(log((b-a)/n(j))-log((b-a)/n(j+1)));
    end
end
p1%compgaussquad k=1
p2%simpson
P1=min(p1)
P2=min(p2)
loglog(h,ERR1(1,:),h,ERR1(2,:),h,ERR1(3,:),h,ERR2);
xlabel('h');ylabel('Error')
legend('compgaussquad k=1','compgaussquad k=2','compgaussquad k=3','simpsons')
end
