function roots = newtonRaphson2Equations(f, J, initialGuess, maxIterations, tolerance)
    % Newton-Raphson method to find the roots of a system of two equations
    
    % f: Function handle representing the system of equations
    % J: Function handle representing the Jacobian matrix of the system
    % initialGuess: Initial guess for the roots
    % maxIterations: Maximum number of iterations
    % tolerance: Convergence tolerance
    
    % Initialize variables
    roots = initialGuess;
    iteration = 0;
    error = inf;
    
    % Perform iterations
    while error > tolerance && iteration < maxIterations
        % Evaluate the system of equations and the Jacobian matrix
        f_val = f(roots(1), roots(2));
        J_val = J(roots(1), roots(2));
        
        % Solve for the increments
        delta = J_val \ (-f_val);
        
        % Update the roots
        roots = roots + delta;
        
        % Calculate the error
        error = norm(delta);
        
        % Increment the iteration count
        iteration = iteration + 1;
    end
    
    % Check if the method converged
    if iteration >= maxIterations
        warning('Newton-Raphson method did not converge within the maximum number of iterations.');
    end
end