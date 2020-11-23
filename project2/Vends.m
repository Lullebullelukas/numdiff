Vends = [];
beta = 0;
deltax = sqrt(deltaxsqr);

for i = 1:499
 ylast = (1/3)*((2*beta*deltax) + 4*V(end,i) - V(end-1,i));
 Vends=[Vends ylast];
end