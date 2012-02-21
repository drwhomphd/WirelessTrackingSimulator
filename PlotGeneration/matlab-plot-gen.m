% Plot percent steps detected outer
x = data(2:9, 1)
y = data(2:9, 2)
sd = data(2:9, 3)
y2 = data(2:9, 4)
sd2 = data(2:9, 5)
y3 = data(2:9, 6)
sd3 = data(2:9, 7)
figure
plot(x,y,x,y2,x,y3)
title('percent.steps.detected.outer -- UDEL -- Cellphone')
legend('45M Radius', '30M Radius', '15M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')

% Plot percent steps detected inner
x = data(11:18, 1)
y = data(11:18, 2)
sd = data(11:18, 3)
y2 = data(11:18, 4)
sd2 = data(11:18, 5)
y3 = data(11:18, 6)
sd3 = data(11:18, 7)
figure
plot(x,y,x,y2,x,y3)
title('percent.steps.detected.inner -- UDEL -- Cellphone')
legend('45M Radius', '30M Radius', '15M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot percent steps detected outer
x = data(2:9, 1)
y = data(2:9, 2)
sd = data(2:9, 3)
y2 = data(2:9, 4)
sd2 = data(2:9, 5)
y3 = data(2:9, 6)
sd3 = data(2:9, 7)
figure
subplot(3,1,1)
errorbar(x,y,sd)
title('percent.steps.detected.outer -- UDEL -- Cellphone')
legend('45M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')
subplot(3,1,2)
errorbar(x,y2,sd2)
title('percent.steps.detected.outer -- UDEL -- Cellphone')
legend('30M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')
subplot(3,1,3)
errorbar(x,y3,sd3)
title('percent.steps.detected.outer -- UDEL -- Cellphone')
legend('15M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')

% Plot percent steps detected inner
x = data(11:18, 1)
y = data(11:18, 2)
sd = data(11:18, 3)
y2 = data(11:18, 4)
sd2 = data(11:18, 5)
y3 = data(11:18, 6)
sd3 = data(11:18, 7)
figure
plot(x,y,x,y2,x,y3)
title('percent.steps.detected.inner -- UDEL -- Cellphone')
legend('45M Radius', '30M Radius', '15M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot percent steps detected outer
x = data2(2:9, 1)
y = data2(2:9, 2)
sd = data2(2:9, 3)
y2 = data2(2:9, 4)
sd2 = data2(2:9, 5)
y3 = data2(2:9, 6)
sd3 = data2(2:9, 7)
figure
plot(x,y,x,y2,x,y3)
title('percent.steps.detected.outer -- Random Walk -- Cellphone')
legend('45M Radius', '30M Radius', '15M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')

% Plot percent steps detected inner
x = data2(11:18, 1)
y = data2(11:18, 2)
sd = data2(11:18, 3)
y2 = data2(11:18, 4)
sd2 = data2(11:18, 5)
y3 = data2(11:18, 6)
sd3 = data2(11:18, 7)
figure
plot(x,y,x,y2,x,y3)
title('percent.steps.detected.inner -- Random Walk -- Cellphone')
legend('45M Radius', '30M Radius', '15M Radius')
xlabel('% Routers Infected')
ylabel('% Steps Detected')
