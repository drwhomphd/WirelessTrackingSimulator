%% Main

%% Outer Router Detections
% Load in the data
% rad45 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/routers/3d-histo-percent.steps.detected.outer-45MRad.dat');
% rad15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/routers/3d-histo-percent.steps.detected.outer-15MRad.dat');
% rad30 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/routers/3d-histo-percent.steps.detected.outer-30MRad.dat');
% 
% % Get population count
% popCount = length(rad45);
% 
% % Get bins for each radius
% hist45 = hist(rad45(:,1), [.05:.1:.95]);
% hist30 = hist(rad30(:,1), [.05:.1:.95]);
% hist15 = hist(rad15(:,1), [.05:.1:.95]);
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [15 30 45];
% 
% y10 = [(hist15(10)./popCount) (hist30(10)./popCount) (hist45(10)./popCount)];
% y9 = [(hist15(9)./popCount) (hist30(9)./popCount) (hist45(9)./popCount)] + y10;
% y8 = [(hist15(8)./popCount) (hist30(8)./popCount) (hist45(8)./popCount)] + y9;
% y7 = [(hist15(7)./popCount) (hist30(7)./popCount) (hist45(7)./popCount)] + y8;
% y6 = [(hist15(6)./popCount) (hist30(6)./popCount) (hist45(6)./popCount)] + y7;
% y5 = [(hist15(5)./popCount) (hist30(5)./popCount) (hist45(5)./popCount)] + y6;
% y4 = [(hist15(4)./popCount) (hist30(4)./popCount) (hist45(4)./popCount)] + y5;
% y3 = [(hist15(3)./popCount) (hist30(3)./popCount) (hist45(3)./popCount)] + y4;
% y2 = [(hist15(2)./popCount) (hist30(2)./popCount) (hist45(2)./popCount)] + y3;
% y1 = [(hist15(1)./popCount) (hist30(1)./popCount) (hist45(1)./popCount)] + y2;
% 
% 
% % figure
% % %plot(x, y1, x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% % %plot(x, y2, 'b.-', x, y5, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% % title('Increase in detections for a population with 1% detectors')
% % xlabel('Router Detection Radius(m)')
% % ylabel('Fraction of Population Detected')
% % 
% % v = axis;
% % v(3) = 0;
% % v(4) = 1;
% % axis(v);
% % set(gca,'XTick', x);
% % 
% % %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% % %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% % saveas(gcf, 'udel-9056-700to730-outer-router-DetectionWith10percDetectors.pdf', 'pdf')
% 
% %% Inner Router Detections
% % Load in the data
% rad45 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/routers/3d-histo-percent.steps.detected.inner-45MRad.dat');
% rad15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/routers/3d-histo-percent.steps.detected.inner-15MRad.dat');
% rad30 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/routers/3d-histo-percent.steps.detected.inner-30MRad.dat');
% 
% % Get population count
% popCount = length(rad45);
% 
% % Get bins for each radius
% hist45 = hist(rad45(:,1), [.05:.1:.95]);
% hist30 = hist(rad30(:,1), [.05:.1:.95]);
% hist15 = hist(rad15(:,1), [.05:.1:.95]);
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [15 30 45];
% 
% yi10 = [(hist15(10)./popCount) (hist30(10)./popCount) (hist45(10)./popCount)];
% yi9 = [(hist15(9)./popCount) (hist30(9)./popCount) (hist45(9)./popCount)] + yi10;
% yi8 = [(hist15(8)./popCount) (hist30(8)./popCount) (hist45(8)./popCount)] + yi9;
% yi7 = [(hist15(7)./popCount) (hist30(7)./popCount) (hist45(7)./popCount)] + yi8;
% yi6 = [(hist15(6)./popCount) (hist30(6)./popCount) (hist45(6)./popCount)] + yi7;
% yi5 = [(hist15(5)./popCount) (hist30(5)./popCount) (hist45(5)./popCount)] + yi6;
% yi4 = [(hist15(4)./popCount) (hist30(4)./popCount) (hist45(4)./popCount)] + yi5;
% yi3 = [(hist15(3)./popCount) (hist30(3)./popCount) (hist45(3)./popCount)] + yi4;
% yi2 = [(hist15(2)./popCount) (hist30(2)./popCount) (hist45(2)./popCount)] + yi3;
% yi1 = [(hist15(1)./popCount) (hist30(1)./popCount) (hist45(1)./popCount)] + yi2;
% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y2, 'b.-', x, y5, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% 
% plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% 
% title('Increase in detections for a population with 1% detectors')
% xlabel('Router Detection Radius(m)')
% ylabel('Fraction of Population Detected')
% v = axis;
% v(3) = 0;
% v(4) = 1;
% axis(v);
% set(gca,'XTick', x)
% 
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% saveas(gcf, 'udel-9056-700to730-router-DetectionWith10percDetectors.pdf', 'pdf')

%% Outer Cell Detections
% Load in the data
rad45 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-SELFDETECT-FIXED-radius/3d-histo-percent.steps.detected.outer-45MRad.dat');
rad15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-SELFDETECT-FIXED-radius/3d-histo-percent.steps.detected.outer-15MRad.dat');
rad30 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-SELFDETECT-FIXED-radius/3d-histo-percent.steps.detected.outer-30MRad.dat');

% Get population count
popCount = length(rad45);

% Get bins for each radius
hist45 = hist(rad45(:,1), [.05:.1:.95]);
hist30 = hist(rad30(:,1), [.05:.1:.95]);
hist15 = hist(rad15(:,1), [.05:.1:.95]);

% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
x = [15 30 45];

y10 = [(hist15(10)./popCount) (hist30(10)./popCount) (hist45(10)./popCount)];
y9 = [(hist15(9)./popCount) (hist30(9)./popCount) (hist45(9)./popCount)] + y10;
y8 = [(hist15(8)./popCount) (hist30(8)./popCount) (hist45(8)./popCount)] + y9;
y7 = [(hist15(7)./popCount) (hist30(7)./popCount) (hist45(7)./popCount)] + y8;
y6 = [(hist15(6)./popCount) (hist30(6)./popCount) (hist45(6)./popCount)] + y7;
y5 = [(hist15(5)./popCount) (hist30(5)./popCount) (hist45(5)./popCount)] + y6;
y4 = [(hist15(4)./popCount) (hist30(4)./popCount) (hist45(4)./popCount)] + y5;
y3 = [(hist15(3)./popCount) (hist30(3)./popCount) (hist45(3)./popCount)] + y4;
y2 = [(hist15(2)./popCount) (hist30(2)./popCount) (hist45(2)./popCount)] + y3;
y1 = [(hist15(1)./popCount) (hist30(1)./popCount) (hist45(1)./popCount)] + y2;

% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y2, 'b.-', x, y5, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% title('Increase in detections for a population with 1% detectors')
% xlabel('Cell Detection Radius(m)')
% ylabel('Fraction of Population Detected')
% v = axis;
% v(3) = 0;
% v(4) = 1;
% axis(v);
% set(gca,'XTick', x)
% 
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% saveas(gcf, 'udel-9056-700to730-outer-cells-DetectionWith10percDetectors.pdf', 'pdf')

%% Inner Cell Detections
% Load in the data
rad45 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-SELFDETECT-FIXED-radius/3d-histo-percent.steps.detected.inner-45MRad.dat');
rad15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-SELFDETECT-FIXED-radius/3d-histo-percent.steps.detected.inner-15MRad.dat');
rad30 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730-SELFDETECT-FIXED-radius/3d-histo-percent.steps.detected.inner-30MRad.dat');

% Get population count
popCount = length(rad45);

% Get bins for each radius
hist45 = hist(rad45(:,1), [.05:.1:.95]);
hist30 = hist(rad30(:,1), [.05:.1:.95]);
hist15 = hist(rad15(:,1), [.05:.1:.95]);

% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
x = [15 30 45];

yi10 = [(hist15(10)./popCount) (hist30(10)./popCount) (hist45(10)./popCount)];
yi9 = [(hist15(9)./popCount) (hist30(9)./popCount) (hist45(9)./popCount)] + yi10;
yi8 = [(hist15(8)./popCount) (hist30(8)./popCount) (hist45(8)./popCount)] + yi9;
yi7 = [(hist15(7)./popCount) (hist30(7)./popCount) (hist45(7)./popCount)] + yi8;
yi6 = [(hist15(6)./popCount) (hist30(6)./popCount) (hist45(6)./popCount)] + yi7;
yi5 = [(hist15(5)./popCount) (hist30(5)./popCount) (hist45(5)./popCount)] + yi6;
yi4 = [(hist15(4)./popCount) (hist30(4)./popCount) (hist45(4)./popCount)] + yi5;
yi3 = [(hist15(3)./popCount) (hist30(3)./popCount) (hist45(3)./popCount)] + yi4;
yi2 = [(hist15(2)./popCount) (hist30(2)./popCount) (hist45(2)./popCount)] + yi3;
yi1 = [(hist15(1)./popCount) (hist30(1)./popCount) (hist45(1)./popCount)] + yi2;
figure
%plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
%plot(x, y2, 'b.-', x, y5, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);

%plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
%legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
plot(x, y2, 'g+--', x, yi2, 'go-', x, y3, 'b--', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
legend('> 10% of the time(outer)','> 10% of the time(inner)', '> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'NorthEast'); 

title('Increase in detections for a population with 1% detectors')
xlabel('Cell Detection Radius(m)')
ylabel('Fraction of Population Detected')
v = axis;
v(3) = 0;
v(4) = 1;
axis(v);
set(gca,'XTick', x)

%legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
%legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
saveas(gcf, 'udel-9056-700to730-cells-DetectionWith1percDetectors.pdf', 'pdf')

% %% Outer Both Detections
% % Load in the data
% rad45 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/both/3d-histo-percent.steps.detected.outer-45MRad.dat');
% rad15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/both/3d-histo-percent.steps.detected.outer-15MRad.dat');
% rad30 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/both/3d-histo-percent.steps.detected.outer-30MRad.dat');
% 
% % Get population count
% popCount = length(rad45);
% 
% % Get bins for each radius
% hist45 = hist(rad45(:,1), [.05:.1:.95]);
% hist30 = hist(rad30(:,1), [.05:.1:.95]);
% hist15 = hist(rad15(:,1), [.05:.1:.95]);
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [15 30 45];
% 
% y10 = [(hist15(10)./popCount) (hist30(10)./popCount) (hist45(10)./popCount)];
% y9 = [(hist15(9)./popCount) (hist30(9)./popCount) (hist45(9)./popCount)] + y10;
% y8 = [(hist15(8)./popCount) (hist30(8)./popCount) (hist45(8)./popCount)] + y9;
% y7 = [(hist15(7)./popCount) (hist30(7)./popCount) (hist45(7)./popCount)] + y8;
% y6 = [(hist15(6)./popCount) (hist30(6)./popCount) (hist45(6)./popCount)] + y7;
% y5 = [(hist15(5)./popCount) (hist30(5)./popCount) (hist45(5)./popCount)] + y6;
% y4 = [(hist15(4)./popCount) (hist30(4)./popCount) (hist45(4)./popCount)] + y5;
% y3 = [(hist15(3)./popCount) (hist30(3)./popCount) (hist45(3)./popCount)] + y4;
% y2 = [(hist15(2)./popCount) (hist30(2)./popCount) (hist45(2)./popCount)] + y3;
% y1 = [(hist15(1)./popCount) (hist30(1)./popCount) (hist45(1)./popCount)] + y2;
% %figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y2, 'b.-', x, y5, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% %title('Increase in detections for a population with 1% detectors')
% %xlabel('Cell and Router Detection Radius(m)')
% %ylabel('Fraction of Population Detected')
% %v = axis;
% %v(3) = 0;
% %v(4) = 1;
% %axis(v);
% %set(gca,'XTick', x)
% 
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% %saveas(gcf, 'udel-9056-700to730-outer-both-DetectionWith10percDetectors.pdf', 'pdf')
% 
% %% Inner Both Detections
% % Load in the data
% rad45 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/both/3d-histo-percent.steps.detected.inner-45MRad.dat');
% rad15 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/both/3d-histo-percent.steps.detected.inner-15MRad.dat');
% rad30 = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/9056-700-730/10perc/both/3d-histo-percent.steps.detected.inner-30MRad.dat');
% 
% % Get population count
% popCount = length(rad45);
% 
% % Get bins for each radius
% hist45 = hist(rad45(:,1), [.05:.1:.95]);
% hist30 = hist(rad30(:,1), [.05:.1:.95]);
% hist15 = hist(rad15(:,1), [.05:.1:.95]);
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [15 30 45];
% 
% yi10 = [(hist15(10)./popCount) (hist30(10)./popCount) (hist45(10)./popCount)];
% yi9 = [(hist15(9)./popCount) (hist30(9)./popCount) (hist45(9)./popCount)] + yi10;
% yi8 = [(hist15(8)./popCount) (hist30(8)./popCount) (hist45(8)./popCount)] + yi9;
% yi7 = [(hist15(7)./popCount) (hist30(7)./popCount) (hist45(7)./popCount)] + yi8;
% yi6 = [(hist15(6)./popCount) (hist30(6)./popCount) (hist45(6)./popCount)] + yi7;
% yi5 = [(hist15(5)./popCount) (hist30(5)./popCount) (hist45(5)./popCount)] + yi6;
% yi4 = [(hist15(4)./popCount) (hist30(4)./popCount) (hist45(4)./popCount)] + yi5;
% yi3 = [(hist15(3)./popCount) (hist30(3)./popCount) (hist45(3)./popCount)] + yi4;
% yi2 = [(hist15(2)./popCount) (hist30(2)./popCount) (hist45(2)./popCount)] + yi3;
% yi1 = [(hist15(1)./popCount) (hist30(1)./popCount) (hist45(1)./popCount)] + yi2;
% 
% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y2, 'b.-', x, y5, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% 
% plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% 
% title('Increase in detections for a population with 1% detectors')
% xlabel('Cell and Router Detection Radius(m)')
% ylabel('Fraction of Population Detected')
% v = axis;
% v(3) = 0;
% v(4) = 1;
% axis(v);
% set(gca,'XTick', x)
% 
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% saveas(gcf, 'udel-9056-700to730-both-DetectionWith10percDetectors.pdf', 'pdf')
