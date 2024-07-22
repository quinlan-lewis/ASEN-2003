clear
close all
clc

data0 = load('no_masses1');
data1 = load('5pt5_inches');
data2 = load('6_inches');
data3 = load('6pt5_inches');
data4 = load('7_inches');
data5 = load('7pt5_inches');
data6 = load('8_inches');
data7 = load('8pt5_inches');
data8 = load('9_inches');

%% Givens
%
%
I = 0.0063; %kg-m^2
R = [5.5 6 6.5 7 7.5 8 8.5 9]*0.0254; %array of radius
m = 54/1000;
C = (I./((m*2)*R.^2)) + 1;
w_0 = 130 * (pi/30); %rad/s 
%t = [data1(:,1) data2(:,1)];
%
%

%% Calculating Angular Velocity(omega)
%preallocate memory for the values of omega
omega1 = zeros(1,length(data1));
omega2 = zeros(1,length(data2));
omega3 = zeros(1,length(data3));
omega4 = zeros(1,length(data4));
omega5 = zeros(1,length(data5));
omega6 = zeros(1,length(data6));
omega7 = zeros(1,length(data7));
omega8 = zeros(1,length(data8));
%run function to calculate omega for each size of the cord
for i = 1:length(data1)
    omega1(i) = AngVel(w_0,C(1),data1(i,1)/1000);
end
for i = 1:length(data2)
    omega2(i) = AngVel(w_0,C(2),data2(i,1)/1000);
end
for i = 1:length(data3)
    omega3(i) = AngVel(w_0,C(3),data3(i,1)/1000);
end
for i = 1:length(data4)
    omega4(i) = AngVel(w_0,C(4),data4(i,1)/1000);
end
for i = 1:length(data5)
    omega5(i) = AngVel(w_0,C(5),data5(i,1)/1000);
end
for i = 1:length(data6)
    omega6(i) = AngVel(w_0,C(6),data6(i,1)/1000);
end
for i = 1:length(data7)
    omega7(i) = AngVel(w_0,C(7),data7(i,1)/1000);
end
for i = 1:length(data8)
    omega8(i) = AngVel(w_0,C(8),data8(i,1)/1000);
end
%plot desired cord length in our case that length is approximately 7 inches
figure(1)
hold on
% plot(data1(:,1)/1000,omega1);
% plot(data2(:,1)/1000,omega2);
% plot(data3(:,1)/1000,omega3);
plot(data4(:,1)/1000,omega4,'LineWidth',2);
% plot(data5(:,1)/1000,omega5);
% plot(data6(:,1)/1000,omega6);
% plot(data7(:,1)/1000,omega7);
% plot(data8(:,1)/1000,omega8);
xlim([0,1.5])
xlabel('Time(s)')
ylabel('Omega(rad/s)')
title('Angular Velocity Model')

%% Calculating Angular Acceleration(alpha)
%preallocate memory
accel1 = zeros(1,length(data1));
accel2 = zeros(1,length(data2));
accel3 = zeros(1,length(data3));
accel4 = zeros(1,length(data4));
accel5 = zeros(1,length(data5));
accel6 = zeros(1,length(data6));
accel7 = zeros(1,length(data7));
accel8 = zeros(1,length(data8));
%calculate angular acceleration from acceleration for all lengths of the
%cord
for i = 1:length(data1)
    accel1(i) = AngAccel(w_0,C(1),data1(i,1)/1000,(5.5)*.0254);
end
for i = 1:length(data2)
    accel2(i) = AngAccel(w_0,C(2),data2(i,1)/1000,(6)*.0254);
end
for i = 1:length(data3)
    accel3(i) = AngAccel(w_0,C(3),data3(i,1)/1000,(6.5)*.0254);
end
for i = 1:length(data4)
    accel4(i) = AngAccel(w_0,C(4),data4(i,1)/1000,(7)*.0254);
end
for i = 1:length(data5)
    accel5(i) = AngAccel(w_0,C(5),data5(i,1)/1000,(7.5)*.0254);
end
for i = 1:length(data6)
    accel6(i) = AngAccel(w_0,C(6),data6(i,1)/1000,(8)*.0254);
end
for i = 1:length(data7)
    accel7(i) = AngAccel(w_0,C(7),data7(i,1)/1000,(8.5)*.0254);
end
for i = 1:length(data8)
    accel8(i) = AngAccel(w_0,C(8),data8(i,1)/1000,(9)*.0254);
end
%plot accelerations
figure(2)
hold on
plot(data1(:,1)/1000,accel1);
plot(data2(:,1)/1000,accel2);
plot(data3(:,1)/1000,accel3);
plot(data4(:,1)/1000,accel4,'LineWidth',2);
plot(data5(:,1)/1000,accel5);
plot(data6(:,1)/1000,accel6);
plot(data7(:,1)/1000,accel7);
plot(data8(:,1)/1000,accel8);
xlim([0,1])
xlabel('Time(s)')
ylabel('Alpha(rad/s^2)')
title('Angular Acceleration Model')
legend('5.5 inches','6 inches','6.5 inches','7 inches','7.5 inches','8 inches','8.5 inches','9 inches')

%% Tension as a function of time
%preallocate memory
Tension1 = zeros(1,length(data1));
Tension2 = zeros(1,length(data2));
Tension3 = zeros(1,length(data3));
Tension4 = zeros(1,length(data4));
Tension5 = zeros(1,length(data5));
Tension6 = zeros(1,length(data6));
Tension7 = zeros(1,length(data7));
Tension8 = zeros(1,length(data8));
%calculate tension using experimental data and for all lengths of the cord
for i = 1:length(data1)
    Tension1(i) = Tension(w_0,C(1),data1(i,1)/1000,(5.5)*.0254);
end
for i = 1:length(data2)
    Tension2(i) = Tension(w_0,C(2),data2(i,1)/1000,(6)*.0254);
end
for i = 1:length(data3)
    Tension3(i) = Tension(w_0,C(3),data3(i,1)/1000,(6.5)*.0254);
end
for i = 1:length(data4)
    Tension4(i) = Tension(w_0,C(4),data4(i,1)/1000,(7)*.0254);
end
for i = 1:length(data5)
    Tension5(i) = Tension(w_0,C(5),data5(i,1)/1000,(7.5)*.0254);
end
for i = 1:length(data6)
    Tension6(i) = Tension(w_0,C(6),data6(i,1)/1000,(8)*.0254);
end
for i = 1:length(data7)
    Tension7(i) = Tension(w_0,C(7),data7(i,1)/1000,(8.5)*.0254);
end
for i = 1:length(data8)
    Tension8(i) = Tension(w_0,C(8),data8(i,1)/1000,(9)*.0254);
end
%plot tensions
figure(3)
hold on
plot(data1(:,1)/1000,Tension1);
plot(data2(:,1)/1000,Tension2);
plot(data3(:,1)/1000,Tension3);
plot(data4(:,1)/1000,Tension4,'LineWidth',2);
plot(data5(:,1)/1000,Tension5);
plot(data6(:,1)/1000,Tension6);
plot(data7(:,1)/1000,Tension7);
plot(data8(:,1)/1000,Tension8);
xlim([0,.5])
xlabel('Time(s)')
ylabel('Newtons')
title('Tension as a function of time')
legend('5.5 inches','6 inches','6.5 inches','7 inches','7.5 inches','8 inches','8.5 inches','9 inches')

%% Extra plots

figure(4)
plot(data0(:,1)/1000,data0(:,2)*(pi/30),'LineWidth',2);
title('Experimental omega for no masses')
xlabel('Time(s)')
ylabel('Omega(rad/s)')

figure(5)
hold on
plot(data4(:,1)/1000,omega4,'LineWidth',2);
plot(data4(:,1)/1000,data4(:,2)*(pi/30),'LineWidth',2)
xlabel('Time(s)')
ylabel('Omega(rad/s)')
title('Angular Velocity of experimental and model')
legend('Modeled Omega','Experimental Omega')
