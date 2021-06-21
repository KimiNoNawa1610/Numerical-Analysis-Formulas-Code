function [S,Sp] =spline(x,f,fpl,fpr,y)
    % x : 1 by n+1 list of interpolation node (eq. spaced)
    % y : 1 by n+1 list of function values at nodes
    %fpl: value of f'(x0)
    %fpr: value of f'(xn)
    % y : 1 by m+1 list of evaluation points
    %       y=[y0 y1 ...ym]
    
    %S: spline S(x) evaluated at the y's
    %   S=[S(0) S(y1) ... S(ym)]
    n=length(x)-1;
    
    h= x(2)-x(1); %spacing between points
    
    a = f'; % known coefficient
    
    da = (a(2:end)-a(1:end-1))/h; % Delta_{+} a
    
    r=zeros(n+1,1);
    
    r(1)=da(1)-fpl;
    
    r(2:end-1) =da(2:end)-da(1:end-1);
    
    r(end)=fpr -da(end);
    
    r= 3*r/h;
    
    A=gallery('tridiag',ones(n,1),4*ones(n+1,1),ones(n,1));
    
    A(1,1)=2; A(end,end)=2;
    
    c=A\r;
    
    d=(c(2:end)-c(1:end-1))/(3*h);
    
    b=da-h*c(1:end-1)-h*h*d;
    
    [S,Sp]=evaluate(x,y,a,b,c,d);
    
end

function [S,Sp]=evaluate(x,y,a,b,c,d)
%   S=[S(0) S(y1) ... S(ym)]
    h=x(2)-x(1);
    S= 0*y;
    Sp=0*y;
    n=length(x)-1;
    for k=1:length(y) % loop over m+1=length(y) eval pts
        %y(k)= current evaluation point
        %determine the interval [x(j),x(j+1)] containing y(k)
        j=min(floor((y(k)-x(1))/h)+1,n);
        
        S(k)=a(j)+b(j)*(y(k)-x(j))+c(j)*(y(k)-x(j))^2 +d(j)*(y(k)-x(j))^3;
        
        Sp(k)= b(j)+2*c(j)*(y(k)-x(j))+3*d(j)*(y(k)-x(j))^2;
    end
    
end

% Name: Nhan Vo
% SID:017771388
% Problem II
% 2c)
% For f(x)=cos(2*pi*x). We need 29 point to have approximation error and it
% is less than the estimation error which is 57

% For f(x)=cos(4*pi*x). We need 57 point to have approximation error and it
% is less than the estimation error which is 114

% For f(x)=cos(6*pi*x). We need 86 point to have approximation error and it
% is less than the estimation error which is 171


        
    
    
    
    
    