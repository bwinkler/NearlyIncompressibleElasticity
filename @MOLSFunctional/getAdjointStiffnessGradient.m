function varargout = getAdjointStiffnessGradient( o, Ubar, P )
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
    d  = o.discretization;
    Un = d.Q' * Ubar;
    Lub = d.Q'*d.getAdjointStiffness(Ubar); 
    L   = (Lub + o.Lzb);
    g  = -0.5* L' * (Un - o.Zbn);

    switch nargout
    case {0,1}
        varargout{1} = g;
    case 2
        varargout{1} = g;
        varargout{2} = Lub;
    end
end
