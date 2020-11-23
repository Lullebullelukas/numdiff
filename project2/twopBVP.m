function y = twopBVP(fvec, alpha, beta, L, N)
deltaxsqr = (L/(N+1)).^2;
C = [-2 1 zeros(1,N-2)];
tridiag = toeplitz(C,C');
fvector = fvec + [-alpha/deltaxsqr zeros(1,N-2) -beta/deltaxsqr]';
y = [alpha; deltaxsqr*(tridiag\fvector); beta];
%Kan lägga full här eller utanför
end
