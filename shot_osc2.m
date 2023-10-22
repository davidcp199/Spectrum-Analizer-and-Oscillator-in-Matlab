function [y,i] = shot_osc2(x, N, d, Flanco)

% -----------------------------------------------
% x         Señal de entrada
% N         Tamaño de la ventana
% d         Umbral de disparo
% Flanco    Flanco Ascendente (1), Descendente (2) 
% i         Punto donde se produce el disparo
% -----------------------------------------------

switch Flanco
    case 1
        for n = 1:length(x)-3
            if (x(n) == d  && x(n+1) > d && (n+N) < length(x) && x(n+2) > d && x(n+3) > d)
                y = (x(n:n+N));
                i = n;
                break;
            else if (x(n) < d && x(n+1) > d && (n+N) < length(x) && x(n+2) > d && x(n+3) > d)
                y = (x(n+1:n+N+1));
                i = n;
                break;
            else 
                y = (x(n:end));
                i = n;
                end
            end
        end

        
    case 2
        for n = 1:length(x)-2
            if (x(n) == d && x(n+1) < d && (n+N) < length(x) && x(n+2) < d)
               y = (x(n:n+N));
               i=n;
               break;
            else if (x(n) > d && x(n+1) < d && (n+N) < length(x) && x(n+2) < d)
                y = (x(n+1:n+N));
                i=n;
                break;
            else 
                y = (x(n:end));
                i=n;
                end
            end
        end
    otherwise
        error('Opcion no valida. Selecciona una opcion valida.');
end

end