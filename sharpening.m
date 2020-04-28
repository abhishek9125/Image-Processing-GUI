function varargout = sharpening(varargin)
% SHARPENING MATLAB code for sharpening.fig
%      SHARPENING, by itself, creates a new SHARPENING or raises the existing
%      singleton*.
%
%      H = SHARPENING returns the handle to a new SHARPENING or the handle to
%      the existing singleton*.
%
%      SHARPENING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHARPENING.M with the given input arguments.
%
%      SHARPENING('Property','Value',...) creates a new SHARPENING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sharpening_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sharpening_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sharpening

% Last Modified by GUIDE v2.5 08-Sep-2019 19:14:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sharpening_OpeningFcn, ...
                   'gui_OutputFcn',  @sharpening_OutputFcn, ...
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


% --- Executes just before sharpening is made visible.
function sharpening_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sharpening (see VARARGIN)

% Choose default command line output for sharpening
global p;
axes(handles.axes1);
imshow(p);
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sharpening wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sharpening_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in laplacian.
function laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
A=p;
sigma = 0.4;
alpha = 0.5;
B = locallapfilt(A, sigma, alpha);
imshow(B);

% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
% hObject    handle to canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
i=rgb2gray(i);
a=edge(i,'canny');
imshow(a);

% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
i=rgb2gray(i);
[r,c,d]=size(i);
i=im2double(i);
for m=2:r-1
    for n=2:c-1
        for o=1:d
            dfx=(-1)*i(m-1,n-1,o)+(0)*i(m-1,n,o)+(1)*i(m-1,n+1,o)+(-1)*i(m,n-1,o)+(0)*i(m,n,o)+(1)*i(m,n+1,o)+(-1)*i(m+1,n-1,o)+(0)*i(m+1,n,o)+1*i(m,n+1,o);
            dfy=(1)*i(m-1,n-1,o)+(1)*i(m-1,n,o)+(1)*i(m-1,n+1,o)+(0)*i(m,n-1,o)+(0)*i(m,n,o)+(0)*i(m,n+1,o)+(-1)*i(m+1,n-1,o)+(-1)*i(m+1,n,o)+(-1)*i(m,n+1,o);
            a(m,n,o)=sqrt(dfx*dfx+dfy*dfy);
        end
    end
end
imshow(a);

% --- Executes on button press in highboost.
function highboost_Callback(hObject, eventdata, handles)
% hObject    handle to highboost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
f = p;
a=size(f);
disp(a);

for x=2:449
    for y=2:599
        g(x,y)=f(x,y+1)+f(x,y-1)+f(x-1,y)+f(x+1,y)-4*f(x,y);
        %g(x,y)=-f(x,y+1)-f(x,y-1)-f(x-1,y)-f(x+1,y)+4*f(x,y);
        %g(x,y)=f(x-1,y-1)+f(x-1,y)+f(x-1,y+1)+f(x,y-1)-8*f(x,y)+f(x,y+1)+f(x+1,y-1)+f(x+1,y)+f(x+1,y+1);
       
    end;
end;
for x=2:449
    for y=2:599
d(x,y)=f(x,y)+g(x,y);
    end;
end;
imshow(d)

% --- Executes on button press in robert.
function robert_Callback(hObject, eventdata, handles)
% hObject    handle to robert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
i=rgb2gray(i);
b=im2double(i);
[r,c]=size(b);
%a(1:r,1:c)=0;
for m=1:r-1
    for n=1:c-1
        gx=b(m,n)-b(m+1,n+1);
        gy=b(m,n+1)-b(m+1,n);
        a(m,n)=sqrt(gx*gx+gy*gy);
    end
end
imshow(a);

% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
i=p;
i=rgb2gray(i);
[r,c,d]=size(i);
i=im2double(i);
for m=2:r-1
    for n=2:c-1
        for o=1:d
            dfx=(-1)*i(m-1,n-1,o)+(0)*i(m-1,n,o)+(1)*i(m-1,n+1,o)+(-2)*i(m,n-1,o)+(0)*i(m,n,o)+(2)*i(m,n+1,o)+(-1)*i(m+1,n-1,o)+(0)*i(m+1,n,o)+1*i(m,n+1,o);
            dfy=(-1)*i(m-1,n-1,o)+(-2)*i(m-1,n,o)+(-1)*i(m-1,n+1,o)+(0)*i(m,n-1,o)+(0)*i(m,n,o)+(0)*i(m,n+1,o)+(1)*i(m+1,n-1,o)+(2)*i(m+1,n,o)+1*i(m,n+1,o);
            a(m,n,o)=sqrt(dfx*dfx+dfy*dfy);
        end
    end
end
imshow(a);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
enhancement