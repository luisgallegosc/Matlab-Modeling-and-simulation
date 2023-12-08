function chi_cuadrado(M, k, alfa)
    R = 0;
    for i=1:k
        LI = (i-1)/k;
        LS = i/k;
        FO = 0;
        for j = M
            if (LI < j) && (j < LS)
                FO  = FO + 1;
            end
        end
        FE = k;
        X = ((FO-FE)^2)/FE;
        R = R + X;
    end
    disp(R);
end