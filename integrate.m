function [trap,simp]=integrate(x,f)
    %x=[x0 x1...xn] grid points
    %f=[f0 f1...fn] function values at grid points
    
    h=x(2)-x(1);
    n=length(x)-1; 

    wt=2*ones(1,n+1);% quadrature weights for trapezoid
    wt(1)=1;
    wt(end)=1;
    wt=wt*h/2;
    
    trap=sum(f.*wt);% quadrature weights for simpsons rule
    
    if(mod(n,2)==0)
        ws= 2*ones(1,n+1);
        ws(2:2:n)=4;
        ws(1)=1;
        ws(end)=1;
        ws=h*ws/3;
        
        simp=sum(f.*ws);
        
    else
        simp =NaN;
    end
    
% Name: Nhan Vo
% SID:017771388
% Problem I

% 1b)
% With the Trapazoid composite integration rule, order of accuracy is 2
% et1=0.004
% et2=0.0010

% While the Simpson composite integration rule's order of accuracy is 4
% es1=2.1878e-5
% es2=1.3527e-6

% 1c)
% With the Trapazoid composite integration rule, order of accuracy is
% about 1.4877
% et1=0.0011
% et2=4.0744e-4

% With the Simpson composite integration rule, order of accuracy is
% about 1.5
% es1=0.2420
% es2=0.2643


    
    