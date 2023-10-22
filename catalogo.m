function catalogo(Frec1, Frec2, Amp1, Amp2, Fase1, Fase2,nombre1,nombre2,nombre3)
    Fs = 44100;                   % Frecuencia de muestreo [Hz]
    P = 500;
    % Genero los vectores de canales y archivo de audio
    c1 = generador(1,Frec1,Fs,P,0,Amp1,Fase1);
    c2 = generador(2,Frec2,Fs,P,0,Amp2,Fase2);

    wavwrite(c1, Fs, 16, nombre1);
    wavwrite(c2, Fs, 16, nombre2);
    
    % Para concatenar en tono tienen que tener la misma longitud
    if length(c1) > length(c2)
        c1 = c1(1:length(c2));
    else 
       c2 = c2(1:length(c1)); 
    end

    tono = [c1' c2'];
    
    wavwrite(tono, Fs, 16, nombre3);
end
