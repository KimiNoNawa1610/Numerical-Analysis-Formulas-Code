function [t,y] = FE(f,t0,tf,y0,dt)

    t=t0:dt:tf;
    i=1;
    y=0*t;
    
    y(i)=y0;
    tc =t0;
    
    while(tc<tf)
        dt0 = min(dt,tf-tc);
        % use FE to update
        i=i+1;
        y(i)=y(i-1) + dt0 * f( t(i-1), y(i-1) );
        t(i)=t(i-1) + dt0;
        tc=t(i);
    end


%Nhan Vo
%SID# 017771388
%Worksheet#9

%Problem I

% 1b)
% EG1=0.0198, EG2=0.0095, p=1.0573

% 1c)
% For dt=0.15, the approximation and the exact solutions agree at least in
% a quanlitative way.
