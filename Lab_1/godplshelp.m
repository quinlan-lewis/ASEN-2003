%% ASEN 2003 Lab 1

clear 
clc
close all

pos_i = [-20,0.9962,125];
accel_i = [0,0,0];
vel_i = [0,0,0];

%% Path Functions
%symbolic equations with s being the dependent variable
syms s
rho = (((1 + (-9.8*s + 25.112)/10.4014)^2)^3/2)/(abs(9.81/10.4014));

%initial drop segment
zD = pos_i(3) - s;
xD = pos_i(1) + s*0;
yD = pos_i(2) + s*0;
drop = [xD,yD,zD];

xdp=diff(xD);
ydp=diff(yD);
zdp=diff(zD);

L_Drop=double(int(sqrt((xdp^2)+(ydp^2)+(zdp^2)),s,0, 29.5226));

%helix transition in
xLi = s*0-20;
yLi = 30*cos(s)+30.9962;
zLi = 30*sin(s)+95.4774;

xlp=diff(xLi);
ylp=diff(yLi);
zlp=diff(zLi);

L_Helixin=double(int(sqrt((xlp^2)+(ylp^2)+(zlp^2)),s,pi, pi+0.0159));

%helix loop portion
xL = 20*cos(s);
yL = (1/pi)*s;
zL = 20*sin(s) + 95;
loop = [xL,yL,zL];

xLp=diff(xL);
yLp=diff(yL);
zLp=diff(zL);

L_Helix=double(int(sqrt((xLp^2)+(yLp^2)+(zLp^2)),s,pi, 7*pi/2));

%helix transition out
xLo = 30*sin(s) + 0.4774;
yLo = 30*cos(s) - 26.4962;
zLo = 75 + s*0;

xlop=diff(xLo);
ylop=diff(yLo);
zlop=diff(zLo);

L_Helixout=double(int(sqrt((xlop^2)+(ylop^2)+(zlop^2)),s,-0.0159, 0));

%circular loop exit
xLe = 20*cos(s) + 0.4774;
yLe = 3.5038 + 0*s;
zLe = 20*sin(s) + 95;

xlep=diff(xLe);
ylep=diff(yLe);
zlep=diff(zLe);

L_Cout=double(int(sqrt((xlep^2)+(ylep^2)+(zlep^2)),s,7*pi/2, 31*pi/8));

%parabolic hill
xH = 18.955 + (10.4014 * s);
yH = 3.5038 + s*0;
zH = 87.3463 + (25.1112 * s) - (9.81 / 2) * s^2;

xhp=diff(xH);
yhp=diff(yH);
zhp=diff(zH);

L_parabolic=double(int(sqrt((xhp^2)+(yhp^2)+(zhp^2)),s,0, 5.736041));

%circular valley
xV = 35*cos(s) + 111.8189;
yV = 3.5038 + s*0;
zV = 35*sin(s) + 81.0767;

xvp=diff(xV);
yvp=diff(yV);
zvp=diff(zV);

L_Cvalley=double(int(sqrt((xvp^2)+(yvp^2)+(zvp^2)),s,1.1025*pi, 13*pi/8));

%circular hill
xHc = 147.9116*sin(s) + 181.8161;
yHc = 3.5038 + s*0;
zHc = 147.9116*cos(s) - 87.9116;

xhcp=diff(xHc);
yhcp=diff(yHc);
zhcp=diff(zHc);

L_Chill=double(int(sqrt((xhcp^2)+(yhcp^2)+(zhcp^2)),s,-pi/8,0));

%banked 180 turn
xT = 75.1*sin(s) + 181.8161;
yT = 75.1*cos(s) - 71.5962;
zT = 60 + s*0;

xtp=diff(xT);
ytp=diff(yT);
ztp=diff(zT);

L_turn=double(int(sqrt((xtp^2)+(ytp^2)+(ztp^2)),s,0,pi));

%second circular hill
xHc2 = 147.9116*sin(s) + 181.8161;
yHc2 =  s*0 - 146.6962;
zHc2 = 147.9116*cos(s) - 87.9116;

xHcp=diff(xHc2);
yHcp=diff(yHc2);
zHcp=diff(zHc2);

L_Chill2=double(int(sqrt((xHcp^2)+(yHcp^2)+(zHcp^2)),s,-pi/8,0));

%ramp
zR = pos_i(3) - s - 76.2591;
xR = -2.4142*s + 125.2128;
yR = s*0 - 146.6962;

xrp=diff(xR);
yrp=diff(yR);
zrp=diff(zR);

L_ramp=double(int(sqrt((xrp^2)+(yrp^2)+(zrp^2)),s,0, 48.7410));

%total distance
L_total=L_Cvalley+L_ramp+L_Chill+L_Chill2+L_turn+L_parabolic+L_Cout+L_Drop+L_Helix+L_Helixin+L_Helixout;

%%

%{
hold on
fplot3(xD,yD,zD,[0 29.5226])
fplot3(xLi,yLi,zLi,[pi pi+0.0159])
fplot3(xL,yL,zL,[pi 7*pi/2])
fplot3(xLo,yLo,zLo,[-0.0159 0])
fplot3(xLe,yLe,zLe,[7*pi/2 31*pi/8])
fplot3(xH,yH,zH,[0 5.736041])
fplot3(xV,yV,zV,[1.1025*pi 13*pi/8])
fplot3(xHc,yHc,zHc,[-pi/8 0])
fplot3(xT,yT,zT,[0 pi])
fplot3(xHc2,yHc2,zHc2,[-pi/8 0])
fplot3(xR,yR,zR,[0 48.7409])
%fplot3(xHc3,yHc3,zHc3,[-pi/8 0])

xlim([-25,270])
ylim([-200,5])
zlim([0,125])
%}
Track_path(1,:) = [xD,yD,zD,[0 29.5226],L_Drop];
Track_path(2,:) = [xLi,yLi,zLi,[pi pi+0.0159],L_Helixin];
Track_path(3,:) = [xL,yL,zL,[pi 7*pi/2],L_Helix];
Track_path(4,:) = [xLo,yLo,zLo,[-0.0159 0],L_Helixout];
Track_path(5,:) = [xLe,yLe,zLe,[7*pi/2 31*pi/8],L_Cout];
Track_path(6,:) = [xH,yH,zH,[0 5.736041],L_parabolic];
Track_path(7,:) = [xV,yV,zV,[1.1025*pi 13*pi/8],L_Cvalley];
Track_path(8,:) = [xHc,yHc,zHc,[-pi/8 0],L_Chill];
Track_path(9,:) = [xT,yT,zT,[0 pi],L_turn];
Track_path(10,:) = [xHc2,yHc2,zHc2,[-pi/8 0],L_Chill2];
Track_path(11,:) = [xR,yR,zR,[0 48.7409],L_ramp];

xplot = zeros(383,11);
zplot = zeros(383,11);
yplot = zeros(383,11);
lalong = zeros(383,11);
for i = 1:11 %use colorbar to create bar on side of graph
    stepsize = Track_path(i,4):.1:Track_path(i,5);
    for j=1:length(stepsize)
       xplot(j,i) =  double(subs(Track_path(i,1),stepsize(j)));
       yplot(j,i) =  double(subs(Track_path(i,2),stepsize(j)));
       zplot(j,i) =  double(subs(Track_path(i,3),stepsize(j)));
       lalong(j,i) = double(int(Track_path(i,6),s,0,stepsize(j)));
%        if j==1
%            lalong(j,i) = double(int(Track_path(i,6),s,0,stepsize(j)));
%        elseif j < length(stepsize)
%            lalong(j,i) = double(int(Track_path(i,6),s,stepsize(j),stepsize(j+1)));
%        end
    end
end

xplot = xplot';
yplot = yplot';
zplot = zplot';
lalong = lalong';

xplot2 = [xplot(1,1:296),xplot(2,1),xplot(3,1:79),xplot(4,1),xplot(5,1:12),xplot(6,1:58),xplot(7,1:17),xplot(8,1:4),xplot(9,1:32),xplot(10,4:-1:1),xplot(11,1:488)];
yplot2 = [yplot(1,1:296),yplot(2,1),yplot(3,1:79),yplot(4,1),yplot(5,1:12),yplot(6,1:58),yplot(7,1:17),yplot(8,1:4),yplot(9,1:32),yplot(10,4:-1:1),yplot(11,1:488)];
zplot2 = [zplot(1,1:296),zplot(2,1),zplot(3,1:79),zplot(4,1),zplot(5,1:12),zplot(6,1:58),zplot(7,1:17),zplot(8,1:4),zplot(9,1:32),zplot(10,4:-1:1),zplot(11,1:488)];
lalong2 = [lalong(1,1:296),lalong(2,1),lalong(3,1:79),lalong(4,1),lalong(5,1:12),lalong(6,1:58),lalong(7,1:17),lalong(8,1:4),lalong(9,1:32),lalong(10,4:-1:1),lalong(11,1:488)];
velreal = velocity(zplot2);

figure
hold on
plot3(xplot2,yplot2,zplot2)
surface([xplot2;xplot2],[yplot2;yplot2],[zplot2;zplot2],[velreal;velreal],'facecol','no','edgecolor','interp','linew',3)
c = colorbar;
c.Label.String = 'Speed [m/s]';
grid on
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
caxis([0 50]);

xlim([-25,270])
ylim([-150,5])
zlim([0,125])

%% Calculating G's
% Track_path(1,:) = [xD,yD,zD,[0 29.5226]];
% Track_path(2,:) = [xLi,yLi,zLi,[pi pi+0.0159]];
% Track_path(3,:) = [xL,yL,zL,[pi 7*pi/2]];
% Track_path(4,:) = [xLo,yLo,zLo,[-0.0159 0]];
% Track_path(5,:) = [xLe,yLe,zLe,[7*pi/2 31*pi/8]];
% Track_path(6,:) = [xH,yH,zH,[0 5.736041]];
% Track_path(7,:) = [xV,yV,zV,[1.1025*pi 13*pi/8]];
% Track_path(8,:) = [xHc,yHc,zHc,[-pi/8 0]];
% Track_path(9,:) = [xT,yT,zT,[0 pi]];
% Track_path(10,:) = [xHc2,yHc2,zHc2,[-pi/8 0]];
% Track_path(11,:) = [xR,yR,zR,[0 38.2]];
%drop portion
Gdrop = zeros(1,296);

%loop portion

g = 9.81;
r = 20;
velloop = velreal(1,297:(297+79));
velloopexit = velreal(1,(297+1+79):(297+1+79+12));

stepsize = Track_path(3,4):.1:Track_path(3,5);
Gloop = zeros(1,length(stepsize));
for j=1:length(stepsize)
    Gloop(j) = ((velloop(j))^2/(g*r)) - sin(stepsize(j));
end

stepsize = Track_path(5,4):.1:Track_path(5,5);
Gloop2 = zeros(1,length(stepsize));
for j=1:length(stepsize)
    Gloop2(j) = ((velloopexit(j))^2/(g*r)) - sin(stepsize(j));
end

%parabolic hill
%Track_path(6,:) = [xH,yH,zH,[0 5.736041]];
velparhill = velreal(1,391:449);
usez = zplot2(1,391:449);
usex = xplot2(1,391:449);
stepsize = Track_path(6,4):.1:Track_path(6,5);
Gparhill = zeros(1,length(stepsize));
i = 0;
for j=1:length(stepsize)
    %theta = atan((usez(j)/usex(j))*pi/180);
    %rhoboi(j) = double(subs(rho,stepsize(j)));
    Gparhill(j) = (125-usez(j))/(double(subs(rho,stepsize(j)))) - (125-usez(j))/(double(subs(rho,stepsize(j))));
    i = i+1;
end


%circular valley
r = 35;
velvalley = velreal(1,450:467);
stepsize = Track_path(7,4):.1:Track_path(7,5);
Gvalley = zeros(1,length(stepsize));
for j=1:length(stepsize)
    Gvalley(j) = ((velvalley(j))^2/(g*r)) - sin(stepsize(j));
end

%circular hill
r = 147.9116;
velchill = velreal(1,468:472);
stepsize = Track_path(8,4):.1:Track_path(8,5);
Gchill = zeros(1,length(stepsize));
for j=1:length(stepsize)
    Gchill(j) = -((velchill(j))^2/(g*r)) + abs(sin(stepsize(j)));
end

%banked turn
velbank = velreal(1,472:504);
stepsize = Track_path(9,4):.1:Track_path(9,5);
Gbank = zeros(1,length(stepsize));
for j=1:length(stepsize)
    Gbank(j) = abs(1/(cos(pi/3)));
end

%transition to last hill
r = 147.9116;
velchill2 = velreal(1,508:-1:504);
stepsize = Track_path(10,4):.1:Track_path(10,5);
Gchill2 = zeros(1,length(stepsize));
for j=1:length(stepsize)
    Gchill2(j) = -((velchill2(j))^2/(g*r)) + abs(sin(stepsize(j)));
end

%ending hill
velhill = velreal(1,509:887);
stepsize = Track_path(11,4):.1:Track_path(11,5);
Ghill = zeros(1,length(stepsize));
for j=1:length(stepsize)
    Ghill(j) = cos(pi/8);
end

Gtot = [Gdrop,2,Gloop,3,Gloop2,Gparhill,Gvalley,Gchill,Gbank,Gchill2,Ghill];
figure
plot(lalong2,velreal);