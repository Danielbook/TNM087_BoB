% LAB 1
%% TASK 1
filename='elephant.jpg';
nopts = 1;
[ImSize, ImType, BitPerPixel, MaxMin, RGBpts, figh ] = BasicImageInfo( filename, nopts);

%% TASK 2
filename='elephant.jpg';
rows = 10;
cols = 10;
sr = 50;
sc = 50;
size1 = 10;
size2 = 10;
box = [sr,sc,size1,size2];

SimpleReplace(filename, rows, cols, box );

%% TASK 3
filename='einstein.jpg';
