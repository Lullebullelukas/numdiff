%% Task 1 write a script that constructs T_\deltax 
clear
tend = 0.1;
N = 30;
M = 193; %vary this between 185 and 193 to get legitness
deltaX = 1/(N+1);
deltaT = tend/(M);
mu = deltaT/(deltaX^2) %prints mu to the console, easier to check for CFL condition
xgrid = linspace(0,1,N);
C = [-2 1 zeros(1,N-2)];
tridiag = toeplitz(C,C');
tridiag = tridiag./(deltaX^2);

%Inital values for the function
uold = (-2*(xgrid.^2) + 2*xgrid)';
sol(1,:) = uold;
for i = 1:M
  unew = eulerstep2(tridiag,uold,deltaT);
  uold = unew;
  sol(i+1,:) = uold;
end
sol = sol';
sol = [zeros(1,M+1) ; sol ; zeros(1,M+1)];
xx = linspace(0,1,N+2);
tt = linspace(0,tend,M+1);
[T,X] = meshgrid(tt,xx);
mesh(X,T,sol)
xlabel("x")
ylabel("t")
zlabel("u")
%% Task 1 For TRP
clear
%write a script that constructs T_\deltax 
clear
tend = 0.1;
N = 30;
M = 40;
deltaX = 1/(N+1);
deltaT = tend/(M);
mu = deltaT/(deltaX^2) %prints mu to the console, easier to check for CFL condition
xgrid = linspace(0,1,N);
C = [-2 1 zeros(1,N-2)];
tridiag = toeplitz(C,C');
tridiag = tridiag./(deltaX^2);

%Inital values for the function
uold = (-2*(xgrid.^2) + 2*xgrid)';
sol(1,:) = uold;
for i = 1:M
  unew =TRstep(tridiag,uold,deltaT);
  uold = unew;
  sol(i+1,:) = uold;
end
sol = sol';
sol = [zeros(1,M+1) ; sol ; zeros(1,M+1)];
xx = linspace(0,1,N+2);
tt = linspace(0,tend,M+1);
[T,X] = meshgrid(tt,xx);
mesh(X,T,sol)
xlabel("x")
ylabel("t")
zlabel("u")
%% task 2
clear
N = 150; % whilst kept at 100:
M = 800; %505 for amu 1, 561 fpr 0.9, lower than 497 for wackyness
a=1;
tend = 5;
deltaX = 1/(N+1);
deltaT = tend/M;

x = linspace(0,1,N);
u = exp(-100.*(x-0.5).^2)';
t = linspace(0,tend,M);
sol(1,:)= u;
amu = abs(a*deltaT/deltaX)
cfl = deltaT/deltaX.^2

for i = 1:M
  unew = LaxWen(u,amu);
  u = unew;
  sol(i+1,:) = u;
end
sol = sol';
%sol = [zeros(1,M+1) ; sol ; ones(1,M+1)];
xx = linspace(0,1,N);
tt = linspace(0,tend,M+1);
[T,X] = meshgrid(tt,xx);
mesh(X,T,sol)
xlabel("x")
ylabel("t")
zlabel("u")
for j = 1:M
 rms(j) = sqrt(1/(N+1))*norm(sol(:,j));
end
figure(2)
plot(t, rms);

%% Task 3
clear
N = 100;
M = 500;
deltaX = 1/N;
deltaT = 1/M;
a = 1; %vary this
d = 0; %and this
P=abs(a/d)
x = linspace(0,1,N);
u = exp(-100.*(x-0.5).^2)';
sol(1,:) = u;
for i = 1:M
  unew = convdif(u,a,d,deltaT);
  u = unew;
  sol(i+1,:) = u;
end
sol = sol';
xx = linspace(0,1,N);
tt = linspace(0,1,M+1);
[T,X] = meshgrid(tt,xx);
mesh(X,T,sol)
xlabel("x")
ylabel("t")
zlabel("u")
%% Task 4



