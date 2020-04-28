function varargout = enhancement(varargin)
% ENHANCEMENT MATLAB code for enhancement.fig
%      ENHANCEMENT, by itself, creates a new ENHANCEMENT or raises the existing
%      singleton*.
%
%      H = ENHANCEMENT returns the handle to a new ENHANCEMENT or the handle to
%      the existing singleton*.
%
%      ENHANCEMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENHANCEMENT.M with the given input arguments.
%
%      ENHANCEMENT('Property','Value',...) creates a new ENHANCEMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before enhancement_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to enhancement_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help enhancement

% Last Modified by GUIDE v2.5 06-Sep-2019 22:17:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @enhancement_OpeningFcn, ...
                   'gui_OutputFcn',  @enhancement_OutputFcn, ...
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


% --- Executes just before enhancement is made visible.
function enhancement_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to enhancement (see VARARGIN)

% Choose default command line output for enhancement
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes enhancement wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = enhancement_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sharpening.
function sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
sharpening

% --- Executes on button press in processing.
function processing_Callback(hObject, eventdata, handles)
% hObject    handle to processing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
processing


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
Final_GUI
