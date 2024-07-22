clc
clear all

x1 = readtable("Test1_10pt5V");
y1 = table2array(x1);
wtheta = [y1(:,2) y1(:,4)];

d = 155; %mm
l = 255;
r = 77.5;
for i = 1:218
    v(i) = LCSMODEL(r,d,l,wtheta(i,1),wtheta(i,2));
end

v = v';

figure(1)
hold on
plot(1:218,y1(:,5));
plot(1:218,v);

% figure(2)
% hold on 
% plot(1:218,y1(:,5));


