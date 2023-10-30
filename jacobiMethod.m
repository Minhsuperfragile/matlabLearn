function [x,er] = jacobiMethod(A,b)
    n = size(A);
    x = zeros(10,n(2));
    er = zeros(9,n(2));
    for ii = 1:1:10
        for col = 1:1:n(1)
            x(ii+1,col) = b(col);
            for c = 1:1:n(2)
                x(ii+1,col) = x(ii+1,col) - A(col,c)*x(ii,c);
            end
            x(ii+1,col) = (x(ii+1,col) + A(col,col)*x(ii,col))/A(col,col);
            er(ii,col) = abs((x(ii+1,col) - x(ii,col))/x(ii+1,col))*100;
        end
    end
end