function Jval = getFunctionalValue(o, Ubar, P)
%getFunctionalValue - Description
%
% Syntax:  output = getFunctionalValue(input)
%
% Inputs:
%    input - Description
%
% Outputs:
%    output - Description
%
% Example: 
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-12-10
%
    d    = o.discretization;

    Un   = d.Q' * Ubar;
    Jval = 0.5*(Un - o.Zbn)' * d.Khat * (Un - o.Zbn);
    Jval = Jval + (Un - o.Zbn)' * d.B * (P - o.Zhat);
    Jval = Jval - 0.5*(P - o.Zhat)' * d.C * (P - o.Zhat);
end
