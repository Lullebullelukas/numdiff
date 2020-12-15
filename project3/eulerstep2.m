function unew = eulerstep2(Tdx, uold, dt)
unew = uold + (Tdx*uold).*dt;
end