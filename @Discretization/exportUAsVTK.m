function exportUAsVTK( d, Ubar, fileName )
%exportMuAsVTK - Description
%
% Syntax:  output = exportMuAsVTK(input)
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

    if size(Ubar, 1) ~= 1
        Ubar = Ubar';
    end
    gf_mesh_fem_get( d.meshFemU,...
                     'export to vtk',...
                     fileName,...
                     'ascii',...
                      Ubar,...
                     'U' );
end

