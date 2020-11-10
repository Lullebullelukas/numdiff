%This is the implementation for only the last value

% function [approx, err] = eulerint(A,y0,t0,tf,N)
% h = (tf-t0)/N;
% unew = y0;
% for i= 1:N
%    uold = unew;
%    unew = eulerstep(A,uold,h);
% end
% approx = unew;
% err = approx-expm(A.*(tf-t0))*y0 ;
% end

function [approx,err] = eulerint(A,y0,t0,tf,N)
h=(tf-t0)/N;
approx(:,1) = y0;
correct(:,1) = y0;
for i = 1:N-1
    uold = approx(:,i);
    approx(:,i+1)=eulerstep(A,uold,h);
    correct(:,i+1) = expm(A.*(i*h-t0))*y0;
end
%err = abs(approx-expm(A.*(tf-t0))*y0);
err = abs(approx-correct);