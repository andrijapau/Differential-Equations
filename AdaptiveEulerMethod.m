function [t,y] = AdaptiveEulerMethod(f,t0,tN,y0,h)
    % Set the Variables
    t = t0;
    y = y0;
    tol = 1*exp(-8);
    k = 1; 
    % Run while loop to check if the time step take is less then the final
    % time boundary
    while ((t(k)+h) < tN);
        % Set slope 1
        m1 = f(t(k),y(k));
        % Declare y and z
        Y = y(k) + h*m1;
        Z = y(k) + (h/2)*m1;
        % Declare new slope
        m1new = f(t(k),Z);
        % Update Y and Z according to new slope
        Z = Z + (h/2)*m1new;
        D = Z-Y;
        % Run while loop in order to check if D is within the set tolerance
        while (abs(D) >= tol) 
            % If not keep going through this loop to try and narrow the
            % window down
            h = 0.9*h*min(max(tol/abs(D),0.3),2);
            Y = y(k) + h*m1;
            Z = y(k) + (h/2)*(m1);
            m1new2 = f(t(k),Z);
            Z = Z + h*(m1new2)/2;
            D = Z-Y;
        end
        % Update output
        Y = Z+D;
        y = [y; Y];
        t = [t, t(k) + h]; 
        k = k+1;
    end
end