%write a script that constructs T_\deltax 
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