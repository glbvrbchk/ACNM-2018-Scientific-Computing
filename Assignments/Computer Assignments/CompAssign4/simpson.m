function [S] = simpson(f, a, b, n)
h=(b-a)/n;
for i=1:n
    s1(i)=f(a+(i-1/2)*h);
end
for i=1:n-1
    s2(i)=f(a+i*h);
end
S=(h/6) * (f(a) + f(b) + 4 * sum(s1) + 2 * sum(s2));
end
