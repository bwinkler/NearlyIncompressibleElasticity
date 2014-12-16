function H = getHybridHessian(o, Ubar, gUbar, LW)
%getHybridHessian - Description
%
% Syntax:  output = getHybridHessian(input)
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
% Created: 2014-12-16
%
    d = o.discretization;
    H = gUbar' * d.Q'*d.Mu*d.Q * gUbar;
    H = H + 2 * gUbar' *  d.Q'*LW;
end


