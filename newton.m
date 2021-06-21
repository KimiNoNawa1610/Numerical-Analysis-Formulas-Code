function [p1,n] = newton(f,fprime,p0)

    nmax = 100;      % maximum number of iterations
    tol=10^(-10); %accuracy tolerance
    
    n=0; err=Inf; p1=p0;
        
    while(err>tol && n<=nmax)
        
        %check for division by zero
        if(1/abs(fprime(p1))==Inf)
            error('Encounter division by zero')
        end
        
        if(abs(fprime(p1))<eps)
            warning('Encounter near division by zero');
        end

        %fixe point iteration
        p0 = p1;
        p1 = p1-f(p1)/fprime(p1);
        n=n+1;
        err= abs(p1-p0);
        
                
    end
%Name: Nhan Vo
%Student ID:017771388
%Quick Summary

%Problem 2
%2c) It required 5 iterations to run
%2d) It required 33 iteratons to run The iteartions number was much more
%than 2c). I think the function complication could be one of the reason.
%When we have a basic function, it will take less time to converge than a
%more complicated one

%2e) For p0=-1 and p0=-2, the method did converge. So a good enough initial
%guess for the solution to f(p)=0 can be -1 or -2.
