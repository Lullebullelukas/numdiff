function unew = LaxWen(u,amu)
N = length(u);
C = [1-amu^2 -(1-amu)*amu/2 zeros(1,N-3) (1+amu)*amu/2];
R = [1-amu^2 (1+amu)*amu/2 zeros(1,N-3) -(1-amu)*amu/2]';
tridiag = toeplitz(C,R);
unew = tridiag*u;
end
