function[res] = JacobiIterativeSolver(A, b, initGuess, dim, tolerance)
    % eleNum = dim * dim;
    X_k_min_1 = initGuess;
    X_k = initGuess;
    error = realmax;
    while error > tolerance
        for i = 1:dim
            Acc = 0;
            % Calculate Accumulation element:
            for j = 1:dim
                if j ~= i
                    temp = - (A(i, j) * X_k_min_1(j));
                    Acc = Acc + temp;
                end
            end
            X_k(i) = (1 / A(i, i)) * (Acc + b(i));
        end
        error = norm(X_k - X_k_min_1) / norm(X_k);
        X_k_min_1 = X_k;
    end
    res = X_k;
end