clear 
clc
close all

pos = [0,0,125];
accel = [0,0,0];
vel = [0,0,0];

%symbolic equations with s being the dependent variable
syms s

%initial drop segment

z_0 = 125; %coaster starts at 125 meters above ground
x_0 = -20; %starting x position at -55 meters
y_0 = 1; %starting y position at 4 meters

zD = z_0 - s;
xD = x_0 + s*0;
yD = y_0 + s*0;
drop = [xD,yD,zD];


%loop portion
xL = 20*cos(s);
yL = (1/pi)*s;
zL = 20*sin(s)+95;
loop = [xL,yL,zL];

%parabolic hill
xH = 18.4776 + (10.4014 * s);
yH = 3.875 + s*0;
zH = 87.3463 + (25.1112 * s) - (9.81 / 2) * s^2;

% trackLx = piecewise((pi)<t<(15*pi/4),loop(1));
% trackLy = piecewise((pi)<t<(15*pi/4),loop(2));
% trackLz = piecewise((pi)<t<(15*pi/4),loop(3));

%circular valley
xV = 35*cos(s) + 111.3415;
yV = 3.875 + s*0;
zV = 35*sin(s) + 81.0767;

%circular hill
xHc = 147.9116*sin(s) + 181.3387;
yHc = 3.875 + s*0;
zHc = 147.9116*cos(s) - 87.9116;

%banked 180 turn
xT = 75.1*sin(s) + 181.3387;
yT = 75.1*cos(s) - 71.225;
zT = 60 + s*0;

%second circular hill
xHc2 = 147.9116*sin(s) + 181.3387;
yHc2 =  s*0 - 146.3;
zHc2 = 147.9116*cos(s) - 87.9116;

%ramp
zR = z_0 - s-76.26;
xR = -2.414*s+124.7;
yR = s*0-146.3;

%third circular hill
%xHc3 = 147.9116*cos(s) - 32.49;
%yHc3 =  s*0 - 146.3;
%zHc3 = 147.9116*sin(s) + 137.37;

fplot3(xL,yL,zL,[pi 31*pi/8])
hold on
fplot3(xD,yD,zD,[0 30])
fplot3(xH,yH,zH,[0 5.736041])
fplot3(xV,yV,zV,[1.1025*pi 13*pi/8])
fplot3(xHc,yHc,zHc,[-pi/8 0])
fplot3(xT,yT,zT,[0 pi])
fplot3(xHc2,yHc2,zHc2,[-pi/8 0])
fplot3(xR,yR,zR,[0 38.2])
%fplot3(xHc3,yHc3,zHc3,[-pi/8 0])

xlim([-25,270])
ylim([-200,5])
zlim([0,125])
