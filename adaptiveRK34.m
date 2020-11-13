%%Not tested yet

function [t,y] = adaptiveRK34(f,t0,tf,y0,tol)
  told = t0;
  uold = y0;
  err = tol;
  y(1) = y0;
  t(1) = t0;
  hnew = (abs(tf-t0)*tol^(1/4))/(100*(1+norm(f(t0,y0))));
  counter = 2;
  while t(end) <= tf
    if t(end) + hnew > tf
      hnew = tf - t(end);
    end
    errold=err;
    [y(counter),err] = RK34step(f,told,uold,hnew);
    uold = y(counter);
    t(counter) = t(counter-1) + hnew;
    hold = hnew;
    hnew = newstep(tol,err,errold,hold,k);
    counter = counter + 1;
  end
end
