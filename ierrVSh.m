function ierrVSh(A, y0, t0, tf)
errorArray = zeros(1,10); % håller globala felet för varje N-värde
h = zeros(1,10); % h för varje N
for i = 1:10
    [~,error] = ieulerint(A,y0,t0,tf,2^i); % felmatris för N = 2^i
    errorArray(i) = norm(error(:,end)); % "felnormen" för slutvärdena
    h(i) = (tf-t0)/(2^i); % storleken på h för N = 2^i
end
figure(1)
loglog(h,errorArray) 
hold on
end