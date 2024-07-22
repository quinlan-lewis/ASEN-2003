clc
clear all
close all

x1 = table2array(readtable("Test1_5pt5V"));
x2 = table2array(readtable("Test1_6pt5V"));
x3 = table2array(readtable("Test1_7pt5V"));
x4 = table2array(readtable("Test1_8pt5V"));
x5 = table2array(readtable("Test1_9pt5V"));
x6 = table2array(readtable("Test1_10pt5V"));
y1 = table2array(x1);
y2 = table2array(x2);
y3 = table2array(x3);
y4 = table2array(x4);
y5 = table2array(x5);
y6 = table2array(x6);

wtheta1 = [y1(:,2) y1(:,4)];
wtheta2 = [y2(:,2) y2(:,4)];
wtheta3 = [y3(:,2) y3(:,4)];
wtheta4 = [y4(:,2) y4(:,4)];
wtheta5 = [y5(:,2) y5(:,4)];
wtheta6 = [y6(:,2) y6(:,4)];

d = 155; %mm
l = 255;
r = 77.5;
for i = 1:height(x1)
    v1(i) = LCSMODEL(r,d,l,wtheta1(i,1),wtheta1(i,2));
end
for i = 1:height(x2)
    v2(i) = LCSMODEL(r,d,l,wtheta2(i,1),wtheta2(i,2));
end
for i = 1:height(x3)
    v3(i) = LCSMODEL(r,d,l,wtheta3(i,1),wtheta3(i,2));
end
for i = 1:height(x4)
    v4(i) = LCSMODEL(r,d,l,wtheta4(i,1),wtheta4(i,2));
end
for i = 1:height(x5)
    v5(i) = LCSMODEL(r,d,l,wtheta5(i,1),wtheta5(i,2));
end
for i = 1:height(x6)
    v6(i) = LCSMODEL(r,d,l,wtheta6(i,1),wtheta6(i,2));
end

v1 = v1';
v2 = v2';
v3 = v3';
v4 = v4';
v5 = v5';
v6 = v6';

diff1 = abs(y1(:,5) - v1);
diff2 = abs(y2(:,5) - v2);
diff3 = abs(y3(:,5) - v3);
diff4 = abs(y4(:,5) - v4);
diff5 = abs(y5(:,5) - v5);
diff6 = abs(y6(:,5) - v6);

% figure(1)
% hold on
% plot(1:height(x1),y1(:,5));
% plot(1:height(x1),v1);
% 
% figure(2)
% hold on
% plot(1:height(x2),y2(:,5));
% plot(1:height(x2),v2);
% 
% figure(3)
% hold on
% plot(1:height(x3),y3(:,5));
% plot(1:height(x3),v3);
% 
% figure(4)
% hold on
% plot(1:height(x4),y4(:,5));
% plot(1:height(x4),v4);
% 
% figure(5)
% hold on
% plot(1:height(x5),y5(:,5));
% plot(1:height(x5),v5);
% 
% figure(6)
% hold on
% plot(1:height(x6),y6(:,5));
% plot(1:height(x6),v6);


