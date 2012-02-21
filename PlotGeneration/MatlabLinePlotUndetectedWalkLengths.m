rad15 = load('15M-10Perc-Trial1.dat');
rad30 = load('30M-10Perc-Trial1.dat');
rad45 = load('45M-10Perc-Trial1.dat');
x = [1 2 3 4 5 10 25 50 75 100];
xgraph = [1 5 10 25 50 75 100];

figure
hold on

plot(x, rad15(:,5), 'b*-', x, rad30(:,5), 'r>-', x, rad45(:,5), 'gp-', 'LineWidth', 3)
%e1 = errorbar(x, rad15(:,5), rad15(:,4), 'b*-', 'LineWidth', 3)
%e2 = errorbar(x, rad30(:,5), rad15(:,4), 'r>-', 'LineWidth', 3)
%e3 = errorbar(x, rad45(:,5), rad45(:,4), 'gp-', 'LineWidth', 3)
legend('15M Radius (outer)', '30M Radius (outer)', '45M Radius (outer)')
xlabel('Detector Percentage')
ylabel('Time (Seconds)')
title('Mean duration of undetected walks in Chicago.')
set(gca,'XTick', xgraph)
saveas(gcf, 'udel-9056-700to730-MeanUndetectedWalkLengths.pdf')