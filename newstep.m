function hnew = newstep(tol,err,errold,hold,k)
err = abs(err);
errold = abs(errold);
hnew =((tol/err).^(2/(3*k))).*((tol/errold).^(-1/3*k)).*hold;
end