rad45 = load('/u/nhusted/tmp/scratch/routers/3d-histo-percent.steps.detected.inner-45MRad.dat');
rad15 = load('/u/nhusted/tmp/scratch/routers/3d-histo-percent.steps.detected.inner-15MRad.dat');
rad30 = load('/u/nhusted/tmp/scratch/routers/3d-histo-percent.steps.detected.inner-30MRad.dat');

h1 = figure
hist3(rad45, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent Routers Able to Detect')
title('Percent Inner Steps Detected -- 45M Radius')
saveas(h1, 'random-45M-routers-percent-steps-detected-inner', 'jpg')

h1 = figure
hist3(rad30, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent Routers Able to Detect')
title('Percent Inner Steps Detected -- 30M Radius')
saveas(h1, 'random-30M-routers-percent-steps-detected-inner', 'jpg')

h1 = figure
hist3(rad15, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent Routers Able to Detect')
title('Percent Inner Steps Detected -- 15M Radius')
saveas(h1, 'random-15M-routers-percent-steps-detected-inner', 'jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rad45 = load('/u/nhusted/tmp/scratch/routers/3d-histo-percent.steps.detected.outer-45MRad.dat');
rad15 = load('/u/nhusted/tmp/scratch/routers/3d-histo-percent.steps.detected.outer-15MRad.dat');
rad30 = load('/u/nhusted/tmp/scratch/routers/3d-histo-percent.steps.detected.outer-30MRad.dat');

h1 = figure
hist3(rad45, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent Routers Able to Detect')
title('Percent Outer Steps Detected -- 45M Radius')
saveas(h1, 'random-45M-routers-percent-steps-detected-outer', 'jpg')

h1 = figure
hist3(rad30, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent Routers Able to Detect')
title('Percent Outer Steps Detected -- 30M Radius')
saveas(h1, 'random-30M-routers-percent-steps-detected-outer', 'jpg')

h1 = figure
hist3(rad15, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent Routers Able to Detect')
title('Percent Outer Steps Detected -- 15M Radius')
saveas(h1, 'random-15M-routers-percent-steps-detected-outer', 'jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rad45 = load('/u/nhusted/tmp/scratch/cells/3d-histo-percent.steps.detected.inner-45MRad.dat');
rad15 = load('/u/nhusted/tmp/scratch/cells/3d-histo-percent.steps.detected.inner-15MRad.dat');
rad30 = load('/u/nhusted/tmp/scratch/cells/3d-histo-percent.steps.detected.inner-30MRad.dat');

h1 = figure
hist3(rad45, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent cells Able to Detect')
title('Percent Inner Steps Detected -- 45M Radius')
saveas(h1, 'random-45M-cells-percent-steps-detected-inner', 'jpg')

h1 = figure
hist3(rad30, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent cells Able to Detect')
title('Percent Inner Steps Detected -- 30M Radius')
saveas(h1, 'random-30M-cells-percent-steps-detected-inner', 'jpg')

h1 = figure
hist3(rad15, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent cells Able to Detect')
title('Percent Inner Steps Detected -- 15M Radius')
saveas(h1, 'random-15M-cells-percent-steps-detected-inner', 'jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rad45 = load('/u/nhusted/tmp/scratch/cells/3d-histo-percent.steps.detected.outer-45MRad.dat');
rad15 = load('/u/nhusted/tmp/scratch/cells/3d-histo-percent.steps.detected.outer-15MRad.dat');
rad30 = load('/u/nhusted/tmp/scratch/cells/3d-histo-percent.steps.detected.outer-30MRad.dat');

h1 = figure
hist3(rad45, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent cells Able to Detect')
title('Percent Outer Steps Detected -- 45M Radius')
saveas(h1, 'random-45M-cells-percent-steps-detected-outer', 'jpg')

h1 = figure
hist3(rad30, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent cells Able to Detect')
title('Percent Outer Steps Detected -- 30M Radius')
saveas(h1, 'random-30M-cells-percent-steps-detected-outer', 'jpg')

h1 = figure
hist3(rad15, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent cells Able to Detect')
title('Percent Outer Steps Detected -- 15M Radius')
saveas(h1, 'random-15M-cells-percent-steps-detected-outer', 'jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rad45 = load('/u/nhusted/tmp/scratch/both/3d-histo-percent.steps.detected.inner-45MRad.dat');
rad15 = load('/u/nhusted/tmp/scratch/both/3d-histo-percent.steps.detected.inner-15MRad.dat');
rad30 = load('/u/nhusted/tmp/scratch/both/3d-histo-percent.steps.detected.inner-30MRad.dat');

h1 = figure
hist3(rad45, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent both Able to Detect')
title('Percent Inner Steps Detected -- 45M Radius')
saveas(h1, 'random-45M-both-percent-steps-detected-inner', 'jpg')

h1 = figure
hist3(rad30, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent both Able to Detect')
title('Percent Inner Steps Detected -- 30M Radius')
saveas(h1, 'random-30M-both-percent-steps-detected-inner', 'jpg')

h1 = figure
hist3(rad15, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Inner Steps Detected')
ylabel('Percent both Able to Detect')
title('Percent Inner Steps Detected -- 15M Radius')
saveas(h1, 'random-15M-both-percent-steps-detected-inner', 'jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rad45 = load('/u/nhusted/tmp/scratch/both/3d-histo-percent.steps.detected.outer-45MRad.dat');
rad15 = load('/u/nhusted/tmp/scratch/both/3d-histo-percent.steps.detected.outer-15MRad.dat');
rad30 = load('/u/nhusted/tmp/scratch/both/3d-histo-percent.steps.detected.outer-30MRad.dat');

h1 = figure
hist3(rad45, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent both Able to Detect')
title('Percent Outer Steps Detected -- 45M Radius')
saveas(h1, 'random-45M-both-percent-steps-detected-outer', 'jpg')

h1 = figure
hist3(rad30, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent both Able to Detect')
title('Percent Outer Steps Detected -- 30M Radius')
saveas(h1, 'random-30M-both-percent-steps-detected-outer', 'jpg')

h1 = figure
hist3(rad15, {0:0.1:1 [1 5 10 20 30 50 60 100]})
xlabel('Percent Outer Steps Detected')
ylabel('Percent both Able to Detect')
title('Percent Outer Steps Detected -- 15M Radius')
saveas(h1, 'random-15M-both-percent-steps-detected-outer', 'jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
