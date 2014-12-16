function varargout = eval( obj, muDsc )
%eval - Evaluates the functional at muDsc
%
% Syntax:  [j, g, H] = J( muDsc )
%
% Inputs:
%    muDsc - Discretized mu value
%
% Outputs:
%    Jval     - Functional value at muDsc
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
    S = obj.solutionMap;

    switch nargout
    case {0,1}
        [Ubar, P]    = d.splitU( S(muDsc) );
        varargout{1} = obj.getFunctionalValue( Ubar, P );
    case 2
        switch obj.gradientMethod
        case 'Adjoint Stiffness'
            [Ubar, P]    = d.splitU( S(muDsc) );
            varargout{1} = obj.getFunctionalValue( Ubar, P );
            varargout{2} = obj.getAdjointStiffnessGradient( Ubar, P );
        otherwise
            error('MOLS: Gradient method not implemented');
        end
    case 3
        switch obj.gradientMethod
        case 'Adjoint Stiffness'
            [U, gU] = S(muDsc);
            [Ubar, P]  = d.splitU( U );
            [gUbar, gP] = d.splitGradientU( gU );
            varargout{1} = obj.getFunctionalValue( Ubar, P );
            [varargout{2}, Lub] = obj.getAdjointStiffnessGradient( Ubar, P );
            varargout{3} = obj.getAdjointStiffnessHessian( gUbar, Lub);
        otherwise
            error('MOLS: Gradient/Hessian method not implemented');
        end
    otherwise
        error('MOLS: Too many output arguments');
    end
end
