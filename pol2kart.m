function [ pol ] = polar( X ,Y  )

vinkel = @(x) exp(1i*x*pi/180);

pol = X*vinkel(Y);



end

