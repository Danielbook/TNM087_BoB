% LAB 1
%% TASK 1
filename='einstein.jpg';
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

CImage = WhitePoint(OImage,'d');
imshow(CImage);

%% TASK 5
OImage='einstein.jpg';

Gamma = 10;

Lower = 0.3;

Upper = 0.87;

imshow(OImage);

figure;

OImage = GammaCorrection( OImage, Gamma, Lower, Upper );

imshow(OImage);

%% TASK 6
Im1 = 'CWhite1.jpg';
Im2 = 'HWhite1.jpg';
[ Profile1, Profile2 ] = Vignette( Im1, Im2, 20000);

