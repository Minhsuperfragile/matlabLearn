function result = naiveGaussElimination(A,b)
  n = size(A);
  [A,b] = forwardElimination(A,b,n);
  result = backSubstitude(A,b,n);