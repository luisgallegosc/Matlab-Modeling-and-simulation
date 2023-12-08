function Congruencial(a, b, m, X, n)
    arr = zeros(1, n);
    arr(1) = X/m; 
    for i=2:n+1
        x = X;
        X = mod((a * x + b), m);
        arr(i) = X/m;
    end
    disp(arr)
end