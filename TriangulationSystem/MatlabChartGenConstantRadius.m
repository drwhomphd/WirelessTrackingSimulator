%% Main

% Chart File Prefix
prefix = '/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/1-5Perc-15MRad/';
innerFile = '3d-hist-both_detect_height-15MRad.dat';
outerFile = '3d-hist-both_detect_width-15MRad.dat';

percents = [1 2 3 4 5];
radius = 15;
output =  '';

%% Outer Router Detections
rad = load([prefix 'routers/' outerFile]);

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
r1 = rad(1:spots(2)-1,1:2);
r2 = rad(spots(2):spots(3)-1,1:2);
r3 = rad(spots(3):spots(4)-1,1:2);
r4 = rad(spots(4):length(rad),1:2);

cur = {r1 r2 r3 r4};

pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))] ./ length(percents);

output = [output sprintf('Width Router\n')];

% Now we iterate through each percent in the datapoints 
for i=1 : length(cur)
    tmp = cur{i};
    tmp = sortrows(tmp,2);
    for j = 1 : length(percents)
        data = tmp((j-1)*pop(i)+1:(j)*pop(i),1);
        % Remove all zeros from data set and all elements with width or height the
        % size of width/height * 2.
        nonzeros = find(data);
        data = data(nonzeros);
        nonmaxsize = find(data ~= (radius * 2));
        data = data(nonmaxsize);
        output = [output sprintf('Data for: %d Percent -- %d Population\n', percents(j), x(i))];
        m = mean(data);
        output = [output sprintf('Mean: %f\n', m)];
        s = std(data);
        output = [output sprintf('Std Dev.: %f\n', s)];
        output = [output sprintf('-----\n')];
    end
    
end

output = [output sprintf('##############\n')];
%% Inner Router Detections

rad = load([prefix 'routers/' innerFile]);

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
r1 = rad(1:spots(2)-1,1:2);
r2 = rad(spots(2):spots(3)-1,1:2);
r3 = rad(spots(3):spots(4)-1,1:2);
r4 = rad(spots(4):length(rad),1:2);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))] ./ length(percents);
cur = {r1 r2 r3 r4};
output = [output sprintf('Height Router\n')];
% Now we iterate through each percent in the datapoints 
for i=1 : length(cur)
    tmp = cur{i};
    tmp = sortrows(tmp,2);
    for j = 1 : length(percents)
        data = tmp((j-1)*pop(i)+1:(j)*pop(i),1);
        % Remove all zeros from data set and all elements with width or height the
        % size of width/height * 2.
        nonzeros = find(data);
        data = data(nonzeros);
        nonmaxsize = find(data ~= (radius * 2));
        data = data(nonmaxsize);
        output = [output sprintf('Data for: %d Percent -- %d Population\n', percents(j), x(i))];
        m = mean(data);
        output = [output sprintf('Mean: %f\n', m)];
        s = std(data);
        output = [output sprintf('Std Dev.: %f\n', s)];
        output = [output sprintf('-----\n')];
    end
    
end

output = [output sprintf('#############\n')];
%% Outer Cell Detections
rad = load([prefix 'cells/' outerFile]);

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
r1 = rad(1:spots(2)-1,1:2);
r2 = rad(spots(2):spots(3)-1,1:2);
r3 = rad(spots(3):spots(4)-1,1:2);
r4 = rad(spots(4):length(rad),1:2);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))] ./ length(percents);
cur = {r1 r2 r3 r4};
output = [output sprintf('Width Cells\n')];
% Now we iterate through each percent in the datapoints 
for i=1 : length(cur)
    tmp = cur{i};
    tmp = sortrows(tmp,2);
    for j = 1 : length(percents)
        data = tmp((j-1)*pop(i)+1:(j)*pop(i),1);
                % Remove all zeros from data set and all elements with width or height the
        % size of width/height * 2.
        nonzeros = find(data);
        data = data(nonzeros);
        nonmaxsize = find(data ~= (radius * 2));
        data = data(nonmaxsize);
        output = [output sprintf('Data for: %d Percent -- %d Population\n', percents(j), x(i))];
        m = mean(data);
        output = [output sprintf('Mean: %f\n', m)];
        s = std(data);
        output = [output sprintf('Std Dev.: %f\n', s)];
        output = [output sprintf('-----\n')];
    end
    
end

output = [output sprintf('#############\n')];
%% Inner Cell Detections

rad = load([prefix 'cells/' innerFile]);


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
r1 = rad(1:spots(2)-1,1:2);
r2 = rad(spots(2):spots(3)-1,1:2);
r3 = rad(spots(3):spots(4)-1,1:2);
r4 = rad(spots(4):length(rad),1:2);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))] ./ length(percents);
cur = {r1 r2 r3 r4};
output = [output sprintf('Height Cells\n')];
% Now we iterate through each percent in the datapoints 
for i=1 : length(cur)
    tmp = cur{i};
    tmp = sortrows(tmp,2);
    for j = 1 : length(percents)
        data = tmp((j-1)*pop(i)+1:(j)*pop(i),1);
                % Remove all zeros from data set and all elements with width or height the
        % size of width/height * 2.
        nonzeros = find(data);
        data = data(nonzeros);
        nonmaxsize = find(data ~= (radius * 2));
        data = data(nonmaxsize);
        output = [output sprintf('Data for: %d Percent -- %d Population\n', percents(j), x(i))];
        m = mean(data);
        output = [output sprintf('Mean: %f\n', m)];
        s = std(data);
        output = [output sprintf('Std Dev.: %f\n', s)];
        output = [output sprintf('-----\n')];
    end
    
end

output = [output sprintf('#############\n')];
%% Outer Both Detections

rad = load([prefix 'both/' outerFile]);


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
r1 = rad(1:spots(2)-1,1:2);
r2 = rad(spots(2):spots(3)-1,1:2);
r3 = rad(spots(3):spots(4)-1,1:2);
r4 = rad(spots(4):length(rad),1:2);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))] ./ length(percents);
cur = {r1 r2 r3 r4};
output = [output sprintf('Width Both\n')];

% Now we iterate through each percent in the datapoints 
for i=1 : length(cur)
    tmp = cur{i};
    tmp = sortrows(tmp,2);
    for j = 1 : length(percents)
        data = tmp((j-1)*pop(i)+1:(j)*pop(i),1);
                % Remove all zeros from data set and all elements with width or height the
        % size of width/height * 2.
        nonzeros = find(data);
        data = data(nonzeros);
        nonmaxsize = find(data ~= (radius * 2));
        data = data(nonmaxsize);
        output = [output sprintf('Data for: %d Percent -- %d Population\n', percents(j), x(i))];
        m = mean(data);
        output = [output sprintf('Mean: %f\n', m)];
        s = std(data);
        output = [output sprintf('Std Dev.: %f\n', s)];
        output = [output sprintf('-----\n')];
    end
    
end
output = [output sprintf('#############\n')];
%% Inner Both Detections

rad = load([prefix 'both/' innerFile]);

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
r1 = rad(1:spots(2)-1,1:2);
r2 = rad(spots(2):spots(3)-1,1:2);
r3 = rad(spots(3):spots(4)-1,1:2);
r4 = rad(spots(4):length(rad),1:2);
pop = [length(rad(1:spots(2)-1,1)) length(rad(spots(2):spots(3)-1,1)) length(rad(spots(3):spots(4)-1,1)) length(rad(spots(4):length(rad),1))] ./ length(percents);
cur = {r1 r2 r3 r4};
output = [output sprintf('Height Both\n')];
% Now we iterate through each percent in the datapoints 
for i=1 : length(cur)
    tmp = cur{i};
    tmp = sortrows(tmp,2);
    for j = 1 : length(percents)
        data = tmp((j-1)*pop(i)+1:(j)*pop(i),1);
        % Remove all zeros from data set and all elements with width or height the
        % size of width/height * 2.
        nonzeros = find(data);
        data = data(nonzeros);
        nonmaxsize = find(data ~= (radius * 2));
        data = data(nonmaxsize);
        output = [output sprintf('Data for: %d Percent -- %d Population\n', percents(j), x(i))];
        m = mean(data);
        output = [output sprintf('Mean: %f\n', m)];
        s = std(data);
        output = [output sprintf('Std Dev.: %f\n', s)];
        output = [output sprintf('-----\n')];
    end
    
end

output = [output sprintf('#############\n')];

output