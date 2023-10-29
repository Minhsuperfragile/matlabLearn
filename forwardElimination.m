function [upperTriangularMatrix,b] = forwardElimination(Array,b,arraySize)
  rowOfArray = arraySize(1,1);
  columnOfArray = arraySize(1,2);
  for pivotRow = 1:1:(rowOfArray-1)
%  Partial pivoting
    [Array,b] = sortArrayForLargestPivot([Array,b],arraySize,pivotRow);
    for nextRow = (pivotRow+1):1:rowOfArray
      ratio = Array(nextRow,pivotRow) / Array(pivotRow,pivotRow);
      for Column = pivotRow:1:columnOfArray
        Array(nextRow,Column) = Array(nextRow,Column) - ratio*Array(pivotRow,Column);
      end
      b(nextRow) = b(nextRow) - ratio*b(pivotRow);
    end
  end
  upperTriangularMatrix = Array;
end