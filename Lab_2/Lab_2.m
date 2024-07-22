clear all
clc
close all

%% Method 1

n_m1 = [1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2;]; %array of how many bounces amount of bounces for method 1
h0_m1 = 1; %starting height for each test is 1 meter
hn_m1 = [.405; .075; .41; .12; .385; .095; .37; .095; .38; .12; .38; .10; .34; .035; .35; .02; .40; .10; .375; .075]; %array of height with respect to how many bounces n in meters

e_height1 = zeros(10,1);
e_height2 = zeros(10,1);
for i=1:2:20
    e_height1((i+1)/2) = (hn_m1(i)/h0_m1)^(1/(2*n_m1(i)));
end
for i=2:2:20
    e_height2(i/2) = (hn_m1(i)/h0_m1)^(1/(2*n_m1(i)));
end

avgm11 = mean(e_height1);
N1 = length(e_height1);
std_devm11 = sqrt((sum((e_height1 - avgm11).^2))/(N1-1));
std_dev_meanm11 = std_devm11/sqrt(N1);

avgm12 = mean(e_height2);
N1 = length(e_height2);
std_devm12 = sqrt((sum((e_height2 - avgm12).^2))/(N1-1));
std_dev_meanm12 = std_devm12/sqrt(N1);

%% Method 2

t_n = [0.4; 0.3; 0.3; 0.3; 0.4; 0.4; 0.4; 0.3; 0.4; 0.4]; %array of time between bounces in seconds for different trials
t_n1 = [0.6; 0.6; 0.6; 0.6; 0.6; 0.7; 0.5; 0.6; 0.6; 0.6]; %array of time between prior bounce in seconds for different trials

e_bounce = zeros(10,1);
for i =1:10
    e_bounce(i) = (t_n(i))/(t_n1(i)); %e found from time between bounces
end

avgm2 = mean(e_bounce);
N1 = length(e_bounce);
std_devm2 = sqrt((sum((e_bounce - avgm2).^2))/(N1-1));
std_dev_meanm2 = std_devm2/sqrt(N1);

%% Method 2 using tracker application
%using 3 different trials but calculating e using the same method
t_n = [0.3; 0.34; 0.33]; %array of time between bounces in seconds for different trials
t_n1 = [0.6; 0.6; 0.6]; %array of time between prior bounce in seconds for different trials

e_bounceTracker = zeros(3,1);
for i =1:3
    e_bounceTracker(i) = (t_n(i))/(t_n1(i)); %e found from time between bounces
end

avgmT = mean(e_bounceTracker);
N1 = length(e_bounceTracker);
std_devmT = sqrt((sum((e_bounceTracker - avgmT).^2))/(N1-1));
std_dev_meanmT = std_devmT/sqrt(N1);


%% Method 3

t_s = [2.1; 2.8; 2.1; 1.8; 1.9; 1.8; 1.7; 1.6; 1.4; 1.5;]; %array of different trials of time for ball to stop bouncing entirely
h0_m3 = 1; %initial height of ball measured in meters
g = 9.81; %gravitational constant in m/s/s

e_stop = zeros(10,1);
for i =1:10
    e_stop(i) = (t_s(i) - sqrt(2*h0_m3/g))/(t_s(i) + sqrt(2*h0_m3/g));
end

avgm3 = mean(e_stop);
N1 = length(e_stop);
std_devm3 = sqrt((sum((e_stop - avgm3).^2))/(N1-1));
std_dev1_meanm3 = std_devm3/sqrt(N1);

%% Data for tracking software

