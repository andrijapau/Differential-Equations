function [t,x] = solvesystem_paurevi1(f1,f2,t0,tN,x0,h)
    t = t0:h:tN;
    % Setting up the initial conditions
    t(1) = t0;
    x1(1) = x0(1);
    x2(1) = x0(2);
    accum = 1;
    while ((t(accum)+h) < tN)
        % Finding the slopes at t(k) and t(k) + h for both variables.
        m11 = f1(t(accum),x1(accum),x2(accum));
        m12 = f2(t(accum),x1(accum),x2(accum));
        m21 = f1(t(accum) + h, x1(accum) + h*m11, x2(accum) + h*m12);
        m22 = f2(t(accum) + h, x1(accum) + h*m11, x2(accum) + h*m12);
        
        % Using the slope values to find the Improved Euler Method solution.
        X1 = x1(accum) + h*(m11+m21)/2;
        X2 = x2(accum) + h*(m12+m22)/2;
        
        % Adding the next variable values into each array.
        x1 = [x1; X1];
        x2 = [x2; X2];
        t = [t, t(accum) + h]; 
        % Increment
        accum = accum+1;
    end
    x.x1 = x1;
    x.x2 = x2;
end