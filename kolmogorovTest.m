function kolmogorovTest(N, alfa, pseudoaleatorios)
    % Ordenar los datos pseudoaleatorios en orden ascendente.
    sorted_data = sort(pseudoaleatorios);

    % Calcular el tamaño de la muestra.
    n = length(pseudoaleatorios);

    % Inicializar el estadístico de prueba D.
    D = 0;

    % Calcular el estadístico de prueba D.
    for i = 1:N
        % Calcular la función de distribución observada en el paso i.
        FDO = sorted_data(i);

        % Calcular la función de distribución esperada en el paso i.
        FDE1 = i / N;

        % Calcular la función de distribución esperada en el paso i-1.
        FDE2 = (i - 1) / N;

        % Calcular las diferencias absolutas entre las funciones de distribución.
        m1 = abs(FDE1 - FDO);
        m2 = abs(FDO - FDE2);

        % Actualizar el estadístico de prueba D como el máximo de las diferencias.
        D = max([D, m1, m2]);
    end

    % Calcular el valor crítico para el nivel de significancia alfa.
    critical_value = sqrt(-0.5 * log(alfa / 2));

    % Mostrar el resultado de la prueba de hipótesis.
    if D <= critical_value
        fprintf('SI.\n');
    else
        fprintf('NO.\n');
    end

    % Mostrar el valor del estadístico de prueba D.
    fprintf('%.4f\n', D);
end
