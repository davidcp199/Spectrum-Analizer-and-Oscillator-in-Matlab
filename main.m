close all;
clear all;

F = 1000;
Fs = 44100;
P = 1;
R = 0;
Fl = 1;
I = 1;
Amplitud = 1;
d = 0;
N = 45;

x = generador(I,F, Fs, P, R,Amplitud,3*pi/2);

% y = shot_osc2(x,P,d,Fl);
% 
% tiempo = (0:length(y)-1)/Fs;  % Vector con valores de tiempo [s]
% 
% plot(tiempo,y);
