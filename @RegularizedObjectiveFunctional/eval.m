function varargout = eval(obj, muDsc)
%eval - Description
%
% Syntax:  output = eval(input)
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
% Created: 2014-12-08
%

    J = obj.J;
    R = obj.R;
    b = obj.regularizationParameter;
    
    switch nargout
    case 1
        Jval  = J(muDsc);
        Rval =  R(muDsc);
        varargout{1} = Jval + b * Rval;
    case 2
        [Jval, gJ]  = J(muDsc);
        [Rval, gR] =  R(muDsc);
        varargout{1} = Jval + b * Rval;
        varargout{2} = gJ + b* gR;
    case 3
        [Jval, gJ, hJ]  = J(muDsc);
        [Rval, gR, hR] =  R(muDsc);
        varargout{1} = Jval + b * Rval;
        varargout{2} = gJ + b* gR;
        varargout{3} = hJ + b* hR;
    otherwise
        error('Incorrect number of output arguments for Functional');
    end

end

