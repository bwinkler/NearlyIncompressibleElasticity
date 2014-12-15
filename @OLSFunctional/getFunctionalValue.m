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
    d = o.discretization;

    Jval = 0.5 * (Ubar - o.Zbar)' * o.H1 * (Ubar - o.Zbar);
    
end

