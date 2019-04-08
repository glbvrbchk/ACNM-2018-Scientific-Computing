function [LER,GER] = err(E,T,h)

LER(1)=0.1-E(1);
for i=2:length(T)
LER(i)=flowmap(E(i-1),h)-E(i);
end



for i=1:length(T)
GER(i)=flowmap(0.1,T(i))-E(i);
end
GER=GER'
end