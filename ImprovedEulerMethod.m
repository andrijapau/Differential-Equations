function y = IEM(t0,tN,y0,h,diffeq)
    % Define Span of inependant Values
    t = t0:h:tN;
    % Initial Conditions
    t(1) = t0;
    y(1) = y0;
    % Set-Up Loop in order to keep updated the required dependent values
    for k = 1:length(t)-1
        m1 = diffeq(t(k),y(k));
        m2 = diffeq(t(k) + h, y(k) + h*m1);
        y(k+1) = y(k) + h*(m1+m2)/2;
    end
end