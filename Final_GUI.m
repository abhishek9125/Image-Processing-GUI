function varargout = Final_GUI(varargin)
% FINAL_GUI MATLAB code for Final_GUI.fig
%      FINAL_GUI, by itself, creates a new FINAL_GUI or raises the existing
%      singleton*.
%
%      H = FINAL_GUI returns the handle to a new FINAL_GUI or the handle to
%      the existing singleton*.
%
%      FINAL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_GUI.M with the given input arguments.
%
%      FINAL_GUI('Property','Value',...) creates a new FINAL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Final_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Final_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Final_GUI

% Last Modified by GUIDE v2.5 06-Sep-2019 22:34:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Final_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Final_GUI_OutputFcn, ...
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


% --- Executes just before Final_GUI is made visible.
function Final_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Final_GUI (see VARARGIN)

% Choose default command line output for Final_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Final_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Final_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in enhancement.
function enhancement_Callback(hObject, eventdata, handles)
% hObject    handle to enhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
enhancement

% --- Executes on button press in restoration.
function restoration_Callback(hObject, eventdata, handles)
% hObject    handle to restoration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
restoration


% --- Executes on button press in selectimage.
function selectimage_Callback(hObject, eventdata, handles)
% hObject    handle to selectimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[A B] = uigetfile('*.jpg;*.png;*.bmp','pick any file');
global p;
p = imread([B,A]);
setappdata(0,'p',p);
axes(handles.axes1)
imshow(p);
