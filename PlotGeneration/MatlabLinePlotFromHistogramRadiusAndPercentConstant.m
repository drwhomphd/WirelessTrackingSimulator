%% Main
% 
% %% Outer Router Detections
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/1Perc-15MRad-700-730/routers/3d-histo-percent.steps.detected.outer-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [2000 4000 6000 9056 9139];
% 
% % This variable determines the split in our data between each population
% % value
% spots = 1;
% 
% for i = 1 : length(x)
%     for start = spots(i) : length(rad)
%         if rad(start,3) ~= x(i)
%             spots = [spots start];
%             break;
%         end
%     end
% end
% 
% % Get bins for each radius
% hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
% hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
% hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
% hist4 = hist(rad(spots(4):spots(5)-1,1), [.05:.1:.95]);
% hist5 = hist(rad(spots(5):length(rad),1), [.05:.1:.95]);
% pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):spots(5)-1,1)) length(rad(spots(5):length(rad),1))];
% 
% y10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) (hist5(10)./pop(5))];
% y9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) (hist5(9)./pop(5))] + y10;
% y8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) (hist5(8)./pop(5))] + y9;
% y7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) (hist5(7)./pop(5))] + y8;
% y6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) (hist5(6)./pop(5))] + y7;
% y5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) (hist5(5)./pop(5))] + y6;
% y4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) (hist5(4)./pop(5))] + y5;
% y3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) (hist5(3)./pop(5))] + y4;
% y2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) (hist5(2)./pop(5))] + y3;
% y1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) (hist5(1)./pop(5))] + y2;
% 
% %figure
% 
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y3, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% %plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% %title('Change in detections for 15M radius with 1% Detectors over Population')
% %xlabel('Population Size')
% %ylabel('Fraction of Population Detected')
% %ylim([0 1])
% %set(gca,'XTick', x)
% %legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% 
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% %saveas(gcf, 'udel-700to730-outer-router-Detection15MRouter1PercVarPopulation.pdf', 'pdf')
% 
% %% Inner Router Detections
% 
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/1Perc-15MRad-700-730/routers/3d-histo-percent.steps.detected.inner-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [2000 4000 6000 9056 9139];
% 
% % This variable determines the split in our data between each population
% % value
% spots = 1;
% 
% for i = 1 : length(x)
%     for start = spots(i) : length(rad)
%         if rad(start,3) ~= x(i)
%             spots = [spots start];
%             break;
%         end
%     end
% end
% 
% % Get bins for each radius
% hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
% hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
% hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
% hist4 = hist(rad(spots(4):spots(5)-1,1), [.05:.1:.95]);
% hist5 = hist(rad(spots(5):length(rad),1), [.05:.1:.95]);
% pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):spots(5)-1,1)) length(rad(spots(5):length(rad),1))];
% 
% yi10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) (hist5(10)./pop(5))];
% yi9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) (hist5(9)./pop(5))] + yi10;
% yi8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) (hist5(8)./pop(5))] + yi9;
% yi7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) (hist5(7)./pop(5))] + yi8;
% yi6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) (hist5(6)./pop(5))] + yi7;
% yi5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) (hist5(5)./pop(5))] + yi6;
% yi4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) (hist5(4)./pop(5))] + yi5;
% yi3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) (hist5(3)./pop(5))] + yi4;
% yi2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) (hist5(2)./pop(5))] + yi3;
% yi1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) (hist5(1)./pop(5))] + yi2;
% 
% 
% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y3, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% title('Change in detections for 15M radius with 1% Detectors over Population')
% xlabel('Population Size')
% ylabel('Fraction of Population Detected')
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% ylim([0 1])
% set(gca,'XTick', x)
% 
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% saveas(gcf, 'udel-700to730-router-Detection15MRouter1PercVarPopulation.pdf', 'pdf')

%% Outer Cell Detections
rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/10Perc-15MRad-VarPop/3d-histo-percent.steps.detected.outer-15MRad.dat');

% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
x = [2000 4000 6000 9056];

% This variable determines the split in our data between each population
% value
spots = 1;

for i = 1 : length(x)
    for start = spots(i) : length(rad)
        if rad(start,3) ~= x(i)
            spots = [spots start];
            break;
        end
    end
end

% Get bins for each radius
hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
hist4 = hist(rad(spots(4):length(rad)-1,1), [.05:.1:.95]);
%hist5 = hist(rad(spots(5):length(rad),1), [.05:.1:.95]);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))];

% y10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) (hist5(10)./pop(5))];
% y9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) (hist5(9)./pop(5))] + y10;
% y8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) (hist5(8)./pop(5))] + y9;
% y7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) (hist5(7)./pop(5))] + y8;
% y6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) (hist5(6)./pop(5))] + y7;
% y5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) (hist5(5)./pop(5))] + y6;
% y4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) (hist5(4)./pop(5))] + y5;
% y3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) (hist5(3)./pop(5))] + y4;
% y2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) (hist5(2)./pop(5))] + y3;
% y1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) (hist5(1)./pop(5))] + y2;

y10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) ];
y9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) ] + y10;
y8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) ] + y9;
y7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) ] + y8;
y6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) ] + y7;
y5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) ] + y6;
y4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) ] + y5;
y3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) ] + y4;
y2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) ] + y3;
y1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) ] + y2;

%figure
%plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
%plot(x, y3, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);%
%plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
%title('Change in detections for 15M radius with 1% Detectors over Population')
%xlabel('Population Size')
%ylabel('Fraction of Population Detected')
%ylim([0 1])
%set(gca,'XTick', x)
%legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 

%legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
%legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
%saveas(gcf, 'udel-700to730-outer-cells-Detection15MRouter1PercVarPopulation.pdf', 'pdf')

%% Inner Cell Detections

rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/10Perc-30MRad-VarPop/3d-histo-percent.steps.detected.outer-30MRad.dat');

% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
%x = [2000 4000 6000 9056];

% This variable determines the split in our data between each population
% value
spots = 1;

for i = 1 : length(x)
    for start = spots(i) : length(rad)
        if rad(start,3) ~= x(i)
            spots = [spots start];
            break;
        end
    end
end

% Get bins for each radius
hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
hist4 = hist(rad(spots(4):length(rad),1), [.05:.1:.95]);
%hist5 = hist(rad(spots(5):length(rad),1), [.05:.1:.95]);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))];

% yi10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) (hist5(10)./pop(5))];
% yi9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) (hist5(9)./pop(5))] + yi10;
% yi8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) (hist5(8)./pop(5))] + yi9;
% yi7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) (hist5(7)./pop(5))] + yi8;
% yi6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) (hist5(6)./pop(5))] + yi7;
% yi5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) (hist5(5)./pop(5))] + yi6;
% yi4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) (hist5(4)./pop(5))] + yi5;
% yi3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) (hist5(3)./pop(5))] + yi4;
% yi2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) (hist5(2)./pop(5))] + yi3;
% yi1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) (hist5(1)./pop(5))] + yi2;

yi10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) ];
yi9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) ] + yi10;
yi8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) ] + yi9;
yi7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) ] + yi8;
yi6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) ] + yi7;
yi5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) ] + yi6;
yi4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) ] + yi5;
yi3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) ] + yi4;
yi2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) ] + yi3;
yi1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) ] + yi2;

figure
%plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
%plot(x, y3, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
%plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
plot(x, y2, 'g+--', x, yi2, 'go-', x, y3, 'b.--', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
title('Change in detections for 15/30 Meter radius with 10% Detectors over Population')
xlabel('Population Size')
ylabel('Fraction of Population Detected')
ylim([0 1])
set(gca,'XTick', x)
%legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
legend('> 10% of the time(outer)','> 10% of the time(inner)', '> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'NorthWest'); 
legend('> 10% of the time(15M)','> 10% of the time(30M)', '> 20% of the time(15M)', '> 20% of the time(30M)','> 50% of the time(15M)', '> 50% of the time(30M)','> 90% of the time(15M)','> 90% of the time(30M)','Location', 'NorthWest'); 

%legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
%legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
saveas(gcf, 'udel-700to730-cells-Detection15and30MRouter10PercVarPopulation.pdf', 'pdf')

% %% Outer Both Detections
% 
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/1Perc-15MRad-700-730/both/3d-histo-percent.steps.detected.outer-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [2000 4000 6000 9056];
% 
% % This variable determines the split in our data between each population
% % value
% spots = 1;
% 
% for i = 1 : length(x)
%     for start = spots(i) : length(rad)
%         if rad(start,3) ~= x(i)
%             spots = [spots start];
%             break;
%         end
%     end
% end
% 
% % Get bins for each radius
% hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
% hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
% hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
% hist4 =hist(rad(spots(4):length(rad),1), [.05:.1:.95]);
% pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))];
% 
% y10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4))];
% y9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4))] + y10;
% y8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4))] + y9;
% y7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4))] + y8;
% y6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4))] + y7;
% y5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4))] + y6;
% y4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4))] + y5;
% y3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4))] + y4;
% y2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4))] + y3;
% y1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4))] + y2;
% 
% %figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %plot(x, y3, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% %plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% %title('Change in detections for 15M radius with 1% Detectors over Population')
% %xlabel('Population Size')
% %ylabel('Fraction of Population Detected')
% %ylim([0 1])
% %set(gca,'XTick', x)
% %legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% 
% %legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% %saveas(gcf, 'udel-700to730-outer-both-Detection15MRouter1PercVarPopulation.pdf', 'pdf')
% 
% %% Inner Both Detections
% 
% rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/1Perc-15MRad-700-730/both/3d-histo-percent.steps.detected.inner-15MRad.dat');
% 
% % The Y Coordinate is the percentage of the population that is detected
% % The X Coordinate is the radius
% % Each line is the percentage of steps detect
% % This means there will be at most 10 lines:
% % 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% % This means we will have one x, but 10 y's.
% x = [2000 4000 6000 9056 9139];
% 
% % This variable determines the split in our data between each population
% % value
% spots = 1;
% 
% for i = 1 : length(x)
%     for start = spots(i) : length(rad)
%         if rad(start,3) ~= x(i)
%             spots = [spots start];
%             break;
%         end
%     end
% end
% 
% % Get bins for each radius
% hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
% hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
% hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
% hist4 = hist(rad(spots(4):spots(5)-1,1), [.05:.1:.95]);
% hist5 = hist(rad(spots(5):length(rad),1), [.05:.1:.95]);
% pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):spots(5)-1,1)) length(rad(spots(5):length(rad),1))];
% 
% yi10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) (hist5(10)./pop(5))];
% yi9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) (hist5(9)./pop(5))] + yi10;
% yi8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) (hist5(8)./pop(5))] + yi9;
% yi7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) (hist5(7)./pop(5))] + yi8;
% yi6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) (hist5(6)./pop(5))] + yi7;
% yi5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) (hist5(5)./pop(5))] + yi6;
% yi4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) (hist5(4)./pop(5))] + yi5;
% yi3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) (hist5(3)./pop(5))] + yi4;
% yi2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) (hist5(2)./pop(5))] + yi3;
% yi1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) (hist5(1)./pop(5))] + yi2;
% figure
% %plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
% %%plot(x, y3, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
% plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
% title('Change in detections for 15M radius with 1% Detectors over Population')
% xlabel('Population Size')
% ylabel('Fraction of Population Detected')
% ylim([0 1])
% set(gca,'XTick', x)
% legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'Best'); 
% %%legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
% %legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')
% saveas(gcf, 'udel-700to730-both-Detection15MRouter1PercVarPopulation.pdf', 'pdf')
