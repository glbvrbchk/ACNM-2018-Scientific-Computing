function U=euler(f,a,b,u0,N)
h=(b-a)/N;
U=zeros(1,N);
U(1)=u0;
for j=1:N
    U(j+1)=U(j)+h*f(U(j));
end
end