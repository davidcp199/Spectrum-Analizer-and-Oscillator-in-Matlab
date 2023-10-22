function y = shot_osc(x, N, d, Flanco)

% -----------------------------------------------
% x         Señal de entrada
% N         Tamaño de la ventana
% d         Umbral de disparo
% Flanco    Flanco Ascendente (1), Descendente (2) 
% -----------------------------------------------

a = 0;
d = d * max(abs(x));


switch Flanco
    case 1
        for n = 1:length(x)-2
            if ((x(n) == d || x(n) > d) && x(n+1) > d && (n+N) < length(x) && x(n+2) > d  && a < 1)
                y = (x(n:n+N));
                
                a=2;
            else if (x(n) < d && x(n+1) > d && (n+N) < length(x) && x(n+2) > d  && a < 1)
                y = (x(n+1:n+N));
                a = 2;
            else if (a < 1)
                y = (x(n:end));
                end
                end
            end
        end
    case 2
        for n = 1:length(x)-2
            if (x(n) > d && x(n+1) < d && (n+N) < length(x) && x(n+2) < d && a<1)
                y = (x(n+1:n+N));
                a = 2;
            else if (a < 1)
                y = (x(n:end));
                end
            end
        end
    otherwise
        error('Opcion no valida. Selecciona una opcion valida.');
end


%hold off;
end