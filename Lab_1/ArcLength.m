function Length = ArcLength(upper,lower,x,y,z)
    syms t
    func = sqrt(x^2 + y^2 + z^2);
    funcdot = diff(func);
    
    intg = sqrt(1+funcdot);
    LenFunc = int(intg,t);
    Length = double(subs(LenFunc,t,upper)-subs(LenFunc,t,lower));
end