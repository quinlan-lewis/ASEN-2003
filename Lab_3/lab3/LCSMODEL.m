function [v_mod] = LCSMODEL(r,d,l,theta,w)
%outputs vertical speed of collar
w = w *pi/180; %Change to rad
beta = asin((d-r*sind(theta))/l);
v_mod = -w*r*sind(theta)-(w*r*cosd(theta)*tan(beta));
end

