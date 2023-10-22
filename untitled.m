function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled
% Last Modified by GUIDE v2.5 11-Jul-2023 09:03:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using untitled.
% if strcmp(get(hObject,'Visible'),'off')
%     plot(rand(5));
% end

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});




% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
Fs = 44100;

Ainput = analoginput('winsound');
addchannel(Ainput, 1);
addchannel(Ainput, 2);

%   -------------------------------------------------------------


while 1
    if get(hObject,'Value') == 1 %  On 

        set(Ainput,'SampleRate',Fs);
        
%--------------------------OSCILOSCOPIO---------------------------------------------
%________________________Configuraciones___________________________________


        Flanco = get(handles.trigger,'Value');
        Mode = get(handles.mode,'Value');
        desplx = get(handles.offset1,'Value');
        desply = get(handles.offset2,'Value');
        V_Div = V_div(get(handles.Vdiv,'Value'));
        Sec_div = S_div(get(handles.Sdiv,'Value'));
        Trigger = (get(handles.slider_trigger,'Value'));
        
        handles.slider_trigger.Min = -V_Div*6;
        handles.slider_trigger.Max = V_Div*6;
        handles.trigger_text.String = Trigger;
        set(handles.slider_trigger, 'SliderStep', [V_Div/6, V_Div]);
        
        handles.offset1.Min = -V_Div*6;
        handles.offset1.Max = V_Div*6;
        handles.of1_text.String = desplx;
        set(handles.offset1, 'SliderStep', [V_Div/3, V_Div]);
        
        handles.offset2.Min = -V_Div*6;
        handles.offset2.Max = V_Div*6;
        handles.of2_text.String = desply;
        set(handles.offset2, 'SliderStep', [V_Div/3, V_Div]);
        
        % Cursores Verticales

        handles.S_V_1.Min = -V_Div*6;
        handles.S_V_1.Max = V_Div*6;
        handles.S_V_2.Min = -V_Div*6;
        handles.S_V_2.Max = V_Div*6;
        
        axes(handles.axes1);
        if handles.B_V_1.Value == 1
            handles.V_1.String = handles.S_V_1.Value;
            line(get(gca, 'XLim'), [handles.S_V_1.Value, handles.S_V_1.Value], 'Color', 'g', 'LineWidth', 1);
        end
        if handles.B_V_2.Value == 1
            handles.V_2.String = handles.S_V_2.Value;
            line(get(gca, 'XLim'), [handles.S_V_2.Value, handles.S_V_2.Value], 'Color', 'g', 'LineWidth', 1);
        end
        if handles.B_V_1.Value == 1 && handles.B_V_2.Value == 1
            handles.V.String = handles.S_V_1.Value - handles.S_V_2.Value;
        end
        
        
        % Cursores Horizontales
        handles.S_H_1.Min = 0;
        handles.S_H_1.Max = Sec_div*6;
        handles.S_H_2.Min = 0;
        handles.S_H_2.Max = Sec_div*6;
        axis(handles.axes1);
        
         handles.B_H_1.SliderStep = [0.001 1];
         handles.B_H_2.SliderStep = [0.001 1];
        
        if handles.B_H_1.Value == 1
            handles.H_1.String = handles.S_H_1.Value*1000;
            line([handles.S_H_1.Value, handles.S_H_1.Value],[-V_Div*6 V_Div*6], 'Color', 'g', 'LineWidth', 1);
        end
        if handles.B_H_2.Value == 1
            handles.H_2.String = handles.S_H_2.Value*1000;
            line([handles.S_H_2.Value, handles.S_H_2.Value],[-V_Div*6 V_Div*6], 'Color', 'g', 'LineWidth', 1);
        end
        if handles.B_H_1.Value == 1 && handles.B_H_2.Value == 1
            handles.H.String = (handles.S_H_1.Value - handles.S_H_2.Value)*1000;
            handles.Hz.String = 1 / (handles.S_H_1.Value - handles.S_H_2.Value);
        end        

%_________________________Parámetros Representación________________________
        axes(handles.axes1);
        if Mode == 1 || Mode == 2 || Mode ==3
            xlabel('Sec/Div');                  
            ylabel('V/Div');
            axis([0 Sec_div*6 -V_Div V_Div]);
            xlim([0 Sec_div*6]);
            ylim([-V_Div*6 V_Div*6]);
            
            xtick = (0:Sec_div:Sec_div*6);
            ytick = (-V_Div*6:V_Div:V_Div*6);
            
           set(gca,'xtick',xtick);
           set(gca,'ytick',ytick);
           
        else % MODO X/Y
            xlabel('Channel 1');                  
            ylabel('Channel 2');
            axis([-1 1 -1 1]);
            set(gca,'xtick', [-1 -0.7 -0.35 0 0.35 0.7 1]);
            set(gca,'ytick', [-1 -0.7 -0.35 0 0.35 0.7 1]);
        end
        
        line(get(gca, 'XLim'), [0, 0], 'Color', 'k', 'LineWidth', 1);
        
%________________________Adquisision de Datos y Disparo_____________________________
        
        start(Ainput);
        pause(0.2);
        datos = getdata(Ainput);
        if get(handles.pause,'Value') == 0 % Modo Pause desactivado
            x = datos(:,1);
            y = datos(:,2);
        end
        
%         if get(handles.Auto_Scale,'Value') == 1
%             if max(x) < 0.05
%                 handles.Vdiv.Value = 0;
%             else if max(x) < 0.1
%                 handles.Vdiv.Value = 1;
%             else if max(x) < 0.2
%                 handles.Vdiv.Value = 2;
%             else if max(x) < 0.4
%                 handles.Vdiv.Value = 3;
%             else if max(x) < 0.8
%                 handles.Vdiv.Value = 4;
%                 end; end; end; end;end;end;
        
        N = floor((Sec_div * 6)*Fs);
        
        if Mode == 3  
                [x_t,i] = shot_osc2(x,N,Trigger,Flanco);
                if (i+N) < length(y)
                    y_t = y(i:i+N);
                else
                    y_t = y(i:end);
                end

        else
            y_t = shot_osc2(y,N,Trigger,Flanco);
            x_t = shot_osc2(x,N+100,Trigger,Flanco);
            %disp(length(x_t));
            %disp(N);
        end

        
        % Autoset P-P
        if handles.Autoset.Value == 1 && Mode ~= 4
            switch Mode
                case 1
                    handles.S_V_1.Value = max(x_t);
                    handles.S_V_2.Value = min(x_t);
                case 2 
                    handles.S_V_1.Value = max(y_t);
                    handles.S_V_2.Value = min(y_t); 
                case 3
                    if max(x_t) > max (y_t)
                        handles.S_V_1.Value = max(x_t);
                        handles.S_V_2.Value = min(x_t); 
                    else
                        handles.S_V_1.Value = max(y_t);
                        handles.S_V_2.Value = min(y_t); 
                    end
            end 
        end
        
        if handles.Pico.Value == 1 && Mode ~= 4 && handles.Autoset.Value == 0
            switch Mode
                case 1
                    handles.S_V_1.Value = max(x_t);
                    handles.S_V_2.Value = 0;
                case 2 
                    handles.S_V_1.Value = max(y_t);
                    handles.S_V_2.Value = 0; 
                case 3
                    if max(x_t) > max (y_t)
                        handles.S_V_1.Value = max(x_t);
                        handles.S_V_2.Value = 0; 
                    else
                        handles.S_V_1.Value = max(y_t);
                        handles.S_V_2.Value = 0; 
                    end
            end 
        end
        
       

                
%____________________________Representación Osciloscopio__________________________

%     L=20;
%     xi = x_t;
%     xi(end+L-1,:) = 0;
%     xi = xi(1:end);
%    
%   b = L * fir1(100, 1/L); % Diseña filtro FIR de orden 100
% 
%   x_filt=filter(b,1,xi);% Filtra
% 
% 
% x_filt = x_filt(L*4.7235:end);
% x_filte = x_filt/max(x_filt);
%   
% xinter = x_filte;
% disp(length(x_filt));
%disp(length(xinter));
 
%xinter = x_t;
tiempox = (0:length(x_t)-1)/Fs;  % Vector con valores de tiempo [s]
tiempoy = (0:length(y_t)-1)/Fs;  % Vector con valores de tiempo [s]

        switch Mode
            case 1 % Canal 1
                hold off;
                plot(tiempox,x_t+desplx);
                
            case 2 % Canal 2
                hold off;
                plot(tiempoy,y_t+desply,'r');
                
            case 3 % MODO DUAL
                hold off;
                plot(tiempox,x_t+desplx);
                hold on;
                plot(tiempoy,y_t+desply,'r');
                
            case 4 % MODO XY
                if (length(x)>length(y))
                    x = x(1:length(y));
                else
                    y = y(1:length(x));
                end
                hold off;
                plot(x,y);
                hold on;

        end
        axis square; grid on;
        
%-----------------------Analizador de Espectros-----------------------------------
%____________________________Configuraciones______________________________________
         
         if (get(handles.B_SPAN,'Value')) == 0
            f_ini = str2double(get(handles.in,'String'));
            f_end = str2double(get(handles.en,'String'));
         else % Si está SPAN activado
             c_f = str2double(get(handles.C_F,'String'));
             sp = str2double(get(handles.SPAN,'String'));
            f_ini = c_f - sp/2;
            f_end = c_f + sp/2;
         end
         
         escala = get(handles.Scale,'Value');
         window = get(handles.t_window,'Value');
         m_sa = get(handles.mode_sa,'Value');
         
         handles.s1_ae.Min = f_ini;
         handles.s1_ae.Max = f_end;
         handles.S2_ae.Min = f_ini;
         handles.S2_ae.Max = f_end;
         
         handles.s1_ae.SliderStep = [0.001 1];
         handles.S2_ae.SliderStep = [0.001 1];
         
         
         switch get(handles.resolution,'Value');
             case 1
                 res = 100;
                 p_fft = 1024;
             case 2
                 res = 250;
                 p_fft = 4096;
             case 3
                 res = 500;
                 p_fft = 8192;
             case 4
                 res = 1000;
                 p_fft = 16384;
         end 


          
        axes(handles.sa);
        hold off
          
        
        
%____________________________Algoritmo SA________________________________________    
    if get(handles.pause,'Value') == 0
        x_sa = datos(:,1) - mean(datos(:,1));
        y_sa = datos(:,2) - mean(datos(:,2));
    end

        modulo = analizador(x_sa,y_sa,Fs,res,window,m_sa,p_fft);
     
%____________________________REPRESENTACION________________________________________    

         axes(handles.sa);
         
          f = (Fs/p_fft*(0:p_fft-1))/1000;
              
          if escala == 1
            plot(f,20*log10(modulo(1:p_fft)/max(modulo(1:p_fft))));
            axis([f_ini f_end -60 0]);
            xlabel('f(kHz)')
            ylabel('dB')
          else
            plot(f,(modulo(1:p_fft)/max(modulo(1:p_fft))));
            axis([f_ini f_end 0 1]);
            xlabel('f(kHz)')
            ylabel('')
          end

         
         line(get(gca, 'XLim'), [0, 0], 'Color', 'k', 'LineWidth', 1);
         
         
         % Cursores 
         if handles.B1_sa.Value == 1
            handles.C1_ae.String = handles.s1_ae.Value;
            line([handles.s1_ae.Value, handles.s1_ae.Value],[-60 1], 'Color', 'g', 'LineWidth', 1);
         end
         if handles.B2_sa.Value == 1
            handles.C2_ae.String = handles.S2_ae.Value;
            line([handles.S2_ae.Value, handles.S2_ae.Value],[-60 1], 'Color', 'g', 'LineWidth', 1);
         end
         if handles.B2_sa.Value == 1 && handles.B1_sa.Value == 1
            handles.v_bw.String = 1* abs(handles.s1_ae.Value - handles.S2_ae.Value);
         end
         
          switch p_fft
             case 1024
                 legend('FFT = 1024');
             case 4096
                 legend('FFT = 4096');
             case 8192
                 legend('FFT = 8192');
             case 16384
                 legend('FFT = 16384');
         end 
         
         axis square; grid on;
         hold on
            
    else % Apagado
        delete(Ainput);
        cla;
        hold off;
        axes(handles.axes1);
        cla;
        hold off;
        break;
    end
end

% --- Executes during object creation, after setting all properties.
function trigger_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', {'Up', 'Down'});

% --- Executes on selection change in trigger.
function trigger_Callback(hObject, eventdata, handles)
% hObject    handle to trigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns trigger contents as cell array
%        contents{get(hObject,'Value')} returns selected item from trigger


% --- Executes on selection change in mode.
function mode_Callback(hObject, eventdata, handles)
% hObject    handle to mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mode


% --- Executes during object creation, after setting all properties.
function mode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Channel 1', 'Channel 2','Dual Mode','XY Mode'});


% --- Executes on slider movement.
function offset1_Callback(hObject, eventdata, handles)
% hObject    handle to offset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function offset1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function offset2_Callback(hObject, eventdata, handles)
% hObject    handle to offset2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function offset2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in Vdiv.
function Vdiv_Callback(hObject, eventdata, handles)
% hObject    handle to Vdiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Vdiv contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Vdiv


% --- Executes during object creation, after setting all properties.
function Vdiv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vdiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', {'0.05', '0.1','0.2','0.4','0.8'});


% --- Executes on selection change in Sdiv.
function Sdiv_Callback(hObject, eventdata, handles)
% hObject    handle to Sdiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Sdiv contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Sdiv


% --- Executes during object creation, after setting all properties.
function Sdiv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sdiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', {'0.0001','0.0002','0.0005','0.001','0.002','0.005','0.01','0.02','0.05'});


% --- Executes on slider movement.
function slider_trigger_Callback(hObject, eventdata, handles)
% hObject    handle to slider_trigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_trigger_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_trigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function S_V_1_Callback(hObject, eventdata, handles)
% hObject    handle to S_V_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_V_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S_V_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function S_V_2_Callback(hObject, eventdata, handles)
% hObject    handle to S_V_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_V_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S_V_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in B_V_1.
function B_V_1_Callback(hObject, eventdata, handles)
% hObject    handle to B_V_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_V_1


% --- Executes on button press in B_V_2.
function B_V_2_Callback(hObject, eventdata, handles)
% hObject    handle to B_V_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_V_2


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on slider movement.
function S_H_1_Callback(hObject, eventdata, handles)
% hObject    handle to S_H_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_H_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S_H_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in B_H_1.
function B_H_1_Callback(hObject, eventdata, handles)
% hObject    handle to B_H_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_H_1


% --- Executes on slider movement.
function S_H_2_Callback(hObject, eventdata, handles)
% hObject    handle to S_H_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_H_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S_H_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in B_H_2.
function B_H_2_Callback(hObject, eventdata, handles)
% hObject    handle to B_H_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_H_2


% --- Executes on button press in V_Autoset.
function V_Autoset_Callback(hObject, eventdata, handles)
% hObject    handle to V_Autoset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Autoset.
function Autoset_Callback(hObject, eventdata, handles)
% hObject    handle to Autoset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Autoset


% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton22



function in_Callback(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in as text
%        str2double(get(hObject,'String')) returns contents of in as a double


% --- Executes during object creation, after setting all properties.
function in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mode_sa.
function mode_sa_Callback(hObject, eventdata, handles)
% hObject    handle to mode_sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mode_sa contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mode_sa


% --- Executes during object creation, after setting all properties.
function mode_sa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mode_sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in t_window.
function t_window_Callback(hObject, eventdata, handles)
% hObject    handle to t_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns t_window contents as cell array
%        contents{get(hObject,'Value')} returns selected item from t_window


% --- Executes during object creation, after setting all properties.
function t_window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in resolution.
function resolution_Callback(hObject, eventdata, handles)
% hObject    handle to resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns resolution contents as cell array
%        contents{get(hObject,'Value')} returns selected item from resolution


% --- Executes during object creation, after setting all properties.
function resolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function en_Callback(hObject, eventdata, handles)
% hObject    handle to en (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of en as text
%        str2double(get(hObject,'String')) returns contents of en as a double


% --- Executes during object creation, after setting all properties.
function en_CreateFcn(hObject, eventdata, handles)
% hObject    handle to en (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton19


% --- Executes on slider movement.
function s1_ae_Callback(hObject, eventdata, handles)
% hObject    handle to s1_ae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s1_ae_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1_ae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in B1_sa.
function B1_sa_Callback(hObject, eventdata, handles)
% hObject    handle to B1_sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B1_sa


% --- Executes on slider movement.
function s2_ae_Callback(hObject, eventdata, handles)
% hObject    handle to s2_ae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s2_ae_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2_ae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in B2_sa.
function B2_sa_Callback(hObject, eventdata, handles)
% hObject    handle to B2_sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B2_sa


% --- Executes on slider movement.
function S2_ae_Callback(hObject, eventdata, handles)
% hObject    handle to S2_ae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S2_ae_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S2_ae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object deletion, before destroying properties.
function s1_ae_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to s1_ae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function v_bw_Callback(hObject, eventdata, handles)
% hObject    handle to v_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_bw as text
%        str2double(get(hObject,'String')) returns contents of v_bw as a double


% --- Executes during object creation, after setting all properties.
function v_bw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in B_SPAN.
function B_SPAN_Callback(hObject, eventdata, handles)
% hObject    handle to B_SPAN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_SPAN



function C_F_Callback(hObject, eventdata, handles)
% hObject    handle to C_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_F as text
%        str2double(get(hObject,'String')) returns contents of C_F as a double


% --- Executes during object creation, after setting all properties.
function C_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SPAN_Callback(hObject, eventdata, handles)
% hObject    handle to SPAN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SPAN as text
%        str2double(get(hObject,'String')) returns contents of SPAN as a double


% --- Executes during object creation, after setting all properties.
function SPAN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SPAN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Scale.
function Scale_Callback(hObject, eventdata, handles)
% hObject    handle to Scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Scale contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Scale


% --- Executes during object creation, after setting all properties.
function Scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pause


% --- Executes on button press in Auto_Scale.
function Auto_Scale_Callback(hObject, eventdata, handles)
% hObject    handle to Auto_Scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Auto_Scale


% --- Executes on button press in Pico.
function Pico_Callback(hObject, eventdata, handles)
% hObject    handle to Pico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Pico
