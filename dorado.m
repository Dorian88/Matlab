function [xopt, fx, iter, ea] = dorado(xlow, xhigh, maxiter, fun)
    es = 0.00001;
    R = 0.6180;
    xl = xlow;
    xu = xhigh;
    iter = 1;
    d = R*(xu - xl);
    x1 = xl + d;
    x2 = xu - d;
    f = inline(fun);
    f1 = f(x1);
    f2 = f(x2);
    if f1 > f2
        xopt = x1;
        fx = f1;
    else
        xopt = x2;
        fx = f2;
    end
    
    while 1
        d = R * d;
        if f1 > f2
            xl = x2;
            x2 = x1;
            x1 = xl + d;
            f2 = f1;
            f1 = f(x1);
        else
            xu = x1;
            x1 = x2;
            x2 = xu - d;
            f1 = f2;
            f2 = f(x2);
        end
        iter = iter + 1;
        if f1 > f2
            xopt = x1;
            fx = f1;
        else
            xopt = x2;
            fx = f2;
        end
        if xopt ~= 0
            ea = (1-R) * abs((xu - xl) / xopt) * 100;
        end
        if ea < es || iter >= maxiter
            break;
        end
    end
end