function x = generador(I,F, Fs, P, R,Amplitud,Fase)

% Datos
% I                          simplemente para el numero de figura
Duracion = (1/F)*P*200;          % Duracion = Periodo * Num. ciclos [s]
N_muestras = Duracion * Fs;  % Longitud de los vectores de muestras
tiempo = (0:N_muestras)/Fs;  % Vector con valores de tiempo [s]

k = round(N_muestras);

x = ones(0,k);

for ind=1:N_muestras 
    x(ind) = Amplitud*sin(2*pi*F*tiempo(ind)+Fase);  
end
r = R*randn(1, length(x)); 
x = x + r;

%   figure(1)
%    axis([0 length(x) -1 1]);
%    plot(x);
%    grid on;
 
% figure(2)
%  axis([0 length(y) -1 1]);
%  plot(tiempo,y);
%  grid on;
end