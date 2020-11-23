%% 4.1
[t,y] = adaptiveRK34(@vanderpol,0,200,[1;1],1e-8);
figure(1)
plot(t,y(2,:))
xlabel("t")
ylabel("y2(t)")
figure(2)
plot(y(1,:),y(2,:))
xlabel("y1")
ylabel("y2")
%% 4.2
[t,y] = adaptiveRK34(@vanderpol,0,1000*0.7,[2;0],1e-18);
figure(1)
plot(t,y(2,:))
xlabel("t")
ylabel("y2(t)")
figure(2)
plot(y(1,:),y(2,:))
xlabel("y1")
ylabel("y2")
%% for tol = 1e-8 (task 4.2)(bad)
mu = [10,15,22,33,47,68,100,150,220,330,470,680,1000];
N = [391,514,677,961,1454,2481,5054,11207,241601,543821,110306,231059,538521];

plot(mu,N)

%% for tol = 1e-18 (task 4.2)(good)

mu = [10,15,22,33,47,68,100,150,220,330,470,680,1000];
N = [117229,153006,197414,260109,332648,432233,570739,767559,1018609,1378405,1798952,2382429,3207181];
figure(3)
loglog(mu,N)
hold on
x = linspace(15,1000);
loglog(x, x.^.73* 6*N(end)/mu(end));
% p =~ 0.73 C=~~ 1.9243086e+04

%% task 4.3
[t,y] = ode15s(@vanderpol,[0 1000*0.7],[2;0]);
mu = [10,15,22,33,47,68,100,150,220,330,470,680,1000];
N = [46 49 50 58 61 63 50 49 47 49 50 50 50];
loglog(mu,N)
%plot(mu,N)

