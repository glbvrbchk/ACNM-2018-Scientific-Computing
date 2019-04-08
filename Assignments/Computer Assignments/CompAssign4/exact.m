function [UE,UE2,t,t2]=exact(u0)
t=0:0.1:5
t2=0:0.2:5
UE(1)=u0
UE2(1)=u0

for k=2:length(t)
    UE(k)=flowmap(u0,0.1)
end
for k=2:length(t2)
    UE2(k)=flowmap(u0,0.2)
end
end
