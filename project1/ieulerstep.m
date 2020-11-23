function unew = ieulerstep(A, uold, h)
I = eye(length(uold));
unew = (I-h.*A)\uold; 
end


