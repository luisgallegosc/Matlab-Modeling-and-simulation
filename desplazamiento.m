function desplazamiento(h, q, l, X, n)
    arr = zeros(1, n);
    %conversion de entero a cadena
    b = num2str(X);
    for i=q+1:(q*n)
        %conversion de cadena a double
        b = [b num2str(mod(str2double(b(i-h)) + str2double(b(i-q)), 2))];
    end
    y = 0;
    c = 1;
    %operaciones
    for i=1:n
        for j=l-1:-1:0
            y = y + str2double(b(c))*(2^j);
            c = c + 1;
        end
        arr(i) = y/(2^l);
        y = 0;
    end
    disp(arr);
end

