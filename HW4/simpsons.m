function y = simpsons(a, b, incr, fun)
% Check that the provided increment has sense for our purpose
if (b - a)/incr ~= floor((b - a)/incr)
    disp('Warning: increment must divide interval into equal subintervals')
    disp('Please change the increment')
    y = 'error';
    return
end

% Evaluate the function in the lower and upper limits
y1 = feval(fun, a);
y2 = feval(fun, b);

% Initialize the intervals
c = 0;
d = 0;

% Loop for each subinterval
for i = 1 : (b - a)/incr - 0.5

    % Calculate the function at each subinterval
    y = feval(fun, a + i*incr);

    % Interval even or odd?
    if i/2 == floor(i/2)

        % Sum all even-interval function values        
        d = d + y;
        continue
    else
        % Sum all odd-interval function values
        c = c + y;
        continue
    end
end

% Calculate integral
y = incr/3 * (y1 + 4*c + 2*d + y2);