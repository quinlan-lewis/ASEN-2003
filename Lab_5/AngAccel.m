function [alpha_time,alpha_length] = AngAccel(w_0,C,t,L)
    %Below is our derived equations for alpha with respect to time and
    %length cord
    R = 0.076;
    alpha_time = w_0*((-4*C*(w_0^2)*t)/(C + (w_0^2)*t^2)^2);
    alpha_length = w_0*((-4*C*w_0*(L/R))/(C + (L/R)^2)^2);
end

