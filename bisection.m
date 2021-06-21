function [p1,n] = bisection(f,a,b)

    nmax = 100;      % maximum number of iterations
    p1   = (a+b)/2;  % initial guess for solution
    tol=10^(-8); % accuracy tolerance
    if (f(a)*f(b)>0)
        error('Endpoints have the same sign');
    end
    
    for n = 1:nmax
        
        if( f(p1)*f(a) > 0 )  % take right interval
            a = p1;
        end
        
        if( f(p1)*f(a) < 0 )  % take left interval
            b = p1;
        end
        
        p0=p1;
        
        p1 = (b+a)/2;         % update midpoint
       
        err= abs( p1 - p0 ); % estimate error
        
        if( f(p1) == 0||err<tol ) % stop if solution is accurate enough
            break;
        end
        
    end
    
    if(n>=nmax)
        error('Bisection method did not converge');
    end
    
end 

% Name: Nhan Vo
% SID:017771388
% Problem I
% 1d) p=1.4142, n=21 iterations
% 1e) actual error= 5.7184e-07, estimate error =9.5367e-07
% The actual error is smaller than the estimate error
%
% Problem II
% 2a) function f(x)=x^3-19, on the interval [0,4], p=2.66840
% 2b) The estimate iterations is n=28. The actual iterations is 27
% => The estimate iterations is greater than the actual iterations number
% but they are close to each other.
