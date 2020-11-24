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
 error(i) = sqrt(L/N(i)+1).*norm(approx-solution);
end
loglog(deltax,error)

