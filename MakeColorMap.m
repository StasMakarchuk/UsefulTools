function [ ColorMap ] = MakeColorMap( Colors, Weight )
%This function creates a colormap with distribution of custom colors. 
%           Colors - should be a Nx3 matrix where each line composed from
%           3 numbers determined RGB code of color "Color nodes"  for colormap;
%           N - number of colors;
%           Weight - should be Nx1 array with "weight" of each color.
%           values of weight could be whatever, important is relative ratio
%           between them. If no weight were chosen, all colors are weighted
%           equally
    
%Stanislaw Makarchuk 04.05.19

N = size(Colors,1); %Number of colors
Lmax = 100; %"Length" of the color with largest weight


if nargin<2    Weight = ones(N,1); end

Wmax = max(Weight)
ColorMap =[];
for i=1:N-1
    Weight(i)
    L = round((Weight(i)+Weight(i+1))/(2*Wmax)*Lmax) %"Length" of the current color
    SubMap = [linspace(Colors(i,1), Colors(i+1,1), L)', linspace(Colors(i,2), Colors(i+1,2), L)', linspace(Colors(i,3), Colors(i+1,3), L)']; 
    ColorMap = [ColorMap; SubMap];
end


% figure
% colormap(ColorMap)
% colorbar
end

