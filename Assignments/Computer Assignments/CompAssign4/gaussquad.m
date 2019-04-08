function [G] = gaussquad(f, a, b, k)
for i=1:k
    if k==1
        x(1)=0;
        A(1)=2;
    elseif k==2
        x(1)=-sqrt(1/3);
        x(2)=sqrt(1/3);
        A(i)=k-1;
    elseif k==3
        x(1)=-sqrt(3/5);
        x(2)=0;
        x(3)=sqrt(3/5);
        A(1)=5/9;
        A(2)=8/9;
        A(3)=5/9;
    end
end
G=sum(A.*((b-a)/2) .* f(((b-a).*x+(b+a))/2));
end