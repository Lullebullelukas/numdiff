%Scriptssszzz
err1 = [];
err2 = [];
err3 = [];
k = (1:3)';
correctE = -(pi.*k).^2;
for N = 3:1000
L= 1;
alpha = 0;
beta = 0; %neuman
deltax = (1/(N+1));
C = [-2 1 zeros(1,N-2)];
tridiag = toeplitz(C,C');
[~,D] = eig(tridiag./(deltax));
E = diag(D);
[Esorted, ind] = sort(E, 'descend');
error1 = (E(1) - correctE(1));
error2 = (E(2) - correctE(2));
error3 = (E(3) - correctE(3));
err1 = [err1 error1];
err2 = [err2 error2];
err3 = [err3 error3];
end
hold on
loglog((3:1000),(err1))
loglog((3:1000),(err2))
loglog((3:1000),(err3))
loglog((3:1000), -(3:1000)*4)