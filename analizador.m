function modulo = analizador(x,y,Fs,R,tipo_ventana,mode,p_fft)

 M = 2*Fs/R; % Numero de muestras para cada ventana

switch tipo_ventana
     case 1
        ventana=(1/M)*ones(1,fix(M)); % Ventana Rectangular
     case 2
        ventana=(1/M)*bartlett(fix(M))'; % Ventana Barltett
     case 3
        ventana=(1/M)*hamming(fix(M))'; % Ventana Hamming
     case 4
        ventana=(1/M)*blackman(fix(M))'; % Ventana Blackman
     case 5
        ventana=(1/M)*hann(fix(M))'; % Ventana Hanning
 end

 
switch mode
 case 1
   v = ventana.*x(1:M)';
   X  = fft(v,p_fft);
   modulo = abs(X);
   
 case 2
   v = ventana.*y(1:M)';
   X = fft(v,p_fft);
   modulo = abs(X);
   
 case 3
   v = ventana.*x(1:M)';
   w = ventana.*y(1:M)';

   X = fft(v,p_fft);
   Y = fft(w,p_fft);
   
   modulo = abs(X)+abs(Y);
end