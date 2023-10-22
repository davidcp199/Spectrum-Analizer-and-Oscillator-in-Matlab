function shot(x, N, d, Flanco)

% -----------------------------------------------
% x         Señal de entrada
% N         Tamaño de la ventana
% d         Umbral de disparo
% Flanco    Flanco Ascendente (1), Descendente (2) 
% -----------------------------------------------

a = 0;
d = d * max(abs(x));

%figure(1)
%grid on

Duracion = (1/1000)*10;          % Duracion = Periodo * Num. ciclos [s]
N_muestras = Duracion * 44100;  % Longitud de los vectores de muestras
tiempo = (0:N_muestras)/44100;


switch Flanco
    case 1
        for n = 1:length(x)-2
            if ((x(n) == d || x(n) > d) && x(n+1) > d && (n+N) < length(x) && x(n+2) > d  && a < 1)
                plot(tiempo(n:n+N),x(n:n+N));  
                a = 2;
            else if (x(n) < d && x(n+1) > d && (n+N) < length(x) && x(n+2) > d  && a < 1)
                plot(tiempo(n+1:n+N),x(n+1:n+N));
                %ylim([-1,1]);   
                %xlim([0,140]);   
                a = 2;
                end
            end
        end
    case 2
        for n = 1:length(x)-2
            if (x(n) > d && x(n+1) < d && (n+N) < length(x) && x(n+2) < d)
                plot(tiempo(n+1:n+N),x(n+1:n+N)); 
                n = n+n;
            end
        end
    otherwise
        error('Opcion no valida. Selecciona una opcion valida.');
end


%hold off;
end
