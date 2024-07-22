%ASEN 2003 Lab 4 - Balanced & Unbalanced Wheel

%housekeeping
clear all
clc
close all

%load in data to be used throughout code
data1 = load('balanced_1');
data2 = load('balanced_2');
data3 = load('unbalanced_1');
data4 = load('unbalanced_2');

%given constant values from the write up
M = 11.7; %kg cylinder
M_0 = 0.7; %kg trailing support
m = 3.4; %kg extra mass
R = .235; %meters radius of cylinder
k = 0.203; %radius of gyration
beta = 5.5; %angle of ramp in degrees
beta_rad = pi*beta/180;
r = 0.178; %radius to extra mass
g = 9.81; %gravity

%% Calculating omega for all models using both experimental data and a linspace array
theta = linspace(0,15); %declare theta for the models to use

%runs the model using both the declared theta array and the experimental
%data
omega1_test = sqrt((2*M*g*(theta)*R*sind(beta))/(M*k^2 + M*R^2));
omega1_data = sqrt((2*M*g*(data1(:,2))*R*sind(beta))/(M*k^2 + M*R^2));

%Declare M to be used in model 2-4
M_unknown = -.6;
%model 2 for the experimental theta and the theta array
omega2_test = sqrt((2*theta*(M*g*sind(beta)*R + M_unknown))/(M*R^2 + M*k^2));
omega2_data = sqrt((2*data2(:,2)*(M*g*sind(beta)*R + M_unknown))/(M*R^2 + M*k^2));

%model 3 for the experimental theta and the theta array
omega3_test = sqrt((M*g*(R*theta*sind(beta)) + m*g*(r*cos(0+beta_rad) - r*cos(theta + beta_rad) + R*theta*sind(beta)) + M_unknown*theta)./(.5*M*R^2 + .5*M*k^2 + .5*m*(R^2 + r^2 +2*R*r*cos(theta))));
omega3_data = sqrt((M*g*(R*data3(:,2)*sind(beta)) + m*g*(r*cos(0+beta_rad) - r*cos(data3(:,2) + beta_rad) + R*data3(:,2)*sind(beta)) + M_unknown*data3(:,2))./(.5*M*R^2 + .5*M*k^2 + .5*m*(R^2 + r^2 +2*R*r*cos(data3(:,2)))));

%model 4 for the experimental theta and the theta array
omega4_test = sqrt((2*(M_unknown*theta + M*g*sind(beta)*R*theta + m*g*(r*cos(0+beta_rad) - r*cos(theta + beta_rad) + R*theta*sind(beta))))./(m*((R + (.178+.019)*cos(theta)).^2 + ((.178+.019)^2)*(sin(theta)).^2) + M*R^2 + M*k^2 + 0.5*m*(.019^2) + m*(.178+.019)^2));
omega4_data = sqrt((2*(M_unknown*data4(:,2) + M*g*sind(beta)*R*data4(:,2) + m*g*(r*cos(0+beta_rad) - r*cos(data4(:,2) + beta_rad) + R*data4(:,2)*sind(beta))))./(m*((R + (.178+.019)*cos(data4(:,2))).^2 + ((.178+.019)^2)*(sin(data4(:,2))).^2) + M*R^2 + M*k^2 + 0.5*m*(.019^2) + m*(.178+.019)^2));

%Plot figure for data and models 1 and 2
figure
hold on
plot(theta,omega1_test,'--b')
plot(theta,omega2_test,'r')
plot(data1(:,2),data1(:,3),'*g')
plot(data2(:,2),data2(:,3),'.')
legend('Model 1','Model 2','Experimental data 1','Experimental data 2','Location','northwest');
xlabel('Angle in radians')
ylabel('Angular velocity in rad/sec')
title('Models 1 and 2 compared to the experimental data')

%% Residuals
%residual for model 1
resid_11 = data1(:,3) - omega1_data;
resid_11 = resid_11(1:106);

%residual for model 2
resid_22 = data2(:,3) - omega2_data;
resid_22 = resid_22(1:106);

%residual for model 3
resid_31 = data3(:,3) - omega3_data;
resid_31 = resid_31(1:36);

%residual for model 4
resid_42 = data4(:,3) - omega4_data;
resid_42 = resid_42(1:36);

%plotts all the residuals together along with the angle of radians overtime
figure(10)
hold on
plot(data1(1:106,2),resid_11(1:106))
plot(data2(1:106,2),resid_22(1:106))
plot(data3(1:36,2),resid_31(1:36))
plot(data4(1:36,2),resid_42(1:36))
legend('Residual of Model 1','Residual of Model 2','Residual of Model 3','Residual of Model 4','Location','northwest');
xlabel('Angle in Radians')
ylabel('Residual')
title('Residuals of all models')

%plots the data of balanced wheel trial 2, as well as the model 2 with
%different value for the unknown M
figure(2)
scatter(data2(1:105,2),data2(1:105,3))
hold on 
scatter(data2(1:105,2),omega2_data(1:105))
for i = -1:0.5:1
    omega2_data = sqrt((2*data2(:,2)*(M*g*sind(beta)*R + i))/(M*R^2 + M*k^2));
    plot(data2(1:105,2),omega2_data(1:105))
end
xlabel('angle in radians')
ylabel('angular velocity in rad/s')
title('Different values of unknown plotted with data')

%Plots model 3 and 4 along with the data of unbalanced 1 and 2
figure(5)
hold on
plot(data3(1:36,2),data3(1:36,3),'*')
plot(data4(1:36,2),data4(1:36,3),'p')
plot(theta,omega3_test,'--b')
plot(theta,omega4_test,'r')
legend('Unbalanced data 1','Unbalanced data 2','Model 3','Model 4','Location','northwest');
xlabel('Degrees in radians')
ylabel('angular velocity in rad/s')
title('Model 3 and 4 compared to the experimental data')

%% Subplots of experimental data plotted against models with linspace array for theta(0 to 15 radians)
% subplot(2,2,1)
% hold on
% plot(theta,omega1_test)
% scatter(data1(1:106,2),data1(1:106,3))
% 
% subplot(2,2,2)
% hold on
% plot(theta,omega2_test)
% scatter(data2(1:105,2),data2(1:105,3))
% for i = -1:0.5:1
%     omega2_test = sqrt((2*theta*(M*g*sind(beta)*R + i))/(M*R^2 + M*k^2));
%     plot(theta,omega2_test)
% end
% 
% subplot(2,2,3)
% hold on
% plot(theta,omega3_test)
% scatter(data3(1:36,2),data3(1:36,3))
% 
% subplot(2,2,4)
% hold on
% plot(theta,omega4_test)
% scatter(data4(1:36,2),data4(1:36,3))

%% Stanard deviation and such
%calculated the standard deviation of the residuals
std1 = std(resid_11);
std2 = std(resid_22);
std3 = std(resid_31);
std4 = std(resid_42);

%calculates the mean of the residuals
mean1 = mean(resid_11);
mean2 = mean(resid_22);
mean3 = mean(resid_31);
mean4 = mean(resid_42);

%calculated the uncertainty of the residuals
uncert1 = std1/(sqrt(length(resid_11)));
uncert2 = std2/(sqrt(length(resid_22)));
uncert3 = std3/(sqrt(length(resid_31)));
uncert4 = std4/(sqrt(length(resid_42)));

%starts count for each model at 0
count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;

%runs 4 different for loops, for each model respectively to see if any
%values of the residuals are ever greater than 3 times the standard
%deviation
for i = 1:length(resid_11)
   if resid_11(i) > (3*std1)
       count1 = count1 + 1;
   end
end

for i = 1:length(resid_22)
   if resid_22(i) > (3*std2)
       count2 = count2 + 1;
   end
end

for i = 1:length(resid_31)
   if resid_31(i) > (3*std3)
       count3 = count3 + 1;
   end
end

for i = 1:length(resid_42)
   if resid_42(i) > (3*std4)
       count4 = count4 + 1;
   end
end