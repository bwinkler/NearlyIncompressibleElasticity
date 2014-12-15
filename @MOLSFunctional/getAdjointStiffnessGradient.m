function g = getAdjointStiffnessGradient( o, Ubar, P )
%getAdjointStiffnessGradient - Description
%
% Syntax:  output = getAdjointStiffnessGradient(input)
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
    d  = o.discretization;
    Un = d.Q' * Ubar;
    L  = d.Q'*d.getAdjointStiffness(Ubar + o.Zbar);
    g  = -0.5* L' * (Un - o.Zbn);
end
