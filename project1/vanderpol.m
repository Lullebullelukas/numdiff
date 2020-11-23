function dudt = vanderpol(t,u)
mu=1000;
u1=u(1);
u2=u(2);
dudt = [u2 ;mu*(1-u1.^2)*u2-u1];
end