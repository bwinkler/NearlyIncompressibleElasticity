function P = estimateP( d, Ubar )
%estimateP - Description
%
% Syntax:  output = estimateP(input)
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

  P = d.C \ (d.B' * (d.Q' * Ubar ));

end
