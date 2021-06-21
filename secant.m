function [p1,n] = secant(f,p0,p1)

    nmax = 100;      % maximum number of iterations
    tol=10^(-15);    %accuracy tolerance
    
    n=1; err=Inf; 
        
    while(err>tol && n<=nmax)
        
        fp=(f(p1)-f(p0))/(p1-p0);
        
        %check for division by zero
        if(1/abs(fp)==Inf)
            error('Encounter division by zero')
        end
        
        if(abs(fp)<eps)
            warning('Encounter near division by zero');
        end

        %secant iteration
        pn=p0-f(p0)*((p0-p1)/(f(p0)-f(p1)));
        p1=p0;
        p0=pn;
        n=n+1;
        err= abs(p1-p0);
        
                
    end
%Name: Nhan Vo
%Student ID:017771388




