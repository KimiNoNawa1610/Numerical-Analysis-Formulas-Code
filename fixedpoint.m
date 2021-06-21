function [p1,n] = fixedpoint(g,p0)

    nmax = 100;      % maximum number of iterations
    tol=10^(-6); %accuracy tolerance
    
    n=0; err=Inf; p1=p0;
        
    while(err>tol && n<=nmax)

        %fixe point iteration
        p0 = p1;
        p1 = g(p1);
        n=n+1;
        err= abs(p1-p0);
        
                
    end
    
    if(n>= nmax)
        error('Fixed point did not converge')
    end
%Name: Nhan Vo
%Student ID:017771388
%Quick Summary

%Problem 1
%1b)c=3.0 required 11 iterations
%   c=2.5 required 10 iteartions
%   c=2.0 required 9 iterations

%1c) The method did not converge. The interval of square-root of 2 is the
%best interval if the method converge. However, even with that interval,
%the method with function g(x)=x^2+x-1 fail at contraction.
 