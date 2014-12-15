function [gUbar, gP] = splitGradientU(obj, gU)
%splitU - Splits U into Ubar and P
%
% Syntax:  [Ubar, P] = d.splitU(U)
%
% Inputs:
%    U - The solution vector containing both Ubar and P
%
% Outputs:
%    Ubar - The Ubar vector
%    P    - The P vector
%
% See also: Discretization
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-11-13
%
    n     = size(gU, 1);
    m     = n - obj.pDOF;
    gUbar = gU(1:m,:);
    gP    = gU(m+1:end, :);
end


