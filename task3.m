[t,y] = adaptiveRK34(@lotka,0,100,[1;10],1e-8);
%[t,y] = ode45(@lotka,[0;100],[1;1])

figure(1)
subplot(211)
plot(t,y(1,:))
xlabel("bajs")
ylabel("bajs")
subplot(212)
plot(t,y(2,:))
xlabel("bajs")
ylabel("bajs")
figure(2)
plot(y(1,:),y(2,:))