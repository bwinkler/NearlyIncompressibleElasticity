function uOnto = projectU( dOnto, dFrom, uFrom )
%projectU - Description
%
% Syntax:  output = projectU(input)
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
% Created: 2014-12-09
%

    if size(uFrom, 1) ~= 1
        uFrom = uFrom';
    end
    uOnto = gf_compute(dFrom.meshFemU, uFrom,  'interpolate on', dOnto.meshFemU );
    uOnto = uOnto';

end


