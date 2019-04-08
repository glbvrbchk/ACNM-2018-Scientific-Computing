function [S] =cubic2(t,y,Y)
for i=1:length(t)-1
    interv(i,1)=t(i)
    interv(i,2)=t(i+1)
end
    
for j=1:length(t)
    for i=1:length(t)
        if interv(i,1) <=t(j) &&  t(j)<=int(i,2)
            v(j)=i
        end
    end
end

for j=1:length(t)
    h(i)=t(i+1)-t(i)
    i=v(j)8
    S(j)=y(i)+(1/h(i)*(y(i+1)-y(i)-h(i)/6)*(Y(i+1)+2*Y(i)))*(t(j)-t(i))+1/2*Y(i)*(t(j)-t(i))^2 + 1/6*h(i)*(Y(i+1)-Y(i))*(t(j)-t(i))^3
end