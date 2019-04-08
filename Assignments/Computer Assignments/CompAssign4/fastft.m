function [y]= fastft(x)
n=length(x);
w=exp(((-2*pi)*1i)/n);
m=n/2;
y=zeros(n,1)
    if n == 1
        y(n)=x(n);
    else
        
        even=zeros(m,1);
        odd=zeros(m,1);
        
        for k =  0: (m-1) 
            even(k+1)=x(2*k+2);
            odd(k+1)=x(2*k+1);
        end
        t=fastft(even);
        q=fastft(odd);
        for k=0 : (n-1)
           l=mod(k,(n/2))+1;
           y(k+1)=q(l)+(w.^k*t(l));
        end
    end
end

    

        
            
