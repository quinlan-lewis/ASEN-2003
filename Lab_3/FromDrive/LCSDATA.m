function [theta_exp, w_exp, v_exp] = LCSDATA(data)
%read data
data1 = readtable(data);
%theta_exp is wheel position
% w_exp is wheel speed
% v_exp is slide speed
% subtract degree value
t1 = table2array(data1(:, 1));
wp1 = table2array(data1(:, 2));
sp1 = table2array(data1(:, 3));
ws1 = table2array(data1(:, 4));
ss1 = table2array(data1(:, 5));
rotat = floor(wp1(1)/360);
wp1 = wp1 - (rotat * 360);
endpt = find( wp1 < ((6 * 360) + wp1(1)));
theta_exp = wp1(1:endpt(end));
w_exp = ws1(1:endpt(end));
v_exp = ss1(1:endpt(end));
end

