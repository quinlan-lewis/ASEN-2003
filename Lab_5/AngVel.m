function [omega] = AngVel(w_0,C,t)
    %below is our derived equation for calculating omega
    omega = w_0*((C - w_0^2*t^2)/(C + w_0^2*t^2));
end

