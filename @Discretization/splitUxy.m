function [Ux, Uy] = splitUxy(o, U)
%splitUxy - Splits the U vector into x, y components
%
% Syntax:  output = splitUxy(input)
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
% Created: 2014-12-17
%
  Ux = U(1:2:end);
  Uy = U(2:2:end);
end

