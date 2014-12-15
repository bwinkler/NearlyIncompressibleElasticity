function g = getAdjointStiffnessGradient( o, Ubar, P, gUbar )
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
    d    = o.discretization;
    Un   = d.Q' * Ubar;
    g    = (Un - o.Zbn)'* o.QH1 *gUbar;
    g    = g';
end

