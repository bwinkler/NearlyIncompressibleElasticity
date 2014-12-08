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
    if size(muDsc, 1) == 1 
        muDsc = muDsc';
    end
    varargout{1} = 0.5*muDsc' * obj.A * muDsc;

    if( nargout > 1)
        % Calculate the gradient.
        varargout{2} = obj.A * muDsc;
    end

    if( nargout == 3)
        % Calculate the Hessian.
        varargout{3} = obj.A;
    end
end
    
    


