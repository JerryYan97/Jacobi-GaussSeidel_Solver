mA = [10, -1, 2, 0; -1, 11, -1, 3; 2, -1, 10, -1; 0, 3, -1, 8];
mb = [6; 25; -11; 15];
initGuess = zeros(4, 1);

% mx = JacobiIterativeSolver(mA, mb, initGuess, 4, 0.001)
mx = GaussSeidelSolver(mA, mb, initGuess, 4, 0.001)