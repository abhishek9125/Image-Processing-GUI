function varargout = restoration(varargin)
% RESTORATION MATLAB code for restoration.fig
%      RESTORATION, by itself, creates a new RESTORATION or raises the existing
%      singleton*.
%
%      H = RESTORATION returns the handle to a new RESTORATION or the handle to
%      the existing singleton*.
%
%      RESTORATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESTORATION.M with the given input arguments.
%
%      RESTORATION('Property','Value',...) creates a new RESTORATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before restoration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to restoration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help restoration

% Last Modified by GUIDE v2.5 06-Sep-2019 22:23:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @restoration_OpeningFcn, ...
                   'gui_OutputFcn',  @restoration_OutputFcn, ...
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

% --- Executes just before restoration is made visible.
function restoration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to restoration (see VARARGIN)
global p;
axes(handles.axes1);
imshow(p);
% Choose default command line output for restoration
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes restoration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = restoration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in gaissian.
function gaissian_Callback(hObject, eventdata, handles)
% hObject    handle to gaissian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
A = p;
J = imnoise(A,'gaussian')
imshow(J);

% --- Executes on button press in poisson.
function poisson_Callback(hObject, eventdata, handles)
% hObject    handle to poisson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
A = p;
J = imnoise(A,'poisson');
imshow(J);

% --- Executes on button press in saltandpepper.
function saltandpepper_Callback(hObject, eventdata, handles)
% hObject    handle to saltandpepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
I=p;
J = imnoise(I,'salt & pepper')
imshow(J);

% --- Executes on button press in rayleigh.
function rayleigh_Callback(hObject, eventdata, handles)
% hObject    handle to rayleigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;


% --- Executes on button press in speckle.
function speckle_Callback(hObject, eventdata, handles)
% hObject    handle to speckle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
A=p;
J = imnoise(A,'speckle')
imshow(J);

% --- Executes on button press in uniform.
function uniform_Callback(hObject, eventdata, handles)
% hObject    handle to uniform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
Final_GUI
