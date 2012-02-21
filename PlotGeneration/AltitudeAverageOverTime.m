clear;
clc;
reset(gcf);

% 
% files = {'9Blk-4000Peds0Cars-100-130-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-300-330-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-500-530-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-700-730-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-900-930-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-1100-1130-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-1300-1330-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-1500-1530-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-1700-1730-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-1900-1930-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-2100-2130-Trial1.alt.out', ...
%     '9Blk-4000Peds0Cars-2300-2330-Trial1.alt.out'    
%     };

% files = {'9Blk-50Peds325Cars-100-1200.alt.out', ...
%     '9Blk-50Peds325Cars-1200-2300.alt.out'};

files = {'9Blk-250Peds0Cars-100-2300.alt.out'};

% Y-axis values]
%Y2 = zeros(1, (24*60*60));
Y2 = zeros(1, 60*60);
P2 = zeros(1, 60*60);
SE2 = zeros(1, 60*60);
MAX2 = zeros(1, 60*60);

Yarr = {};
Parr = {};

% X-axis values
% We'll set this to a full day in seconds
X2 = 1:(24*60*60);

for j = 1 : length(files)
    
    fileName = files{j};
    
    % Load the data file
    alt = load(fileName);
    
    alt = alt(find(alt(:,1) > 0), :);

    % Get the maximum time
    maxTime = max(alt(:,2));


    % X-axis values
    timeValues = 1 : maxTime + 1;

    % Y-axis values
    Y = [];
    
    P = [];

    % Standard Error values
    SE = [];
    
    MAX = [];

    %figure;
    
    % Loop through each time period and generate a graph file
    for i = 0 : maxTime  

        % Get current agent indicies
        curAgents = find(alt(:,2) == i);

        % Get all agents' altitudes at the current time
        curAlt = alt(curAgents, 1);

        % Set Y value for this iteration
        Y = [Y mean(curAlt)];
        
        P = [P length(curAgents)];
        
        %SE = [SE (std(curAlt) / sqrt(length(curAlt)))];
        SE = [SE (std(curAlt))];
        
        MAX = [MAX (max(curAlt))];

    end
    Yarr = cat(1, Yarr, Y);
    Parr = cat(1, Parr, P);

    padding = zeros(1,30*60*3);
    %padding = 0;
    Y2 = [Y2 Y padding];
    P2 = [P2 P padding];
    SE2 = [SE2 SE padding];
    MAX2 = [MAX2 MAX padding];
    
    % generate the CDF graph
    %grid on;

    % Plot graph
    %errorbar(timeValues,Y, SE);
    %plot(timeValues,Y)
    %title('Change in mean altitude over time');
    %ylim('manual');
    %ylim([0, 50]);
    %ylabel('Mean Altitude (m)');
    %xlabel('Time(s)');

end

X2 = 1:(length(Y2));

pE1 = Y2 + (SE2);
pE2 = Y2 + 2*(SE2);
pE3 = Y2 + 3*(SE2);
nE1 = Y2 - (SE2);
nE2 = Y2 - 2*(SE2);
nE3 = Y2 - 3*(SE2);

plot(X2, Y2, 'k', X2, pE1, 'r', X2, nE1, 'r', X2, pE2, 'g', X2, nE2, 'g', X2, pE3, 'b', X2, nE3, 'b', X2, MAX2, 'm');

xlabel('Time of day');
ylabel('Altitude(m)');

XTicks = 0:3600:24*3600;
set(gca, 'XTick', XTicks);
XTickLabels = '0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23';
set(gca, 'XTickLabel', XTickLabels);

% Handle to first set of axis
%h1 = gca;
% Handle to the 2nd set of axis
%h2 = axes('Position',get(h1,'Position'));
 
%plot(X2, P2, 'r');

% % Move axis to the right side
%set(h2,'YAxisLocation','right','Color','none','XTickLabel',[])
%set(h2,'XLim',get(h1,'XLim'),'Layer','top')
%ylabel('Population Count') 
 
title('Average Population Over Time -- Red = 1SD; Green = 2SD; Blue = 3SD; Magenta = MAX; Black = Mean')
 

 
