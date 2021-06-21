function [t,y] = RK24(f,t0,tf,y0,dt,tol)
    t = t0:dt:tf;
    m=size(y0,1); % number of ODEs in system y'=f(t,y)
    y = zeros(m,length(t));
    

    i=1; 
    tc = t0; 
    y(:,i) = y0; 
    dt0 = dt;
    while(tc<tf)

        dt0 = min(dt0,tf-tc);
        i =i+1;
        tc = t(i-1)+dt0;

        t(i) = tc;
        k1 = f(t(i-1), y(:,i-1));       
        Y1 = y(:,i-1) + .5*dt0*k1;

        k2 = f(t(i-1) + .5*dt0,Y1);  
        Y2 = y(:,i-1) + .5*dt0*k2;

        k3 = f(t(i-1) + .5*dt0,Y2); 
        Y3 = y(:,i-1) + dt0*k3;

        k4 = f(t(i),Y3);

        tau = norm((k1+2*k2+2*k3+k4)/6-k2);

        theta = sqrt( tol/tau );

        if (tau < tol)  
            y(:,i) = y(:,i-1) + dt0*k2;
            dt0 = min(.95*theta*dt0, dt);
        else
            dt0 = min(.95*theta*dt0, dt);  % choose smaller dt0 and try again
            i = i-1;          % reset / go back to previous time step
            tc = t(i);
        end
    end
end
    
    % assume y_{k-1}=y(t_{k-1})
    %y(t_k) -y(k-1)= dt*RHS(method) +dt*trunc(method)
    %dt*RHS(method 1)- RHS(method 2)=trunc(method 1)-trunc(method 2)
    
% Name: Nhan Vo
% SID:017771388
% Problem I

% 1c) I noticed that the solutions are the same.
% 1d)

% Problem II

% The plot is much more different from pat c of porblem 1. It could be
% explained that we are working with 3 dimensional vector instead of 2
% dimensional one. 



    