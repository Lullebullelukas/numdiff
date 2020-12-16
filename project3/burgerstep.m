function unew = burgerstep(u,d,dt)
N = length(u);
deltaX = 1/N;
C = [-2 1 zeros(1,N-3) 1];
R = [-2 1 zeros(1,N-3) 1]';
Tdx = toeplitz(C,R)./(deltaX^2);

temp = (dt/2).*Tdx;
unew = (eye(size(temp))-temp)\(LW(u,dt,Tdx) + d.*temp*u);
end
