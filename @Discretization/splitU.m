function [Ubar, P] = splitU(obj, U)
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
    m = length(U) - obj.pDOF;
    Ubar = U(1:m);
    P    = U(m+1:end);
end


