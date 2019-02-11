function [ pol ] = kart2pol( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
r2d = @(x) (x*180/pi);

pol = [abs(x) r2d(angle(x))];

end

