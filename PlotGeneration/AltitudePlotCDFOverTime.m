clear;
clc;
reset(gcf);
maxNumCompThreads(7);

handle = figure('Visible', 'off');

files = {'9Blk-4000Peds0Cars-100-130-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-1100-1130-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-1300-1330-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-1500-1530-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-1700-1730-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-1900-1930-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-2100-2130-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-2300-2330-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-300-330-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-500-530-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-700-730-Trial1.alt.out', ...
    '9Blk-4000Peds0Cars-900-930-Trial1.alt.out'};


for j = 1 : length(files)
    
    fileName = files{j};
    
    % Load the data file
    alt = load(fileName);

    % Get the maximum time
    maxTime = max(alt(:,2));

    sprintf(['Creating images for file ' int2str(j) ' of ' int2str(length(files))])
    
    
    % Loop through each time period and generate a graph file
    for i = 0 : 1

        curAgents = [];
        curAlt = [];
        invCDF = [];

        set(0, 'CurrentFigure', handle, 'Visible', 'off');


        % Simple progress update
        if mod(i, 50) == 0
            sprintf('%d / %d', i, maxTime)
        end

        % Get current agnet indicies
        curAgents = find(alt(:,2) == i);

        % Get all agents' altitudes at the current time
        curAlt = alt(curAgents, 1);

        % generate the CDF graph
        grid on;
        [y, x] = ecdf(curAlt);


        % Generate vector of ones to invert the cdf
        invCDF = ones(length(y), 1);
        invCDF = invCDF - y;

        % Plot graph
        plot(x,invCDF);
        title(['Percentage Population > Altitude -- Time = ' int2str(i)]);
        ylabel('Percentage Population');
        xlabel('Altitude(m)');
        xlim('manual');
        xlim([0, 150]);

        num = sprintf('%0.4d', i);
        % Save file
        saveas(gcf, ['./images/' int2str(j) '-alt-cdf-' num '.png'], 'png');

    end

end

