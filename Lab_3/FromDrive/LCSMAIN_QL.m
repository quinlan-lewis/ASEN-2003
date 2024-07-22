% Will Faulkner
% Housekeeping
clear
close all
clc



% Code for data


[theta_exp1, w_exp1, v_exp1] = LCSDATA('Test1_5pt5V');
[theta_exp2, w_exp2, v_exp2] = LCSDATA('Test1_6pt5V');
[theta_exp3, w_exp3, v_exp3] = LCSDATA('Test1_7pt5V');
[theta_exp4, w_exp4, v_exp4] = LCSDATA('Test1_8pt5V');
[theta_exp5, w_exp5, v_exp5] = LCSDATA('Test1_9pt5V');
[theta_exp6, w_exp6, v_exp6] = LCSDATA('Test1_10pt5V');

% Initialize variables lengths are in millimeters, time in seconds
% r is radius of connection of bar from center of disc. 
r = 77.5;
% l is length of bar from a to b
l = 255;
% d is distance of center of disc to bar
d = 155;

%for loops
for a = 1:length(w_exp1)
    vmodel1(a) = LCSMODEL(r,d,l,theta_exp1(a),w_exp1(a));
end
figure(1)
hold on
plot(theta_exp1,v_exp1);
plot(theta_exp1,vmodel1);
legend('Measured Velocity', 'Modeled Velocity')
title('Velocities Versus Angle')
xlabel('Degrees')
ylabel('Velocity in mm/s')
hold off

for b = 1:length(w_exp2)
    vmodel2(b) = LCSMODEL(r,d,l,theta_exp2(b),w_exp2(b));
end
figure(2)
hold on
plot(theta_exp2,v_exp2);
plot(theta_exp2,vmodel2);
legend('Measured Velocity', 'Modeled Velocity')
title('Velocities Versus Angle')
xlabel('Degrees')
ylabel('Velocity in mm/s')
hold off

for c = 1:length(w_exp3)
    vmodel3(c) = LCSMODEL(r,d,l,theta_exp3(c),w_exp3(c));
end
figure(3)
hold on
plot(theta_exp3,v_exp3);
plot(theta_exp3,vmodel3);
legend('Measured Velocity', 'Modeled Velocity')
title('Velocities Versus Angle')
xlabel('Degrees')
ylabel('Velocity in mm/s')
hold off

for e = 1:length(w_exp4)
    vmodel4(e) = LCSMODEL(r,d,l,theta_exp4(e),w_exp4(e));
end
figure(4)
hold on
plot(theta_exp4,v_exp4);
plot(theta_exp4,vmodel4);
legend('Measured Velocity', 'Modeled Velocity')
title('Velocities Versus Angle')
xlabel('Degrees')
ylabel('Velocity in mm/s')
hold off

for f = 1:length(w_exp5)
    vmodel5(f) = LCSMODEL(r,d,l,theta_exp5(f),w_exp5(f));
end
figure(5)
hold on
plot(theta_exp5,v_exp5);
plot(theta_exp5,vmodel5);
legend('Measured Velocity', 'Modeled Velocity')
title('Velocities Versus Angle')
xlabel('Degrees')
ylabel('Velocity in mm/s')
hold off

for g = 1:length(w_exp6)
    vmodel6(g) = LCSMODEL(r,d,l,theta_exp6(g),w_exp6(g));
end
figure(6)
hold on
plot(theta_exp6,v_exp6);
plot(theta_exp6,vmodel6);
legend('Measured Velocity', 'Modeled Velocity')
title('Velocities Versus Angle')
xlabel('Degrees')
ylabel('Velocity in mm/s')
hold off

%calculates each residual by doing data-model calculations
diff1 = (v_exp1)-(vmodel1)';
diff2 = (v_exp2)-(vmodel2)';
diff3 = (v_exp3)-(vmodel3)';
diff4 = (v_exp4)-(vmodel4)';
diff5 = (v_exp5)-(vmodel5)';
diff6 = (v_exp6)-(vmodel6)';

%calculates mean for each residual array
mdiff1 = mean(diff1);
mdiff2 = mean(diff2);
mdiff3 = mean(diff3);
mdiff4 = mean(diff4);
mdiff5 = mean(diff5);
mdiff6 = mean(diff6);

%calculates std for each residual array
stddiff1 = std(diff1);
stddiff2 = std(diff2);
stddiff3 = std(diff3);
stddiff4 = std(diff4);
stddiff5 = std(diff5);
stddiff6 = std(diff6);

t1 = table2array(readtable("Test1_5pt5V"));
t2 = table2array(readtable("Test1_6pt5V"));
t3 = table2array(readtable("Test1_7pt5V"));
t4 = table2array(readtable("Test1_8pt5V"));
t5 = table2array(readtable("Test1_9pt5V"));
t6 = table2array(readtable("Test1_10pt5V"));

figure(7)
hold on
plot(t1(1:length(diff1),1),diff1);
legend('Residual')
title('Residuals vs. Time at 5.5 Voltz')
xlabel('Time')
ylabel('Residual')
hold off

figure(8)
hold on
plot(t1(1:length(diff2),1),diff2);
legend('Residual')
title('Residuals vs. Time at 6.5 Voltz')
xlabel('Time')
ylabel('Residual')
hold off

figure(9)
hold on
plot(t1(1:length(diff3),1),diff3);
legend('Residual')
title('Residuals vs. Time at 7.5 Voltz')
xlabel('Time')
ylabel('Residual')
hold off

figure(10)
hold on
plot(t1(1:length(diff4),1),diff4);
legend('Residual')
title('Residuals vs. Time at 8.5 Voltz')
xlabel('Time')
ylabel('Residual')
hold off

figure(11)
hold on
plot(t1(1:length(diff5),1),diff5);
legend('Residual')
title('Residuals vs. Time at 9.5 Voltz')
xlabel('Time')
ylabel('Residual')
hold off

figure(12)
hold on
plot(t1(1:length(diff6),1),diff6);
legend('Residual')
title('Residuals vs. Time at 10.5 Voltz')
xlabel('Time')
ylabel('Residual')
hold off