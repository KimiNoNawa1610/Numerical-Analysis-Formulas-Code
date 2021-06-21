function [t,y] = BE(f,t0,tf,y0,dt)

    t=t0:dt:tf;
    i=1;
    y=0*t;
    
    y(i)=y0;
    tc =t0;
    
    while(tc<tf)
        dt0 = min(dt,tf-tc);
        % use BE to update
        i=i+1;
        %y(i)=y(i-1)+dt0*f(t(i-1),y(i-1));
        
        t(i)=t(i-1)+dt0;
        tc=t(i);
        
        a=5*tc*dt0;
        b=1;
        c=dt0*(1/(tc*tc)-5/tc)-y(i-1);
        
        y(i)= (-b+sqrt(b*b-4*a*c))/(2*a);%BE update
        
    end
    
%Nhan Vo
%SID# 017771388
%Worksheet#9

%Problem II

% 2c)
% Similar to Forward Euler, when dt=0.15, the approximate and exact solutions agree, 
%at least in a qualitative way