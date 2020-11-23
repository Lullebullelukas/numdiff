function unew = eulerstep(A, uold, h)
unew = uold + (A*uold).*h;
end


