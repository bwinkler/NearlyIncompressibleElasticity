function H = getAdjointStiffnessHessian( o, gUbar, Lub )
%getAdjointStiffnessHessian - Description
%
% Syntax:  output = getAdjointStiffnessHessian(input)
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

    H = -gUbar' * Lub;
    H = 0.5 * (H' + H);
end

