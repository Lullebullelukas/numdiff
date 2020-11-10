function ierrtimeVS(A,y0,t0,tf,N)
 [~,err] = ieulerint(A,y0,t0,tf,N); % felmatris
 h =(tf-t0)/N;
 timearray = t0:h:tf;
 error = zeros(1,length(timearray));
 for k = 1:length(timearray)
     error(k) = norm(err(:,k)); % "felnormen" vid varje tidpunkt
 end
 semilogy(timearray,error);
 hold on;
end

% relative error?