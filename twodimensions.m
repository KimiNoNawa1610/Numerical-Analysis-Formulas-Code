function [I2,I4]=twodimensions(x2,w2,x4,w4)
    f = @(x,y) exp(-(x.*x+y.*y)/2);
    
    n= length(x2)-1;
    X=(x2')*ones(1,n+1);
    Y=ones(n+1,1)*(x2);
    
    F=f(X,Y);
    %W=ones(n+1,1)*(w2);
    W=(w2')*(w2);
    
    I2=sum(sum(F.*W));
    
    n= length(x4)-1;
    X=(x4')*ones(1,n+1);
    Y=ones(n+1,1)*(x4);
    
    F=f(X,Y);
    %W=ones(n+1,1)*(w2);
    W=(w4')*(w4);
    
    I4=sum(sum(F.*W));
    
% Name: Nhan Vo
% SID:017771388
% Problem II

% 2 b)
% I2=2.928372400783834

% 2 c)
% I4=2.928372400003238
