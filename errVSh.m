% function errVSh(A, y0, t0, tf)
% errorArray = [];
% h = [];
% %N = linspace(2,2^10,100);
% N = [2,2^2,2^3,2^4,2^5,2^6,2^7,2^9,2^10,2^11,2^12,2^13];
% for i = 1:12
%     [~,error] = eulerint(A,y0,t0,tf,N(i));
%     errorArray(i) = norm(error(end));
%     h(i) = (tf-t0)/N(i);
% end
% figure(1)
% loglog(h,errorArray)
% hold on
% end

function errVSh(A, y0, t0, tf)
errorArray = [];
h = [];
%N = linspace(2,2^10,100);
%N = [2,2^2,2^3,2^4,2^5,2^6,2^7,2^9,2^10,2^11,2^12,2^13];
for i = 1:10
    [~,error] = eulerint(A,y0,t0,tf,2^i);
    errorArray(i) = norm(error(end));
    h(i) = (tf-t0)/2^i;
end
figure(1)
loglog(h,errorArray)
hold on
end