function [Y] =cubic(t,y)
n=length(t)
for i=2:n-1
    a(i-1)=(t(i)-t(i-1))/6
end
for i=2:n-1
    b(i-1)=(t(i+1)-t(i-1))/3
end
for i=2:n-1
    c(i-1)=(t(i+1)-t(i))/6
end
for i=2:n-1
    d(i-1)=(y(i+1)-y(i))/(t(i+1)-t(i)) - (y(i)-y(i-1))/(t(i)-t(i-1))
    h(i-1)=t(i+1)-t(i)
end
   b 
T=zeros(n-2,n)
for i=1:n-2
    T(i,i+1)= b(i)
    T(i,i)=a(i)
    T(i,i+2)=c(i)
end
T
T(:,n)=[];
T(:,1)=[];
T
for j=1:n-2
    
end
for k=1:n-2
    
end

for i=1:n-3
    S=T(i+1,i)/T(i,i);
    V=T(i+1,:)-S*T(i,:);
    T(i+1,:)=V;
    d(i+1)=d(i+1)-S*d(i);
end
Y(n-2)=d(n-2)/T(n-2,n-2)
for i=n-3:-1:1
    Y(i)=(d(i)-T(i,i+1)*y(i+1))/T(i/i)
end
Y=[0,Y,0]
end