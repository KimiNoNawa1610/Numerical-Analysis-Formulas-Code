function IRE = richardson(n1,n2)
    f = @(x) sqrt(abs(x));
    
    Itrue= 4/3;
    
    x1 = linspace(-1,1,n1+1);
    x2 = linspace(-1,1,n2+1);
    
    [trap1,sim1] = integrate(x1,f(x1));
    [trap2,sim2] = integrate(x2,f(x2));
    
    p1=1.5;
    p2=1.5;
    
    IREt = (2^(p1)*trap2-trap1)/(2^(p1)-1) % for composite trapezoid rule (CTR)
    
    et1=abs(trap2-Itrue)
    et2=abs(IREt-Itrue)
    
    IREs = (2^(p2)*sim2-sim1)/(2^(p2)-1) % for composite trapezoid rule (CSR)
    
    es1=abs(sim2-Itrue)
    es2=abs(IREs-Itrue)
    
% Name: Nhan Vo
% SID:017771388
% Problem II

% 2b)
% For CTR: IREt=1.7113
% et1=0.0010
% et2=1.3527e-6
% 
% For CSR: IREs=1.7112
% es1=1.3527e-06
% es2=1.5675e-8
% Both error is less than part Trapazoid and Simpsons errors in part b of the first problem

% 2c)
% With p=2, IREt=1.3332
% et1=4.0744e-4
% et2=1.6237e-4

% with p=4, IREs=1.3332
% es1=1.6237e-4
% es2=1.4258e-4 

% The errors in both cases of p are smaller than part c of the first problem

% 2d)
% With p=2, IREt=1.3333
% et1=4.0744e-4
% et2=5.3395e-6

% with p=4, IREs=1.3333
% es1=1.6237e-4
% es2=3.0001e-10
