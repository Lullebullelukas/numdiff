function unew = TRstep(Tdx, uold, dt)
temp = (dt/2).*Tdx;
unew = ((eye(size(temp))-temp)\(eye(size(temp))+temp))*uold;
end