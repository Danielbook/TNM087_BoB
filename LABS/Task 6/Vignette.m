function [ Profile1, Profile2 ] = Vignette( Im1, Im2, norings )
%Vignette: Compare vignetting properties of two images
%   If Im1 and Im2 show the same object imaged under different conditions
%   then Profile1 and Profile2 describe the mean gray value as a function
%   of the radius
%
%% Who has done it
%
% Author: Danbo324 - Daniel B��k
%
%% Syntax of the function
%
% Input arguments:  Im1, Im2 are input images, you can assume that they are
%                       gray value images (of type uint8, uint16 or double)
%                   norings is optional and describes the number of
%                       concentric rings to use. The default is to use 50 rings
% Output arguments: Profile1 and Profile2 are vectors with the mean gray
%                       values in each ring. The final results are normed
%                       so that the maximum values in Profile1 and Profile2
%                       are equal to one
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: 2015-11-27
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) In case a task requires that you have to submit more than one function
%       save every function in a single file and collect all of them in a
%       zip-archive and upload that to Lisam. NO RAR, NO GZ, ONLY ZIP!
%       All non-zip archives will be rejected automatically
%
% 5) Often you must do something else between the given commands in the
%       template
%
%

%% Your code starts here
%

%% Input parameters

if nargin < 3
    norings = 50;
end
Im1 = imread(Im1);
Im2 = imread(Im2);
%% Generate two square images cIm1 and cIm2 that have the same size
% Use the center of the images and if at least one of them is an RGB image 
% either convert to gray value or exit with an error message
%
[sr1, sc1, nc1] = size(Im1);
[sr2, sc2, nc2] = size(Im2);

src1 = sr1/2;
scc1 = sc1/2;
src2 = sr2/2;
scc2 = sc2/2;

% Returns a logical array with elements set to logical 1 (true) 
% where arrays A and B are not equal; otherwise, it returns logical 0 (false).
if sr1 ~= sc1 %IF IM1 IS NOT SQUARE
    if sr1 > sc1
        sr1 = sc1;
    else
        sc1 = sr1;
    end
end

if sr2 ~= sc2 %IF IM2 IS NOT SQUARE
   if sr2 > sc2
        sr2 = sc2;
    else
        sc2 = sr2;
    end
end

%IF IM1 AND IM2 ARE NOT THE SAME SIZE
if sr1 ~= sr2 
    if sr1 > sr2
        sr1 = sr2;
        sc1 = sc2;
    else
        sr2 = sr1;
        sc2 = sc1;
    end
end
%
cIm1 = Im1(round(src1-sr1/2)+1:round(src1 + sr1/2), round(scc1 - sc1/2)+1:round(scc1 + sc1/2), :);
cIm2 = Im2(round(src2-sr2/2)+1:round(src2 + sr2/2), round(scc2 - sc2/2)+1:round(scc2 + sc2/2), :);

Profile1 = zeros(norings,1);
Profile2 = Profile1;

%% Now you have two gray value images of the size (square) size and you 
%   generate grid with the help of an axis vector ax that defines your
%   rings
%
% or read the documentation of linspace
ax = linspace(-norings, norings, sr1);

[C R] = meshgrid(ax); %Euclidean mesh
[~,Rho] = cart2pol(C,R); %Polar coordinates comment on the ~ used 
%##We dont need Theta, rho is the radius of the rings, we dont need the angles##
%% Do the actual calculations
for ringno = 1:norings
    RMask = ( (ringno-1) <= Rho & Rho < ringno );% Generate a mask describing the ring number ringno
    nopixels = sum(RMask(:));% Compute the number of pixels in RMask
    pixsum = sum(cIm1(RMask));% Compute the sum over all pixel values in RMask in Im1
    Profile1(ringno) =  pixsum/nopixels; %Mean gray value of pixels i RMask
    pixsum = sum(cIm2(RMask));% Compute the sum over all pixel values in RMask in Im1% ... and now you do it for the second images
    Profile2(ringno) = pixsum/nopixels; %Mean gray value of pixels i RMask
end

%% Finally the normalization to max value one 
%
Profile1 = Profile1/(max(Profile1));
Profile2 = Profile2/(max(Profile2));

%% Extra question: How can you find out if Im1 is better than Im2?
plot(Profile1); 
hold on;
plot(Profile2,'g'); 
%Profile 2 is better at handling vingetting because the pixel intensity is
%more evenly distributed across the image
end
