function UM=midpoint(f,a,b,u0,N)
h=(b-a)/N;
UM=zeros(1,N);
UM(1)=u0;
for j=1:N
    UU(j)=UM(j)+h/2*f(UM(j))
    UM(j+1)=UM(j)+h*f(UU(j))
end
end