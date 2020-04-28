function varargout = processing(varargin)
% PROCESSING MATLAB code for processing.fig
%      PROCESSING, by itself, creates a new PROCESSING or raises the existing
%      singleton*.
%
%      H = PROCESSING returns the handle to a new PROCESSING or the handle to
%      the existing singleton*.
%
%      PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESSING.M with the given input arguments.
%
%      PROCESSING('Property','Value',...) creates a new PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help processing

% Last Modified by GUIDE v2.5 08-Sep-2019 19:12:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @processing_OpeningFcn, ...
                   'gui_OutputFcn',  @processing_OutputFcn, ...
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


% --- Executes just before processing is made visible.
function processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to processing (see VARARGIN)
global p;
axes(handles.axes1);
imshow(p);
% Choose default command line output for processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in negative.
function negative_Callback(hObject, eventdata, handles)
% hObject    handle to negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
j=255-i(:,:,:);
imshow(j);


% --- Executes on button press in binary.
function binary_Callback(hObject, eventdata, handles)
% hObject    handle to binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
i=rgb2gray(i);
[r,c]=size(i);
for a=1:r
   for b=1:c
        if(i(a,b)<=128)
            j(a,b)=0;
        else
            j(a,b)=255;
       end
        
    end
end
imshow(j);

% --- Executes on button press in logtrans.
function logtrans_Callback(hObject, eventdata, handles)
% hObject    handle to logtrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
a = double(i)/255; % Normalized Image
c = 2; % Constant
f = c*log(1 + (a)); % Log Transform
imshow(f);

% --- Executes on button press in rotation.
function rotation_Callback(hObject, eventdata, handles)
% hObject    handle to rotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
[r,c,d]=size(i);
%for a=1:r
%    for b=1:c
%        j(r-a+1,b,1)=i(a,b,1);
%        j(r-a+1,b,2)=i(a,b,2);
%        j(r-a+1,b,3)=i(a,b,3);
%    end
%end
%imshow(j);
for a=1:r
    for b=1:c
        j(b,a,1)=i(a,b,1);
        j(b,a,2)=i(a,b,2);
        j(b,a,3)=i(a,b,3);
    end
end
imshow(j);

% --- Executes on button press in mirror.
function mirror_Callback(hObject, eventdata, handles)
% hObject    handle to mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
[r,c,d]=size(i);
for m=1:r
    for n=1:c
        for o=1:d
            a(m,c-n+1,o)=i(m,n,o);
        end
    end
end
imshow(a,[]);

% --- Executes on button press in contrast.
function contrast_Callback(hObject, eventdata, handles)
% hObject    handle to contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
[r,c,d]=size(i);
for a=1:r
   for b=1:c
       for x=1:d
            if(i(a,b,x)<128)
                i(a,b,x)=50;
            else
                i(a,b,x)=200;
            end
       end
    end
end
imshow(i);

% --- Executes on button press in powertans.
function powertans_Callback(hObject, eventdata, handles)
% hObject    handle to powertans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i = p;
p=im2double(i);
k=10;
z=20;
[r,c,d]=size(p);
for x=1:r
    for y=1:c
        a(x,y,1)=k*(p(x,y,1)^z);
        a(x,y,2)=k*(p(x,y,2)^z);
        a(x,y,3)=k*(p(x,y,3)^z);
    end
end
imshow(a);


% --- Executes on slider movement.
function brightness_Callback(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global p;
i=p;
b = get(hObject,'Value');
c=imadd(i,b);
imshow(c);

% --- Executes during object creation, after setting all properties.
function brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global p;

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
enhancement
