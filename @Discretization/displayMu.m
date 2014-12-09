function displayMu(varargin)
%displayMu - Description
%
% Syntax:  output = displayMu(input)
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
    d             = varargin{1};
    muDsc         = d.muDsc;
    plotTitle     = '\mu';
    rotation      = [ -37.5, 30 ];

    switch nargin
    case 1
    case 2
        d         = varargin{1};
        muDsc     = varargin{2};
    case 3
        d         = varargin{1};
        muDsc     = varargin{2};
        plotTitle = varargin{3};
    case 4
        d         = varargin{1};
        muDsc     = varargin{2};
        plotTitle = varargin{3};
        rotation  = varargin{4};
    otherwise
        error('Incorrect number of arguments for displaying mu');
    end

    if size(muDsc,1) ~= 1
        muDsc = muDsc';
    end 

    figure('Renderer', 'zbuffer');
    gf_plot( d.meshFemD, muDsc, 'zplot', 'on', 'deformed_mesh', 'on', 'disp_options','off');
    title(plotTitle);
    view(rotation);
end
