function[res] = GaussSeidelSolver(A, b, initGuess, dim, tolerance)
    X_k_min_1 = initGuess;
    X_k = initGuess;
    error = realmax;
    while error > tolerance
        for i = 1:dim
            AccCurr = 0;
            AccPrev = 0;
            % Calculate Accumulation element:
            for j = 1:dim
                if j ~= i
                    if j > i
                        temp = - (A(i, j) * X_k_min_1(j));
                        AccCurr = AccCurr + temp;
                    end
                    
                    if j < i
                        temp = -(A(i, j) * X_k(j));
                        AccPrev = AccPrev + temp;
                    end
                end
            end
            X_k(i) = (1 / A(i, i)) * (AccCurr + AccPrev + b(i));
        end
        error = norm(X_k - X_k_min_1) / norm(X_k);
        X_k_min_1 = X_k;
    end
    res = X_k;
end