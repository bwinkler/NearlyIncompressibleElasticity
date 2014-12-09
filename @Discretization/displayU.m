function displayU( varargin )
%displayU - Description
%
% Syntax:  output = displayU(input)
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

    d               = varargin{1};
    uDsc            = varargin{2};
    deformScale     = 1;
    plotTitle       = 'U';

    switch nargin
    case 2
    case 3
        deformScale = varargin{3};
    case 4
        deformScale = varargin{3};
        plotTitle   = varargin{4};
    otherwise
        error('Incorrect number of arguments for displaying U');
    end

    if size(uDsc,1) ~= 1
        uDsc = uDsc';
    end 

    figure('Renderer', 'zbuffer');

    gf_plot( d.meshFemU        , uDsc        , ...
           'deformed_mesh'     , 'on'        , ...
           'norm'              , 'on'        , ...
           'deformation'       , uDsc        , ...
           'deformation_mf'    , d.meshFemU  , ...
           'deformation_scale' , deformScale , ...
           'disp_options'      , 'off' );

    title( plotTitle );
end
