function [t,y] = DE2_paurevi1(p, q, g, t0, tN, y0, y1, h)
    % Initial conditions declaration
    t(1) = t0;
    t(2) = t0 + h;
    y(1) = y0;
    % y1 is the IC of the derivative.
    y(2) = y0 + y1*h;   

    k = 2;  
    
    % Initializing the first derivative
    diffy(1) = 0;
    diffy(2) = (y(2) - y(1))/h;
    
    while ((t(k)+h) < tN)
       % updating Y 
       % we get the following by rearranging: 
       % y[n+1] = y''[n+1]*h^2 + 2*y[n] - y[n-1].
       % Where y''[n+1] = -p(t)*y' - q(t)*y + g(t)
       Y = 2*y(k) - y(k-1) + (-p(t(k))*diffy(k) - q(t(k))*y(k) + g(t(k)))*h^2;
       % Updating the derivative of y
       DIFFY = (Y - y(k))/h;
       % Updating the array.
       y = [y, Y];
       diffy = [diffy, DIFFY];
       % Incrementing in order to keep looping
       t = [t, t(k) + h];
       k = k + 1;
    end
end