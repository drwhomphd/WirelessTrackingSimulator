%% Main

x = [15 30 45];
ebar15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/1Perc/both/error-plot-expected.outer.detection.dat');
 

yvals = zeros(length(x), (length(ebar15) ./ length(x)));
pop = [];

for i = 1: length(ebar15)
   cury = mod(i - 1, length(yvals(2,:))) + 1;
    yvals(find(ismember(x, ebar15(i,3))),cury) = ebar15(i,1);
end

pop = [length(yvals(1, :)) length(yvals(2, :)) length(yvals(3, :))];
y = [ mean(yvals(1, :)) mean(yvals(2,:)) mean(yvals(3,:))];

err = [ (std(yvals(1,:))./sqrt(pop(1))) (std(yvals(2,:))./sqrt(pop(1))) (std(yvals(3,:))./sqrt(pop(1)))];

figure;
h1 = errorbar(x, y,err);
xlabel('Percent Devices Able to Detect')
ylabel('Average Number of Devices Detecting User')
title('Average Outer Detection Count -- UDel 9056 Pedestrians 45M Radius')
saveas(h1, 'udel-9056p-45M-routers-number-devices-detect-outer', 'jpg')

%% Figure 2

ebar15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/1Perc/both/error-plot-expected.inner.detection.dat');
 

yvals = zeros(length(x), length(ebar15) ./ length(x));

for i = 1: length(ebar15)
   cury = mod(i - 1, length(yvals)) + 1;
   yvals(find(ismember(x, ebar15(i,2))),cury) = ebar15(i,1);
end

y = [ mean(yvals(1, :)) mean(yvals(2,:)) mean(yvals(3,:)) mean(yvals(4,:)) mean(yvals(5,:)) mean(yvals(6,:)) mean(yvals(7,:)) mean(yvals(8,:))];

err = [ std(yvals(1,:)) std(yvals(2,:)) std(yvals(3,:)) std(yvals(4,:)) std(yvals(5,:)) std(yvals(6,:)) std(yvals(7,:)) std(yvals(8,:))];

figure;
h1 = errorbar(x, y,err);
xlabel('Percent Devices Able to Detect')
ylabel('Average Number of Devices Detecting User')
title('Average Inner Detection Count -- UDel 9056 Pedestrians 45M Radius')
saveas(h1, 'udel-9056pc-45M-routers-number-devices-detect-inner', 'jpg')
