function p = eval_newton(x,X,ck)
n = length(X(:,1))
for k = 2:n                           
      ck(k) = (ck(k) - ck(k-1))./(X(k)- X(k-1));
end
    p = ck(n);               
    for k = n:-1:1
        k
        p = ck(n+1-k) + (x(k) - X(n+1-k))*p;
    end
    % Display the results:
    disp(['Values of p:                               ' num2str(p)]);