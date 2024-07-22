function [Tension_time, Tension_length] = Tension(w_0,C,t,L)
    %below is our derived equations of tension with respect to time and
    %length of the cord
    I = 0.0063;
    R = 0.076;
    Tension_time = (-2*I*w_0^3*t)/(R*(C + w_0^2*t^2)^2);
    Tension_length = (-2*C*w_0^2*(L/R))/(R*(C + (L/R)^2)^2);
end

