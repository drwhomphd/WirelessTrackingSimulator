%% Main

% %% Outer Router Detections
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/1-100perc/routers/3d-histo-percent.steps.detected.outer-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [1 2 3 4 5];
% 
% % Get population count
% popCount = length(rad) ./ length(x);
% 
% % Get bins for each radius
% hist5 = hist(rad(1:popCount,1), [.05:.1:.95]);
% hist4 = hist(rad(popCount+1:popCount*2, 1), [.05:.1:.95]);
% hist3 = hist(rad(popCount * 2 + 1:popCount * 3, 1), [.05:.1:.95]);
% hist2 = hist(rad(popCount * 3 + 1:popCount * 4, 1), [.05:.1:.95]);
% hist1 = hist(rad(popCount * 4 + 1:popCount * 5, 1), [.05:.1:.95]);
% 
% y10 = [(hist1(10)./popCount) (hist2(10)./popCount) (hist3(10)./popCount) (hist4(10)./popCount) (hist5(10)./popCount)];
% y9 = [(hist1(9)./popCount) (hist2(9)./popCount) (hist3(9)./popCount) (hist4(9)./popCount) (hist5(9)./popCount)] + y10;
% y8 = [(hist1(8)./popCount) (hist2(8)./popCount) (hist3(8)./popCount) (hist4(8)./popCount) (hist5(8)./popCount)] + y9;
% y7 = [(hist1(7)./popCount) (hist2(7)./popCount) (hist3(7)./popCount) (hist4(7)./popCount) (hist5(7)./popCount)] + y8;
% y6 = [(hist1(6)./popCount) (hist2(6)./popCount) (hist3(6)./popCount) (hist4(6)./popCount) (hist5(6)./popCount)] + y7;
% y5 = [(hist1(5)./popCount) (hist2(5)./popCount) (hist3(5)./popCount) (hist4(5)./popCount) (hist5(5)./popCount)] + y6;
% y4 = [(hist1(4)./popCount) (hist2(4)./popCount) (hist3(4)./popCount) (hist4(4)./popCount) (hist5(4)./popCount)] + y5;
% y3 = [(hist1(3)./popCount) (hist2(3)./popCount) (hist3(3)./popCount) (hist4(3)./popCount) (hist5(3)./popCount)] + y4;
% y2 = [(hist1(2)./popCount) (hist2(2)./popCount) (hist3(2)./popCount) (hist4(2)./popCount) (hist5(2)./popCount)] + y3;
% y1 = [(hist1(1)./popCount) (hist2(1)./popCount) (hist3(1)./popCount) (hist4(1)./popCount) (hist5(1)./popCount)] + y2;
% 
% % figure
% % 
% % %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% % %plot(x, y2, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% % 
% % title('Increase in detections for a detection radius of 15 Meters')
% % xlabel('Detector Percentage')
% % ylabel('Fraction of Population Detected')
% % ylim([0 1])
% % set(gca,'XTick', x)
% % %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% % %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% % saveas(gcf, 'udel-9056-700to730-outer-router-DetectionWith15MRouterRad.pdf', 'pdf')
% 
% %% Inner Router Detections
% 
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/1-100perc/routers/3d-histo-percent.steps.detected.inner-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [1 2 3 4 5];
% 
% % Get population count
% popCount = length(rad) ./ length(x);
% 
% % Get bins for each radius
% hist5 = hist(rad(1:popCount,1), [.05:.1:.95]);
% hist4 = hist(rad(popCount+1:popCount*2, 1), [.05:.1:.95]);
% hist3 = hist(rad(popCount * 2 + 1:popCount * 3, 1), [.05:.1:.95]);
% hist2 = hist(rad(popCount * 3 + 1:popCount * 4, 1), [.05:.1:.95]);
% hist1 = hist(rad(popCount * 4 + 1:popCount * 5, 1), [.05:.1:.95]);
% 
% yi10 = [(hist1(10)./popCount) (hist2(10)./popCount) (hist3(10)./popCount) (hist4(10)./popCount) (hist5(10)./popCount)];
% yi9 = [(hist1(9)./popCount) (hist2(9)./popCount) (hist3(9)./popCount) (hist4(9)./popCount) (hist5(9)./popCount)] + yi10;
% yi8 = [(hist1(8)./popCount) (hist2(8)./popCount) (hist3(8)./popCount) (hist4(8)./popCount) (hist5(8)./popCount)] + yi9;
% yi7 = [(hist1(7)./popCount) (hist2(7)./popCount) (hist3(7)./popCount) (hist4(7)./popCount) (hist5(7)./popCount)] + yi8;
% yi6 = [(hist1(6)./popCount) (hist2(6)./popCount) (hist3(6)./popCount) (hist4(6)./popCount) (hist5(6)./popCount)] + yi7;
% yi5 = [(hist1(5)./popCount) (hist2(5)./popCount) (hist3(5)./popCount) (hist4(5)./popCount) (hist5(5)./popCount)] + yi6;
% yi4 = [(hist1(4)./popCount) (hist2(4)./popCount) (hist3(4)./popCount) (hist4(4)./popCount) (hist5(4)./popCount)] + yi5;
% yi3 = [(hist1(3)./popCount) (hist2(3)./popCount) (hist3(3)./popCount) (hist4(3)./popCount) (hist5(3)./popCount)] + yi4;
% yi2 = [(hist1(2)./popCount) (hist2(2)./popCount) (hist3(2)./popCount) (hist4(2)./popCount) (hist5(2)./popCount)] + yi3;
% yi1 = [(hist1(1)./popCount) (hist2(1)./popCount) (hist3(1)./popCount) (hist4(1)./popCount) (hist5(1)./popCount)] + yi2;
% 
% 
% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y2, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% 
% title('Increase in detections for a detection radius of 15 Meters')
% xlabel('Detector Percentage')
% ylabel('Fraction of Population Detected')
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% ylim([0 1])
% set(gca,'XTick', x)
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% saveas(gcf, 'udel-9056-700to730-router-DetectionWith15MRouterRad.pdf', 'pdf')

%% Outer Cell Detections
rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-FIXED-15MRad/3d-histo-percent.steps.detected.outer-15MRad.dat');
%rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-FIXED-ROUTER-15M/3d-histo-percent.steps.detected.outer-15MRad.dat');

% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
x = [1 2 3 4 5 10 25 50 75 100];
xgraph = [1 5 10 25 50 75 100];

% Get population count
popCount = length(rad) ./ length(x);

% Get bins for each radius
hist100 = hist(rad(1:popCount,1), [.05:.1:.95]);
hist75 = hist(rad(popCount+1:popCount*2,1), [.05:.1:.95]);
hist50 = hist(rad(popCount * 2 + 1:popCount * 3,1), [.05:.1:.95]);
hist25 = hist(rad(popCount * 3 + 1:popCount * 4,1), [.05:.1:.95]);
hist10 = hist(rad(popCount * 4 + 1:popCount * 5,1), [.05:.1:.95]);
hist5 = hist(rad(popCount * 5 + 1:popCount * 6,1), [.05:.1:.95]);
hist4 = hist(rad(popCount * 6 + 1:popCount * 7, 1), [.05:.1:.95]);
hist3 = hist(rad(popCount * 7 + 1:popCount * 8, 1), [.05:.1:.95]);
hist2 = hist(rad(popCount * 8 + 1:popCount * 9, 1), [.05:.1:.95]);
hist1 = hist(rad(popCount * 9 + 1:popCount * 10, 1), [.05:.1:.95]);

%{
y10 = [(hist1(10)./popCount) (hist2(10)./popCount) (hist3(10)./popCount) (hist4(10)./popCount) (hist5(10)./popCount) (hist10(10)./popCount) (hist25(10)./popCount) (hist50(10)./popCount) (hist75(10)./popCount) (hist100(10)./popCount)];
y9 = [(hist1(9)./popCount) (hist2(9)./popCount) (hist3(9)./popCount) (hist4(9)./popCount) (hist5(9)./popCount) (hist10(9)./popCount) (hist25(9)./popCount) (hist50(9)./popCount) (hist75(9)./popCount) (hist100(9)./popCount)] + y10;
y8 = [(hist1(8)./popCount) (hist2(8)./popCount) (hist3(8)./popCount) (hist4(8)./popCount) (hist5(8)./popCount) (hist10(8)./popCount) (hist25(8)./popCount) (hist50(8)./popCount) (hist75(8)./popCount) (hist100(8)./popCount)] + y9;
y7 = [(hist1(7)./popCount) (hist2(7)./popCount) (hist3(7)./popCount) (hist4(7)./popCount) (hist5(7)./popCount) (hist10(7)./popCount) (hist25(7)./popCount) (hist50(7)./popCount) (hist75(7)./popCount) (hist100(7)./popCount)] + y8;
y6 = [(hist1(6)./popCount) (hist2(6)./popCount) (hist3(6)./popCount) (hist4(6)./popCount) (hist5(6)./popCount) (hist10(6)./popCount) (hist25(6)./popCount) (hist50(6)./popCount) (hist75(6)./popCount) (hist100(6)./popCount)] + y7;
y5 = [(hist1(5)./popCount) (hist2(5)./popCount) (hist3(5)./popCount) (hist4(5)./popCount) (hist5(5)./popCount) (hist10(5)./popCount) (hist25(5)./popCount) (hist50(5)./popCount) (hist75(5)./popCount) (hist100(5)./popCount)] + y6;
y4 = [(hist1(4)./popCount) (hist2(4)./popCount) (hist3(4)./popCount) (hist4(4)./popCount) (hist5(4)./popCount) (hist10(4)./popCount) (hist25(4)./popCount) (hist50(4)./popCount) (hist75(4)./popCount) (hist100(4)./popCount)] + y5;
y3 = [(hist1(3)./popCount) (hist2(3)./popCount) (hist3(3)./popCount) (hist4(3)./popCount) (hist5(3)./popCount) (hist10(3)./popCount) (hist25(3)./popCount) (hist50(3)./popCount) (hist75(3)./popCount) (hist100(3)./popCount)] + y4;
y2 = [(hist1(2)./popCount) (hist2(2)./popCount) (hist3(2)./popCount) (hist4(2)./popCount) (hist5(2)./popCount) (hist10(2)./popCount) (hist25(2)./popCount) (hist50(2)./popCount) (hist75(2)./popCount) (hist100(2)./popCount)] + y3;
y1 = [(hist1(1)./popCount) (hist2(1)./popCount) (hist3(1)./popCount) (hist4(1)./popCount) (hist5(1)./popCount) (hist10(1)./popCount) (hist25(1)./popCount) (hist50(1)./popCount) (hist75(1)./popCount) (hist100(1)./popCount)] + y2;
%}

y10 = [(hist1(10)./popCount) (hist5(10)./popCount) (hist10(10)./popCount) (hist25(10)./popCount) (hist50(10)./popCount) (hist75(10)./popCount) (hist100(10)./popCount)];
y9 = [(hist1(9)./popCount) (hist5(9)./popCount) (hist10(9)./popCount) (hist25(9)./popCount) (hist50(9)./popCount) (hist75(9)./popCount) (hist100(9)./popCount)] + y10;
y8 = [(hist1(8)./popCount) (hist5(8)./popCount) (hist10(8)./popCount) (hist25(8)./popCount) (hist50(8)./popCount) (hist75(8)./popCount) (hist100(8)./popCount)] + y9;
y7 = [(hist1(7)./popCount) (hist5(7)./popCount) (hist10(7)./popCount) (hist25(7)./popCount) (hist50(7)./popCount) (hist75(7)./popCount) (hist100(7)./popCount)] + y8;
y6 = [(hist1(6)./popCount) (hist5(6)./popCount) (hist10(6)./popCount) (hist25(6)./popCount) (hist50(6)./popCount) (hist75(6)./popCount) (hist100(6)./popCount)] + y7;
y5 = [(hist1(5)./popCount) (hist5(5)./popCount) (hist10(5)./popCount) (hist25(5)./popCount) (hist50(5)./popCount) (hist75(5)./popCount) (hist100(5)./popCount)] + y6;
y4 = [(hist1(4)./popCount) (hist5(4)./popCount) (hist10(4)./popCount) (hist25(4)./popCount) (hist50(4)./popCount) (hist75(4)./popCount) (hist100(4)./popCount)] + y5;
y3 = [(hist1(3)./popCount) (hist5(3)./popCount) (hist10(3)./popCount) (hist25(3)./popCount) (hist50(3)./popCount) (hist75(3)./popCount) (hist100(3)./popCount)] + y4;
y2 = [(hist1(2)./popCount) (hist5(2)./popCount) (hist10(2)./popCount) (hist25(2)./popCount) (hist50(2)./popCount) (hist75(2)./popCount) (hist100(2)./popCount)] + y3;
y1 = [(hist1(1)./popCount) (hist5(1)./popCount) (hist10(1)./popCount) (hist25(1)./popCount) (hist50(1)./popCount) (hist75(1)./popCount) (hist100(1)./popCount)] + y2;


% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y2, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% title('Increase in detections for a detection radius of 15 Meters')
% xlabel('Detector Percentage')
% ylabel('Fraction of Population Detected')
% ylim([0 1])
% set(gca,'XTick', x)
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% saveas(gcf, 'udel-9056-700to730-outer-cells-DetectionWith15MRouterRad.pdf', 'pdf')

%% Inner Cell Detections
rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-FIXED-30MRad/3d-histo-percent.steps.detected.outer-30MRad.dat');
%rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-FIXED-ROUTER-30M/3d-histo-percent.steps.detected.outer-30MRad.dat');

% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
x = [1 2 3 4 5 10 25 50 75 100];
xgraph = [1 5 10 25 50 75 100];
% Get population count
popCount = length(rad) ./ length(x);

% Get bins for each radius
hist100 = hist(rad(1:popCount,1), [.05:.1:.95]);
hist75 = hist(rad(popCount+1:popCount*2,1), [.05:.1:.95]);
hist50 = hist(rad(popCount * 2 + 1:popCount * 3,1), [.05:.1:.95]);
hist25 = hist(rad(popCount * 3 + 1:popCount * 4,1), [.05:.1:.95]);
hist10 = hist(rad(popCount * 4 + 1:popCount * 5,1), [.05:.1:.95]);
hist5 = hist(rad(popCount * 5 + 1:popCount * 6,1), [.05:.1:.95]);
hist4 = hist(rad(popCount * 6 + 1:popCount * 7, 1), [.05:.1:.95]);
hist3 = hist(rad(popCount * 7 + 1:popCount * 8, 1), [.05:.1:.95]);
hist2 = hist(rad(popCount * 8 + 1:popCount * 9, 1), [.05:.1:.95]);
hist1 = hist(rad(popCount * 9 + 1:popCount * 10, 1), [.05:.1:.95]);

% yi10 = [(hist1(10)./popCount) (hist2(10)./popCount) (hist3(10)./popCount) (hist4(10)./popCount) (hist5(10)./popCount) (hist10(10)./popCount) (hist25(10)./popCount) (hist50(10)./popCount) (hist75(10)./popCount) (hist100(10)./popCount)];
% yi9 = [(hist1(9)./popCount) (hist2(9)./popCount) (hist3(9)./popCount) (hist4(9)./popCount) (hist5(9)./popCount) (hist10(9)./popCount) (hist25(9)./popCount) (hist50(9)./popCount) (hist75(9)./popCount) (hist100(9)./popCount)] + yi10;
% yi8 = [(hist1(8)./popCount) (hist2(8)./popCount) (hist3(8)./popCount) (hist4(8)./popCount) (hist5(8)./popCount) (hist10(8)./popCount) (hist25(8)./popCount) (hist50(8)./popCount) (hist75(8)./popCount) (hist100(8)./popCount)] + yi9;
% yi7 = [(hist1(7)./popCount) (hist2(7)./popCount) (hist3(7)./popCount) (hist4(7)./popCount) (hist5(7)./popCount) (hist10(7)./popCount) (hist25(7)./popCount) (hist50(7)./popCount) (hist75(7)./popCount) (hist100(7)./popCount)] + yi8;
% yi6 = [(hist1(6)./popCount) (hist2(6)./popCount) (hist3(6)./popCount) (hist4(6)./popCount) (hist5(6)./popCount) (hist10(6)./popCount) (hist25(6)./popCount) (hist50(6)./popCount) (hist75(6)./popCount) (hist100(6)./popCount)] + yi7;
% yi5 = [(hist1(5)./popCount) (hist2(5)./popCount) (hist3(5)./popCount) (hist4(5)./popCount) (hist5(5)./popCount) (hist10(5)./popCount) (hist25(5)./popCount) (hist50(5)./popCount) (hist75(5)./popCount) (hist100(5)./popCount)] + yi6;
% yi4 = [(hist1(4)./popCount) (hist2(4)./popCount) (hist3(4)./popCount) (hist4(4)./popCount) (hist5(4)./popCount) (hist10(4)./popCount) (hist25(4)./popCount) (hist50(4)./popCount) (hist75(4)./popCount) (hist100(4)./popCount)] + yi5;
% yi3 = [(hist1(3)./popCount) (hist2(3)./popCount) (hist3(3)./popCount) (hist4(3)./popCount) (hist5(3)./popCount) (hist10(3)./popCount) (hist25(3)./popCount) (hist50(3)./popCount) (hist75(3)./popCount) (hist100(3)./popCount)] + yi4;
% yi2 = [(hist1(2)./popCount) (hist2(2)./popCount) (hist3(2)./popCount) (hist4(2)./popCount) (hist5(2)./popCount) (hist10(2)./popCount) (hist25(2)./popCount) (hist50(2)./popCount) (hist75(2)./popCount) (hist100(2)./popCount)] + yi3;
% yi1 = [(hist1(1)./popCount) (hist2(1)./popCount) (hist3(1)./popCount) (hist4(1)./popCount) (hist5(1)./popCount) (hist10(1)./popCount) (hist25(1)./popCount) (hist50(1)./popCount) (hist75(1)./popCount) (hist100(1)./popCount)] + yi2;

yi10 = [(hist1(10)./popCount) (hist5(10)./popCount) (hist10(10)./popCount) (hist25(10)./popCount) (hist50(10)./popCount) (hist75(10)./popCount) (hist100(10)./popCount)];
yi9 = [(hist1(9)./popCount) (hist5(9)./popCount) (hist10(9)./popCount) (hist25(9)./popCount) (hist50(9)./popCount) (hist75(9)./popCount) (hist100(9)./popCount)] + yi10;
yi8 = [(hist1(8)./popCount) (hist5(8)./popCount) (hist10(8)./popCount) (hist25(8)./popCount) (hist50(8)./popCount) (hist75(8)./popCount) (hist100(8)./popCount)] + yi9;
yi7 = [(hist1(7)./popCount) (hist5(7)./popCount) (hist10(7)./popCount) (hist25(7)./popCount) (hist50(7)./popCount) (hist75(7)./popCount) (hist100(7)./popCount)] + yi8;
yi6 = [(hist1(6)./popCount) (hist5(6)./popCount) (hist10(6)./popCount) (hist25(6)./popCount) (hist50(6)./popCount) (hist75(6)./popCount) (hist100(6)./popCount)] + yi7;
yi5 = [(hist1(5)./popCount) (hist5(5)./popCount) (hist10(5)./popCount) (hist25(5)./popCount) (hist50(5)./popCount) (hist75(5)./popCount) (hist100(5)./popCount)] + yi6;
yi4 = [(hist1(4)./popCount) (hist5(4)./popCount) (hist10(4)./popCount) (hist25(4)./popCount) (hist50(4)./popCount) (hist75(4)./popCount) (hist100(4)./popCount)] + yi5;
yi3 = [(hist1(3)./popCount) (hist5(3)./popCount) (hist10(3)./popCount) (hist25(3)./popCount) (hist50(3)./popCount) (hist75(3)./popCount) (hist100(3)./popCount)] + yi4;
yi2 = [(hist1(2)./popCount) (hist5(2)./popCount) (hist10(2)./popCount) (hist25(2)./popCount) (hist50(2)./popCount) (hist75(2)./popCount) (hist100(2)./popCount)] + yi3;
yi1 = [(hist1(1)./popCount) (hist5(1)./popCount) (hist10(1)./popCount) (hist25(1)./popCount) (hist50(1)./popCount) (hist75(1)./popCount) (hist100(1)./popCount)] + yi2;


figure
%plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
%plot(x, y2, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
%plot(xgraph, y3, 'b.-', xgraph, yi3, 'b<-', xgraph, y6, 'kx-.', xgraph, yi6, 'k>-.', xgraph, y10, 'r+--', xgraph, yi10, 'ro-','Linewidth', 3);
plot(xgraph, y2, 'g+--', xgraph, yi2, 'go-', xgraph, y3, 'b--', xgraph, yi3, 'b<-', xgraph, y6, 'kx-.', xgraph, yi6, 'k>-', xgraph, y10, 'r+--', xgraph, yi10, 'ro-','Linewidth', 3);
%legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
%legend('> 10% of the time(outer)','> 10% of the time(inner)', '> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'NorthEast'); 
legend('> 10% of the time(15M)','> 10% of the time(30M)', '> 20% of the time(15M)', '> 20% of the time(30M)','> 50% of the time(15M)', '> 50% of the time(30M)','> 90% of the time(15M)','> 90% of the time(30M)','Location', 'SouthEast'); 

title('Increase in detections for a detection radius of 15/30 Meters in Chicago')
xlabel('Detector Percentage')
ylabel('Fraction of Population Detected')
ylim([0 1])
set(gca,'XTick', xgraph)
%legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
%legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
saveas(gcf, 'udel-9056-700to730-cells-DetectionWith15and30MRouterRad.pdf', 'pdf')

% %% Outer Both Detections
% 
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/1-100perc/both/3d-histo-percent.steps.detected.outer-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [1 2 3 4 5];
% 
% % Get population count
% popCount = length(rad) ./ length(x);
% 
% % Get bins for each radius
% hist5 = hist(rad(1:popCount,1), [.05:.1:.95]);
% hist4 = hist(rad(popCount+1:popCount*2, 1), [.05:.1:.95]);
% hist3 = hist(rad(popCount * 2 + 1:popCount * 3, 1), [.05:.1:.95]);
% hist2 = hist(rad(popCount * 3 + 1:popCount * 4, 1), [.05:.1:.95]);
% hist1 = hist(rad(popCount * 4 + 1:popCount * 5, 1), [.05:.1:.95]);
% 
% y10 = [(hist1(10)./popCount) (hist2(10)./popCount) (hist3(10)./popCount) (hist4(10)./popCount) (hist5(10)./popCount)];
% y9 = [(hist1(9)./popCount) (hist2(9)./popCount) (hist3(9)./popCount) (hist4(9)./popCount) (hist5(9)./popCount)] + y10;
% y8 = [(hist1(8)./popCount) (hist2(8)./popCount) (hist3(8)./popCount) (hist4(8)./popCount) (hist5(8)./popCount)] + y9;
% y7 = [(hist1(7)./popCount) (hist2(7)./popCount) (hist3(7)./popCount) (hist4(7)./popCount) (hist5(7)./popCount)] + y8;
% y6 = [(hist1(6)./popCount) (hist2(6)./popCount) (hist3(6)./popCount) (hist4(6)./popCount) (hist5(6)./popCount)] + y7;
% y5 = [(hist1(5)./popCount) (hist2(5)./popCount) (hist3(5)./popCount) (hist4(5)./popCount) (hist5(5)./popCount)] + y6;
% y4 = [(hist1(4)./popCount) (hist2(4)./popCount) (hist3(4)./popCount) (hist4(4)./popCount) (hist5(4)./popCount)] + y5;
% y3 = [(hist1(3)./popCount) (hist2(3)./popCount) (hist3(3)./popCount) (hist4(3)./popCount) (hist5(3)./popCount)] + y4;
% y2 = [(hist1(2)./popCount) (hist2(2)./popCount) (hist3(2)./popCount) (hist4(2)./popCount) (hist5(2)./popCount)] + y3;
% y1 = [(hist1(1)./popCount) (hist2(1)./popCount) (hist3(1)./popCount) (hist4(1)./popCount) (hist5(1)./popCount)] + y2;
% 
% % figure
% % %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% % %plot(x, y2, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% % title('Increase in detections for a detection radius of 15 Meters')
% % xlabel('Detector Percentage')
% % ylabel('Fraction of Population Detected')
% % ylim([0 1])
% % set(gca,'XTick', x)
% % %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% % %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% % saveas(gcf, 'udel-9056-700to730-outer-both-DetectionWith15MRouterRad.pdf', 'pdf')
% 
% %% Inner Both Detections
% 
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/1-100perc/both/3d-histo-percent.steps.detected.inner-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [1 2 3 4 5];
% 
% % Get population count
% popCount = length(rad) ./ length(x);
% 
% % Get bins for each radius
% hist5 = hist(rad(1:popCount,1), [.05:.1:.95]);
% hist4 = hist(rad(popCount+1:popCount*2, 1), [.05:.1:.95]);
% hist3 = hist(rad(popCount * 2 + 1:popCount * 3, 1), [.05:.1:.95]);
% hist2 = hist(rad(popCount * 3 + 1:popCount * 4, 1), [.05:.1:.95]);
% hist1 = hist(rad(popCount * 4 + 1:popCount * 5, 1), [.05:.1:.95]);
% 
% yi10 = [(hist1(10)./popCount) (hist2(10)./popCount) (hist3(10)./popCount) (hist4(10)./popCount) (hist5(10)./popCount)];
% yi9 = [(hist1(9)./popCount) (hist2(9)./popCount) (hist3(9)./popCount) (hist4(9)./popCount) (hist5(9)./popCount)] + yi10;
% yi8 = [(hist1(8)./popCount) (hist2(8)./popCount) (hist3(8)./popCount) (hist4(8)./popCount) (hist5(8)./popCount)] + yi9;
% yi7 = [(hist1(7)./popCount) (hist2(7)./popCount) (hist3(7)./popCount) (hist4(7)./popCount) (hist5(7)./popCount)] + yi8;
% yi6 = [(hist1(6)./popCount) (hist2(6)./popCount) (hist3(6)./popCount) (hist4(6)./popCount) (hist5(6)./popCount)] + yi7;
% yi5 = [(hist1(5)./popCount) (hist2(5)./popCount) (hist3(5)./popCount) (hist4(5)./popCount) (hist5(5)./popCount)] + yi6;
% yi4 = [(hist1(4)./popCount) (hist2(4)./popCount) (hist3(4)./popCount) (hist4(4)./popCount) (hist5(4)./popCount)] + yi5;
% yi3 = [(hist1(3)./popCount) (hist2(3)./popCount) (hist3(3)./popCount) (hist4(3)./popCount) (hist5(3)./popCount)] + yi4;
% yi2 = [(hist1(2)./popCount) (hist2(2)./popCount) (hist3(2)./popCount) (hist4(2)./popCount) (hist5(2)./popCount)] + yi3;
% yi1 = [(hist1(1)./popCount) (hist2(1)./popCount) (hist3(1)./popCount) (hist4(1)./popCount) (hist5(1)./popCount)] + yi2;
% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y2, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% 
% title('Increase in detections for a detection radius of 15 Meters')
% xlabel('Detector Percentage')
% ylabel('Fraction of Population Detected')
% ylim([0 1])
% set(gca,'XTick', x)
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% saveas(gcf, 'udel-9056-700to730-both-DetectionWith15MRouterRad.pdf', 'pdf')
