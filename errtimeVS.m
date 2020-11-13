function errtimeVS(A,y0,t0,tf,N)
 [~,err] = eulerint(A,y0,t0,tf,N);
 h =(tf-t0)/N;
 timearray(1) = 0;
  for i = 1:N
    timearray(i+1) = timearray(i)+ h;
  end
 semilogy(timearray,err);
 hold on;
end