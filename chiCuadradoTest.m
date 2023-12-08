function chiCuadradoTest(k,pseudoaleatorios, alfa)
    % Inicializar el estadístico de prueba R.
    R = 0;

    % Calcular el tamaño de la muestra.
    n = length(pseudoaleatorios);

    % Calcular el número esperado de observaciones en cada intervalo.
    expected_counts = n / k;

    % Calcular el estadístico de prueba R.
    for i = 1:k
        LI = (i - 1) / k;
        LS = i / k;
        FO = sum((pseudoaleatorios >= LI) & (pseudoaleatorios < LS));
        FE = expected_counts;
        X = ((FO - FE)^2) / FE;
        R = R + X;
    end

    % Calcular el valor crítico para el nivel de significancia alfa.
    alpha_values = [0.10, 0.05, 0.01];
    critical_values = [12.017, 15.5073, 20.090]; % Valores críticos para k-1 grados de libertad
    critical_value = interp1(alpha_values, critical_values, alfa);

    % Mostrar el resultado de la prueba de hipótesis.
    if R <= critical_value
        fprintf('SI.\n');
    else
        fprintf('NO.\n');
    end

    fprintf(' %.4f\n', R);;
end
