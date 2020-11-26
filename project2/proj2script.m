%Testing
L = pi;
alpha = 0;
beta = 0;
j = 2:10;
for i=j
 N(i) = 2.^i;
 deltax(i) = L./(N(i)+1);
 x = (0:deltax(i):L);
 inside = x(2:end-1);
 fvec = sin(inside);
 solution = -sin(x)';
 approx = twopBVP(fvec',alpha, beta, L, N(i));
 error(i) = sqrt(L/(N(i)+1)).*norm(approx-solution);
end
figure(1)
loglog(deltax, error);
hold on
loglog(deltax, deltax.^2);
hold off

%Lägg till Louise Drenth som "inspiration"
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
tridiag = tridiag(1:end-1,:);
tridiag = [tridiag ; zeros(1,N-2) 2/3 -2/3]; 
[V,D] = eig(tridiag./(deltax.^2));
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
%% 
L = 1;
alpha = 0;
beta = 0; %neuman
N = (6:499);
for i = 1:length(N)
  k = 0:N(i)-1;
  deltax = 1./(N(i)+1);
  C = [-2 1 zeros(1,N(i)-2)];
  tridiag = toeplitz(C,C');
  tridiag = tridiag(1:end-1,:);
  tridiag = [tridiag ; zeros(1,N(i)-2) 2/3 -2/3]; 
  [V,D] = eig(tridiag./(deltax.^2));
  E = diag(D);
  solution = (-((pi.*k + pi/2).^2))';
  [Esorted, ind] = sort(E, 'descend');
  error1(i) = abs(Esorted(1)-solution(1));
  error2(i) = abs(Esorted(2)-solution(2));
  error3(i) = abs(Esorted(3)-solution(3));
end

subplot(311)
loglog(N,error1);
xlabel('Amount of inner elements N');
ylabel('error RMS');

subplot(312);
loglog(N,error2);
xlabel('Amount of inner elements N');
ylabel('error RMS');

subplot(313);
loglog(N,error3);
xlabel('Amount of inner elements N');
ylabel('error RMS');
%Rätt lutningar, lite fucked
%% 2.2

