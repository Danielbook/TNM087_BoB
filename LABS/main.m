% LAB 1
%% TASK 1
filename='einstein.jpg';
nopts = 3;
[ImSize, ImType, BitPerPixel, MaxMin, RGBpts, figh ] = BasicImageInfo( filename, nopts);

filename='elephant.jpg';
nopts = 3;
[ImSize, ImType, BitPerPixel, MaxMin, RGBpts, figh ] = BasicImageInfo( filename, nopts);

%% TASK 2
filename='BoldRedEye.JPG';
rows=[100:1:200];
cols=[100:1:200];
box=[150,150,100,100];

SimpleReplace(filename, rows, cols, box );

%% TASK 3
FImage='einstein.jpg';

EllipsMask(FImage);

%% TASK 4
OImage='BoldRedEye.JPG';
CImage = WhitePoint(OImage,type);

%% TASK 5
