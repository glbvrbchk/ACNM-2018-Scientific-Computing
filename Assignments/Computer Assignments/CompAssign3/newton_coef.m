function [ck,ddiff] = newton_coef(X, Y)

    n = length(X);
    ddiff= zeros(n, n);
    ddiff(:, 1) = Y';
    for j = 2:n
        for i = 1:(n-j+1)
            ddiff(i,j) = (ddiff(i+1,j-1)-ddiff(i,j-1))/(X(i+j-1)-X(i));
        end
    end
   ck = ddiff(n,n);
   
   
for k = (n-1):-1:1
  ck = conv(ck,poly(X(k)));
  m = length(ck);
 ck(m) = ck(m) + ddiff(1,k);
end
ck = ddiff(1,:)
end