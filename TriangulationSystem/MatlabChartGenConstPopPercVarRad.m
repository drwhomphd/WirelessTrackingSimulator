%% Main

%r45 = (45 * 2) ^ 2;
%ri45 = round((sqrt((45 ^ 2) / 2) * 2) ^ 2);
%r30 = (30 * 2) ^ 2;
%ri30 = round((sqrt((30 ^ 2) / 2) * 2) ^ 2);
%r15 = (15 * 2) ^ 2;
%ri15 = round((sqrt((15 ^ 2) / 2) * 2) ^ 2);

%r45 = 0;
%ri45 = 0;
%r30 = 0;
%ri30 = 0;
%r15 = 0;
%ri15 = 0;

target = 'outer_detect_area(m^2)';
%field = 2; % Field in file related to inner detect count
field = 3; % Field in file related to outer detect count

output = sprintf('##########\n');

% %% Routers
% type = 'routers';
% rad45 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-45MRad.dat']);
% rad30 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-30MRad.dat']);
% rad15 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-15MRad.dat']);
% 
% rad45 = rad45(:,1);
% rad30 = rad30(:,1);
% rad15 = rad15(:,1);
% 
% nonzeros = find(rad45);
% rad45 = rad45(nonzeros);
% nonmaxsize = find(rad45 ~= r45);
% rad45 = rad45(nonmaxsize);
% nonmaxsize = find(rad45 ~= ri45);
% rad45 = rad45(nonmaxsize);
% 
% nonzeros = find(rad30);
% rad30 = rad30(nonzeros);
% nonmaxsize = find(rad30 ~= r30);
% rad30 = rad30(nonmaxsize);
% nonmaxsize = find(rad30 ~= ri30);
% rad30 = rad30(nonmaxsize);
% 
% nonzeros = find(rad15);
% rad15 = rad15(nonzeros);
% nonmaxsize = find(rad15 ~= r15);
% rad15 = rad15(nonmaxsize);
% nonmaxsize = find(rad15 ~= ri15);
% rad15 = rad15(nonmaxsize);
% 
% % Start printing results
% output = [output sprintf('Router Detection Areas (m^2)\n')];
% output = [output sprintf('Radius 45:\n')];
% m = mean(rad45);
% s = std(rad45);
% output = [output sprintf('Mean: %f\n', m)];
% output = [output sprintf('Std. Dev: %f\n', s)];
% 
% output = [output sprintf('Radius 30:\n')];
% m = mean(rad30);
% s = std(rad30);
% output = [output sprintf('Mean: %f\n', m)];
% output = [output sprintf('Std. Dev: %f\n', s)];
% 
% output = [output sprintf('Radius 15:\n')];
% m = mean(rad15);
% s = std(rad15);
% output = [output sprintf('Mean: %f\n', m)];
% output = [output sprintf('Std. Dev: %f\n', s)];
% 
% output = [output sprintf('####################\n')];



%% Cells
type = 'cells';
rad45 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-45MRad.dat']);
rad30 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-30MRad.dat']);
rad15 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-15MRad.dat']);

%rad45 = rad45(:,1);
%rad30 = rad30(:,1);
%rad15 = rad15(:,1);




% Calculating for 45M
tmp = find(rad45(:, field) >= 1);
rad45MoreThan1 = rad45(tmp, :);

tmp = find(rad45(:, field) >= 2);
rad45MoreThan2 = rad45(tmp, :);

tmp = find(rad45(:, field) >= 3);
rad45MoreThan3 = rad45(tmp, :);

tmp = find(rad45(:, field) >= 4);
rad45MoreThan4 = rad45(tmp, :);


% Calculating for 30M
tmp = find(rad30(:, field) >= 1);
rad30MoreThan1 = rad30(tmp, :);

tmp = find(rad30(:, field) >= 2);
rad30MoreThan2 = rad30(tmp, :);

tmp = find(rad30(:, field) >= 3);
rad30MoreThan3 = rad30(tmp, :);

tmp = find(rad30(:, field) >= 4);
rad30MoreThan4 = rad30(tmp, :);

% Calculating for 15M
tmp = find(rad15(:, field) >= 1);
rad15MoreThan1 = rad15(tmp, :);

tmp = find(rad15(:, field) >= 2);
rad15MoreThan2 = rad15(tmp, :);

tmp = find(rad15(:, field) >= 3);
rad15MoreThan3 = rad15(tmp, :);

tmp = find(rad15(:, field) >= 4);
rad15MoreThan4 = rad15(tmp, :);





% Start printing results

%% 45 Meters
output = [output sprintf('Cell Detection Areas (m^2)\n')];
output = [output sprintf('Radius 45:\n')];
output = [output sprintf('>= 1:\n')];
m = mean(rad45MoreThan1(:,1));
s = std(rad45MoreThan1(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 2:\n')];
m = mean(rad45MoreThan2(:,1));
s = std(rad45MoreThan2(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 3:\n')];
m = mean(rad45MoreThan3(:,1));
s = std(rad45MoreThan3(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 4:\n')];
m = mean(rad45MoreThan4(:,1));
s = std(rad45MoreThan4(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

%###############################################
%% 30 Meters
output = [output sprintf('Radius 30:\n')];
output = [output sprintf('>= 1:\n')];
m = mean(rad30MoreThan1(:,1));
s = std(rad30MoreThan1(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 2:\n')];
m = mean(rad30MoreThan2(:,1));
s = std(rad30MoreThan2(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 3:\n')];
m = mean(rad30MoreThan3(:,1));
s = std(rad30MoreThan3(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 4:\n')];
m = mean(rad30MoreThan4(:,1));
s = std(rad30MoreThan4(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];
%################################################

%% 15 Meters
output = [output sprintf('Radius 15:\n')];
output = [output sprintf('>= 1:\n')];
m = mean(rad15MoreThan1(:,1));
s = std(rad15MoreThan1(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 2:\n')];
m = mean(rad15MoreThan2(:,1));
s = std(rad15MoreThan2(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 3:\n')];
m = mean(rad15MoreThan3(:,1));
s = std(rad15MoreThan3(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('>= 4:\n')];
m = mean(rad15MoreThan4(:,1));
s = std(rad15MoreThan4(:,1));
output = [output sprintf('Mean: %f\n', m)];
output = [output sprintf('Std. Dev: %f\n', s)];

output = [output sprintf('####################\n')];

% %% Both
% type = 'both';
% rad45 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-45MRad.dat']);
% rad30 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-30MRad.dat']);
% rad15 = load(['/home/nhusted/research/samyers/TriangulationSystem/Statistics/udel-statistics/10Perc-VarRad-9056/' type '/3d-histo-' target '-15MRad.dat']); 
% 
% rad45 = rad45(:,1);
% rad30 = rad30(:,1);
% rad15 = rad15(:,1);
% 
% nonzeros = find(rad45);
% rad45 = rad45(nonzeros);
% nonmaxsize = find(rad45 ~= r45);
% rad45 = rad45(nonmaxsize);
% nonmaxsize = find(rad45 ~= ri45);
% rad45 = rad45(nonmaxsize);
% 
% nonzeros = find(rad30);
% rad30 = rad30(nonzeros);
% nonmaxsize = find(rad30 ~= r30);
% rad30 = rad30(nonmaxsize);
% nonmaxsize = find(rad30 ~= ri30);
% rad30 = rad30(nonmaxsize);
% 
% nonzeros = find(rad15);
% rad15 = rad15(nonzeros);
% nonmaxsize = find(rad15 ~= r15);
% rad15 = rad15(nonmaxsize);
% nonmaxsize = find(rad15 ~= ri15);
% rad15 = rad15(nonmaxsize);
% 
% % Start printing results
% output = [output sprintf('Both Detection Areas (m^2)\n')];
% output = [output sprintf('Radius 45:\n')];
% m = mean(rad45);
% s = std(rad45);
% output = [output sprintf('Mean: %f\n', m)];
% output = [output sprintf('Std. Dev: %f\n', s)];
% 
% output = [output sprintf('Radius 30:\n')];
% m = mean(rad30);
% s = std(rad30);
% output = [output sprintf('Mean: %f\n', m)];
% output = [output sprintf('Std. Dev: %f\n', s)];
% 
% output = [output sprintf('Radius 15:\n')];
% m = mean(rad15);
% s = std(rad15);
% output = [output sprintf('Mean: %f\n', m)];
% output = [output sprintf('Std. Dev: %f\n', s)];
% 
% output = [output sprintf('####################\n')];

%%

output
