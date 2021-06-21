x=linspace(0,1,3); %interpolation nodes
f=1./(1+(100*x.*x)); %function values at nodes
y=linspace(-1,1,200); %evaluation points / prediction locations

P = 0*y;
for k=1:length(x)
    P = P + f(k)*lagrange(y,x,k-1);
end

plot(y,(1./(1+(100*y.*y))),'b-'); hold on;

plot(y,P,'r-'); hold off;

err=max(abs(P-(1./(1+(100*y.*y)))));

function L = lagrange(y,x,k)

    n = length(x) - 1; m = length(y);
    if( k < 0 || k > n )
        error('Input k must be an integer in [0,length(x)-1]');
    end

    den = x(k+1) - x; den(k+1) = 1; den = den'; den = den*ones(1,length(y));
    num = ones(n+1,1)*y - x'*ones(1,m);
    num(k+1,:) = ones(1,m);
    
    L = prod( num./den , 1);
    
end

% implementation of P_n(y)=f_0 L_{n,k}(y)+f_1L{n,1}(y)+...


%Name: Nhan Vo
%Student ID:017771388
%Quick Summary

%Problem 2
% 2b) The error is relatively small, 0.3056
% 2c) The error is relatively large, 5.7121