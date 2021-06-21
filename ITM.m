function [t,y] = ITM(f,t0,tf,y0,dt)

    t=t0:dt:tf;
    i=1;
    y=0*t;
    
    y(i)=y0;
    tc =t0;
    
    while(tc<tf)
        dt0 = min(dt,tf-tc);
        % use FE to update
        i=i+1;
        tc=t(i-1)+dt0;
        
        t(i)=tc;
        k1=f(t(i-1),y(i-1));
        
        g=@(x) (x-y(i-1))/(dt0)-.5*(f(tc,x)+k1);
        
        %solve
        [p,it]=secant(g,y(i-1),y(i-1)+dt0*k1);
        y(i)=p;
        
%         k1=f(t(i-1),y(i-1));
%         Y1=y(i-1)+0.5*dt0*k1;
%         
%         k2=f(t(i-1)+0.5*dt0,Y1);
%         Y2=y(i-1)+0.5*dt0*k2;
%         
%         k3=f(t(i-1)+0.5*dt0,Y2);
%         Y3=y(i-1)+dt0*k3;
%         
%         k4=f(t(i),Y3);
%         
%         y(i)=y(i-1)+dt0*(k1+2*k2+2*k3+k4)/6;
        
    end
    it
    
%Nhan Vo
%SID# 017771388
%Worksheet#10

%Problem II

% 2c) With the any value of dt, the ITM method will give a qalitatively reseaonable solution