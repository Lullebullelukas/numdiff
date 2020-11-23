function [approx,err] = testRK4stepint(f,y0,t0,tf,N,lambda)
h=(tf-t0)/N;
approx(:,1) = y0;
correct(:,1) = y0;
told=t0;
for i = 1:N
    uold = approx(:,i);
    approx(:,i+1)=RK4step(f,told,uold,h);
    correct(:,i+1) = expm(lambda.*(i*h-t0))*y0;
    told=t0+h*i;
end
%err = abs(approx-expm(A.*(tf-t0))*y0);
err =(correct-approx);