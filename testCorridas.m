function testCorridas(secuencia)
    %create a new function for guard the new numbers
    newArr = zeros(1,length(secuencia)-1);
    n =0;
    for i = 2:length(secuencia)
        n=n+1;
        if secuencia(i) > secuencia(i-1)
            newArr(n) = 1 ;
        end
    end
    aux1=1;
    aux0=0;
    cont=0;
    
    if newArr(1) == 0
        aux=aux1;
        aux1=aux0;
        aux0=aux;
    end
    disp('Secuencia modificada:');
    disp(newArr);
    matriz =[];
    for i = 1:length(newArr)
        
        if aux1==newArr(i)
            cont=cont+1;
        else 
            if cont >= 2
                cont =2;
            end
            buscar = [1, cont, aux1];
            buscar = buscar(2);  
            
            if ~isempty(matriz) && size(matriz, 2) >= 2
                indice = find(matriz(:, 2) == buscar);
            else
                indice = [];
            end


            if isempty(indice)
                matriz = [matriz; 1, cont, aux1];
            else 
                matriz(indice, 1) = matriz(indice, 1) + 1;
            end
            aux=aux1;
            aux1=aux0;
            aux0=aux;
            cont=1;
        end
    end
    if cont >= 2
        cont =2;
    end
    buscar = [1, cont, aux1];
            buscar = buscar(2);  
            
            if ~isempty(matriz) && size(matriz, 2) >= 2
                indice = find(matriz(:, 2) == buscar);
            else
                indice = [];
            end
    if isempty(indice)
        matriz = [matriz; 1, cont, aux1];
    else 
        matriz(indice, 1) = matriz(indice, 1) + 1;
    end
    
    j1= 1;
    j2= 2;
    N=99;
    i=j1;
    if i < N - 1
        
        FEi1 = 2*((N*(i^2 + 3*i +1) -(i^3 + 3 * i^2 - i - 4))/( factorial(i + 3)));
        
    else
        FEi1 = factorial(N) / 2;
    end
    i=j2;
    if i < N - 1
        
        FEi2 = 2*((N*(i^2 + 3*i +1) -(i^3 + 3 * i^2 - i - 4))/( factorial(i + 3)))
    else
        FEi2 = factorial(N) / 2;
    end

    FE1= (matriz(2,1)-FEi1)^2/FEi1;
    FE2 =(matriz(1,1)-FEi2)^2/FEi2;
    
    disp('Chicuadrado');
    disp(FE1+FE2);
   
end

