function testRK4stepVSh(f, y0, t0, tf,lambda)
errorArray = [];
h = [];
for i = 1:15
    [~,error] = testRK4stepint(f,y0,t0,tf,2^i,lambda);
    errorArray(i) = norm(error(:,end));
    h(i) = (tf-t0)/2^i;
end
figure(1)
loglog(h,errorArray)
figure(2)
plot(h.^4,errorArray) %%Hur ser man ordo 4?
hold on
end