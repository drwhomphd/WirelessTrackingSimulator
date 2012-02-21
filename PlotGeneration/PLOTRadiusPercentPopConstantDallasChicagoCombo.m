%% Main

%% Outer Cell Detections
rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/10Perc-15MRad-9056/cells/3d-histo-percent.steps.detected.outer-15MRad.dat');
%rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/dallas-10Perc-15MRad-4000/cells/3d-histo-percent.steps.detected.outer-15MRad.dat');
rad = sortrows(rad,3);
% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
x = [100 300 500 700 900 1100 1300 1500 1700 1900 2100 2300];

% This variable determines the split in our data between each population
% value
spots = [];

for i = 1 : length(x)
    tmp = find(rad(:,3) == x(i));
    start = tmp(1);
    spots = [spots start];
end

% Get bins for each radius
hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
hist4 =hist(rad(spots(4):spots(5)-1,1), [.05:.1:.95]);
hist5 =hist(rad(spots(5):spots(6)-1,1), [.05:.1:.95]);
hist6 =hist(rad(spots(6):spots(7)-1,1), [.05:.1:.95]);
hist7 =hist(rad(spots(7):spots(8)-1,1), [.05:.1:.95]);
hist8 =hist(rad(spots(8):spots(9)-1,1), [.05:.1:.95]);
hist9 =hist(rad(spots(9):spots(10)-1,1), [.05:.1:.95]);
hist10 =hist(rad(spots(10):spots(11)-1,1), [.05:.1:.95]);
hist11 =hist(rad(spots(11):spots(12)-1,1), [.05:.1:.95]);
hist12 =hist(rad(spots(12):length(rad),1), [.05:.1:.95]);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):spots(5)-1,1)) length(rad(spots(5):spots(6)-1,1)) length(rad(spots(6):spots(7)-1,1)) length(rad(spots(7):spots(8)-1,1)) length(rad(spots(8):spots(9)-1,1)) length(rad(spots(9):spots(10)-1,1)) length(rad(spots(10):spots(11)-1,1)) length(rad(spots(11):spots(12)-1,1)) length(rad(spots(12):length(rad),1))];
y10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) (hist5(10)./pop(5)) (hist6(10)./pop(6)) (hist7(10)./pop(7)) (hist8(10)./pop(8)) (hist9(10)./pop(9)) (hist10(10)./pop(10)) (hist11(10)./pop(11)) (hist12(10)./pop(12))];
y9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) (hist5(9)./pop(5)) (hist6(9)./pop(6)) (hist7(9)./pop(7)) (hist8(9)./pop(8)) (hist9(9)./pop(9)) (hist10(9)./pop(10)) (hist11(9)./pop(11)) (hist12(9)./pop(12))] + y10;
y8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) (hist5(8)./pop(5)) (hist6(8)./pop(6)) (hist7(8)./pop(7)) (hist8(8)./pop(8)) (hist9(8)./pop(9)) (hist10(8)./pop(10)) (hist11(8)./pop(11)) (hist12(8)./pop(12))] + y9;
y7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) (hist5(7)./pop(5)) (hist6(7)./pop(6)) (hist7(7)./pop(7)) (hist8(7)./pop(8)) (hist9(7)./pop(9)) (hist10(7)./pop(10)) (hist11(7)./pop(11)) (hist12(7)./pop(12))] + y8;
y6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) (hist5(6)./pop(5)) (hist6(6)./pop(6)) (hist7(6)./pop(7)) (hist8(6)./pop(8)) (hist9(6)./pop(9)) (hist10(6)./pop(10)) (hist11(6)./pop(11)) (hist12(6)./pop(12))] + y7;
y5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) (hist5(5)./pop(5)) (hist6(5)./pop(6)) (hist7(5)./pop(7)) (hist8(5)./pop(8)) (hist9(5)./pop(9)) (hist10(5)./pop(10)) (hist11(5)./pop(11)) (hist12(5)./pop(12))] + y6;
y4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) (hist5(4)./pop(5)) (hist6(4)./pop(6)) (hist7(4)./pop(7)) (hist8(4)./pop(8)) (hist9(4)./pop(9)) (hist10(4)./pop(10)) (hist11(4)./pop(11)) (hist12(4)./pop(12))] + y5;
y3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) (hist5(3)./pop(5)) (hist6(3)./pop(6)) (hist7(3)./pop(7)) (hist8(3)./pop(8)) (hist9(3)./pop(9)) (hist10(3)./pop(10)) (hist11(3)./pop(11)) (hist12(3)./pop(12))] + y4;
y2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) (hist5(2)./pop(5)) (hist6(2)./pop(6)) (hist7(2)./pop(7)) (hist8(2)./pop(8)) (hist9(2)./pop(9)) (hist10(2)./pop(10)) (hist11(2)./pop(11)) (hist12(2)./pop(12))] + y3;
y1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) (hist5(1)./pop(5)) (hist6(1)./pop(6)) (hist7(1)./pop(7)) (hist8(1)./pop(8)) (hist9(1)./pop(9)) (hist10(1)./pop(10)) (hist11(1)./pop(11)) (hist12(1)./pop(12))] + y2;

%% Inner Cell Detections

rad = load('/home/nhusted/research/samyers/Wireless-Tracking/Statistics/udel-statistics/dallas-10Perc-15MRad-9056/cells/3d-histo-percent.steps.detected.outer-15MRad.dat');
rad = sortrows(rad,3);

% The Y Coordinate is the percentage of the population that is detected
% The X Coordinate is the radius
% Each line is the percentage of steps detect
% This means there will be at most 10 lines:
% 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
% This means we will have one x, but 10 y's.
x = [100 300 500 700 900 1100 1300 1500 1700 1900 2100 2300];

% This variable determines the split in our data between each population
% value
spots = [];

for i = 1 : length(x)
    tmp = find(rad(:,3) == x(i));
    start = tmp(1);
    spots = [spots start];
end

% Get bins for each radius
hist1 = hist(rad(1:spots(2)-1,1), [.05:.1:.95]);
hist2 = hist(rad(spots(2):spots(3)-1,1), [.05:.1:.95]);
hist3 = hist(rad(spots(3):spots(4)-1,1), [.05:.1:.95]);
hist4 =hist(rad(spots(4):spots(5)-1,1), [.05:.1:.95]);
hist5 =hist(rad(spots(5):spots(6)-1,1), [.05:.1:.95]);
hist6 =hist(rad(spots(6):spots(7)-1,1), [.05:.1:.95]);
hist7 =hist(rad(spots(7):spots(8)-1,1), [.05:.1:.95]);
hist8 =hist(rad(spots(8):spots(9)-1,1), [.05:.1:.95]);
hist9 =hist(rad(spots(9):spots(10)-1,1), [.05:.1:.95]);
hist10 =hist(rad(spots(10):spots(11)-1,1), [.05:.1:.95]);
hist11 =hist(rad(spots(11):spots(12)-1,1), [.05:.1:.95]);
hist12 =hist(rad(spots(12):length(rad),1), [.05:.1:.95]);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):spots(5)-1,1)) length(rad(spots(5):spots(6)-1,1)) length(rad(spots(6):spots(7)-1,1)) length(rad(spots(7):spots(8)-1,1)) length(rad(spots(8):spots(9)-1,1)) length(rad(spots(9):spots(10)-1,1)) length(rad(spots(10):spots(11)-1,1)) length(rad(spots(11):spots(12)-1,1)) length(rad(spots(12):length(rad),1))];
yi10 = [(hist1(10)./pop(1)) (hist2(10)./pop(2)) (hist3(10)./pop(3)) (hist4(10)./pop(4)) (hist5(10)./pop(5)) (hist6(10)./pop(6)) (hist7(10)./pop(7)) (hist8(10)./pop(8)) (hist9(10)./pop(9)) (hist10(10)./pop(10)) (hist11(10)./pop(11)) (hist12(10)./pop(12))];
yi9 = [(hist1(9)./pop(1)) (hist2(9)./pop(2)) (hist3(9)./pop(3)) (hist4(9)./pop(4)) (hist5(9)./pop(5)) (hist6(9)./pop(6)) (hist7(9)./pop(7)) (hist8(9)./pop(8)) (hist9(9)./pop(9)) (hist10(9)./pop(10)) (hist11(9)./pop(11)) (hist12(9)./pop(12))] + yi10;
yi8 = [(hist1(8)./pop(1)) (hist2(8)./pop(2)) (hist3(8)./pop(3)) (hist4(8)./pop(4)) (hist5(8)./pop(5)) (hist6(8)./pop(6)) (hist7(8)./pop(7)) (hist8(8)./pop(8)) (hist9(8)./pop(9)) (hist10(8)./pop(10)) (hist11(8)./pop(11)) (hist12(8)./pop(12))] + yi9;
yi7 = [(hist1(7)./pop(1)) (hist2(7)./pop(2)) (hist3(7)./pop(3)) (hist4(7)./pop(4)) (hist5(7)./pop(5)) (hist6(7)./pop(6)) (hist7(7)./pop(7)) (hist8(7)./pop(8)) (hist9(7)./pop(9)) (hist10(7)./pop(10)) (hist11(7)./pop(11)) (hist12(7)./pop(12))] + yi8;
yi6 = [(hist1(6)./pop(1)) (hist2(6)./pop(2)) (hist3(6)./pop(3)) (hist4(6)./pop(4)) (hist5(6)./pop(5)) (hist6(6)./pop(6)) (hist7(6)./pop(7)) (hist8(6)./pop(8)) (hist9(6)./pop(9)) (hist10(6)./pop(10)) (hist11(6)./pop(11)) (hist12(6)./pop(12))] + yi7;
yi5 = [(hist1(5)./pop(1)) (hist2(5)./pop(2)) (hist3(5)./pop(3)) (hist4(5)./pop(4)) (hist5(5)./pop(5)) (hist6(5)./pop(6)) (hist7(5)./pop(7)) (hist8(5)./pop(8)) (hist9(5)./pop(9)) (hist10(5)./pop(10)) (hist11(5)./pop(11)) (hist12(5)./pop(12))] + yi6;
yi4 = [(hist1(4)./pop(1)) (hist2(4)./pop(2)) (hist3(4)./pop(3)) (hist4(4)./pop(4)) (hist5(4)./pop(5)) (hist6(4)./pop(6)) (hist7(4)./pop(7)) (hist8(4)./pop(8)) (hist9(4)./pop(9)) (hist10(4)./pop(10)) (hist11(4)./pop(11)) (hist12(4)./pop(12))] + yi5;
yi3 = [(hist1(3)./pop(1)) (hist2(3)./pop(2)) (hist3(3)./pop(3)) (hist4(3)./pop(4)) (hist5(3)./pop(5)) (hist6(3)./pop(6)) (hist7(3)./pop(7)) (hist8(3)./pop(8)) (hist9(3)./pop(9)) (hist10(3)./pop(10)) (hist11(3)./pop(11)) (hist12(3)./pop(12))] + yi4;
yi2 = [(hist1(2)./pop(1)) (hist2(2)./pop(2)) (hist3(2)./pop(3)) (hist4(2)./pop(4)) (hist5(2)./pop(5)) (hist6(2)./pop(6)) (hist7(2)./pop(7)) (hist8(2)./pop(8)) (hist9(2)./pop(9)) (hist10(2)./pop(10)) (hist11(2)./pop(11)) (hist12(2)./pop(12))] + yi3;
yi1 = [(hist1(1)./pop(1)) (hist2(1)./pop(2)) (hist3(1)./pop(3)) (hist4(1)./pop(4)) (hist5(1)./pop(5)) (hist6(1)./pop(6)) (hist7(1)./pop(7)) (hist8(1)./pop(8)) (hist9(1)./pop(9)) (hist10(1)./pop(10)) (hist11(1)./pop(11)) (hist12(1)./pop(12))] + yi2;

figure

%plot(x, y2, x, y3, x, y4, x, y5, x, y6, x, y7, x, y8, x, y9, x, y10);
%plot(x, y3, 'b.-', x, y6, 'kx-.', x, y8, 'cs-', x, y10, 'r+--','Linewidth', 3);
%plot(x, y3, 'b.-', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-.', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);

plot(x, y2, 'g+--', x, yi2, 'go-', x, y3, 'b.--', x, yi3, 'b<-', x, y6, 'kx-.', x, yi6, 'k>-', x, y10, 'r+--', x, yi10, 'ro-','Linewidth', 3);
title('Change in detections for 9056 Pedestrians, 15M Radius, 10% Detectors')
xlabel('Time of Day (h)')
ylabel('Fraction of Population Detected')
ylim([0 1])
set(gca,'XTick', x)
legend('> 10% of the time(Chicago)','> 10% of the time(Dallas)', '> 20% of the time(Chicago)', '> 20% of the time(Dallas)','> 50% of the time(Chicago)', '> 50% of the time(Dallas)','> 90% of the time(Chicago)','> 90% of the time(Dallas)','Location', 'NorthEast'); 

%legend('> 20% of the time(outer)', '> 20% of the time(inner)','> 50% of the time(outer)', '> 50% of the time(inner)','> 90% of the time(outer)','> 90% of the time(inner)','Location', 'NorthEast'); 
%legend('> 20% of the time', '> 50% of the time', '> 70% of the time', '> 90% of the time', 'Location', 'Best');
%legend('>10% of the time','>20% of the time', '>30% of the time', '>40% of the time', '>50% of the time', '>60% of the time', '>70% of the time', '>80% of the time', '>90% of the time', 'Location', 'NorthWest')

saveas(gcf, 'ChicagoAndDallas-udel-9056Peds-cells-Detection15MRouter10PercVarTime.pdf', 'pdf')
