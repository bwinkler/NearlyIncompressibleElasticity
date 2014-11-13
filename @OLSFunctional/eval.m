function varargout = eval( obj, muDsc )
%eval - Evaluates the OLS Functional at muDsc
%
% Syntax:  [j, g, H] = J( muDsc )
%
% Inputs:
%    muDsc - Discretized mu value
%
% Outputs:
%    J     - Functional value at muDsc
%    gJ    - Gradient of J at muDsc
%    hJ    - Hessian of J at muDSC
%
%
% See also: ObjectiveFunctional, Discretization, SolutionMap
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-11-13
%
    d = obj.discretization;

    varargout{1} = 1;

    if( nargout > 1)
        % Calculate the gradient.
        varargout{2} = zeros(d.dDOF,1);
    end

    if( nargout == 3)
        % Calculate the Hessian.
        varargout{3} = zeros(d.dDOF, d.dDOF);
    end
end
