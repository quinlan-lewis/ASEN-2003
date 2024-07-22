function [v_mod] = LCSMODEL(r,d,l,theta,w)
%outputs vertical speed of collar
w = w *(pi/180);
beta = asind((d-r*sind(theta))/l);
v_mod = -w*r*sind(theta)-(w*r*cosd(theta)*tand(beta));
end

