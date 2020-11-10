function [approx,err] = ieulerint(A,y0,t0,tf,N)
h=(tf-t0)/N; % stegstorlek
approx(:,1) = y0; % startvärde
correct(:,1) = y0; % startvärde
for i = 2:(N+1) % #tidselement = #steg + 1
    uold = approx(:,i-1); % gammalt värde från föregående steg
    approx(:,i)= ieulerstep(A,uold,h); % ta ett steg framåt
    correct(:,i) = expm(A.*(i*h-t0))*y0; % riktiga värdet i punkten
end
err = correct-approx; % felet