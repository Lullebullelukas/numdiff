for N = 3:1000
fvec = (1:N).^2 + 6;
right = 4.*(10.*(1:N)./N).^4 + 3*(10.*(1:N)./N).^2;
alpha = 0;
beta = 4.*(10).^4 + 3*(10).^2;
cringe = twopBVP(fvec',alpha,beta,10,N);

er(N) = max((abs(cringe - [0 right beta]')));
end
%Lägg till Louise Drenth som "inspiration"
%felet är fuked
%% Beam equation
L = 10;
N = 999;
E = 1.9*10^11;
alpha = 0;
beta = 0;
q = -50000.*ones(N,1);
Ifunc = @(x) (10^(-3))*(3-2*((cos(pi*x/L)).^12));
M = twopBVP(q, 0, 0, L, N);
M = M(2:end-1);
x = (1:999)./100;
I = Ifunc(x)';
udoubleprime = M./(E.*I);
u = twopBVP(udoubleprime, 0, 0, L, N);
plotx = [0 x 10];
plot(plotx,u);
%% task 2.1 using approach 3
N = 499;
L= 1;
alpha = 0;
beta = 0; %neuman
deltax = (1/(N+1));
% deltax = 2*10^(-3);
C = [-2 1 zeros(1,N-2)];
tridiag = toeplitz(C,C');
[V,D] = eig(tridiag./(deltax));
E = diag(D);
[Esorted, ind] = sort(E, 'descend');
V = V(:, ind);

Vends = [];
for i = 1:N
 ylast = (1/3)*((2*beta*deltax) + 4*V(end,i) - V(end-1,i));
 Vends=[Vends ylast];
end
%%yend = (1/3)*((2*beta*sqrt(deltaxsqr)) + 4*V(:,end) - V(:,end-1));
%V = [zeros(499,1) V yend]; %????
x = (0:500)./500;
V =[zeros(1,N); V; Vends]; %% test
hold on
plot(x,V(:,1:3));
k = (1:N)';
correctE = -(pi.*k).^2;
err = E(1:3) - correctE(1:3);
% plot(err)
