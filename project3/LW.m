function unew = LW(uold,dt,Tdx)
%setup for circular Tdx and Sdx
N = length(uold);
deltaX = 1/N;
C2 = [0 1 zeros(1,N-3) -1]; %-1 is there to be our repeating boundary condition
R2 = [0 -1 zeros(1,N-3) 1]'; %as is 1
Sdx = toeplitz(C2,R2)./(2*deltaX);




unew = uold - dt.*uold.*Sdx*uold + ((dt^2)/2)*(2*uold.*Sdx*(uold.^2) + (uold.^2).*Tdx*uold);

end