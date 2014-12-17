function U = mergeUxy(d, Ux, Uy)
%mergeUxy - Merges two vectors into U that are split into x and y components.
%
% Syntax:  output = mergeUxy(input)
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
  U = [];
  for i = [1:size(Ux)]
    U = [ U; Ux(i); Uy(i) ];
  end
end
