function[x1,w1,x2,w2,x3,w3,x4,w4]=gauss

    load('points.mat');
    w1=zeros(1,4); %GQ for n=3
    w2=zeros(1,7); %GQ for n=6
    w3=zeros(1,13); %GQ for n=12
    w4=zeros(1,25); %GQ for n=24
    
    y1=[-1 0 1];
    ws=(1/3)*[1 4 1];
    
    for k=0:3
        % evaluate L_{3,k} and integrate from (-1,1)
        L = lagrange(y1,x1,k);
        w1(k+1) =sum(L.*ws);
    end
    
    
    for k=0:6
        % evaluate L_{6,k} and integrate from (-1,1)
        L = lagrange(x1,x2,k);
        w2(k+1) =sum(L.*w1);
    end
    
    for k=0:12
        % evaluate L_{12,k} and integrate from (-1,1)
        L = lagrange(x2,x3,k);
        w3(k+1) =sum(L.*w2);
    end
    
    for k=0:24
        % evaluate L_{12,k} and integrate from (-1,1)
        L = lagrange(x3,x4,k);
        w4(k+1) =sum(L.*w3);
    end
    
% Name: Nhan Vo
% SID:017771388
% Problem I

% 1 e)
% w1(1:3)= 0.3479, 0.6521, 0.6521
% w2(1:3)= 0.1295, 0.2797, 0.3818
% w3(1:3)= 0.0405, 0.0921, 0.1389
% w4(1:3)= 0.0114, 0.0264, 0.0409

% 1 f)
% with n=3 the estimation = 1.711224504599490. Error = 2.4792e-5
% with n=6 the estimation = 1.711248784012375. Error = 2.2808e-10
% with n=12 the estimation = 1.711248783784297. Error = 2.22045e-16
% with n=24 the estimation = 1.711248783784298. Error = 2.22045e-16
% When using the Gaussian quadrature, the error is smaller than composite
% Simpson's rule with the same number of points

% 1 g)
% with n=3 the estimation = 1.406104920402750. Error = 0.0728
% with n=6 the estimation = 1.220512215842145. Error = 0.1128
% with n=12 the estimation = 1.286646128923084. Error = 0.0467
% with n=24 the estimation = 1.315352791719249. Error = 0.0180



    
    