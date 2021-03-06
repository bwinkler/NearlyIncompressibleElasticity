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
    S = obj.solutionMap;

    
    switch nargout
    case {0,1}
        [Ubar, P]    = d.splitU( S(muDsc) );
        varargout{1} = obj.getFunctionalValue( Ubar, P );
    case 2
        switch obj.gradientMethod
        case 'Adjoint Stiffness'
            [U, gU]      = S(muDsc);
            [Ubar, P]    = d.splitU( U );
            gUbar        = d.splitGradientU( gU );
            varargout{1} = obj.getFunctionalValue( Ubar, P);
            varargout{2} = obj.getAdjointStiffnessGradient( Ubar, P, gUbar );
        case {'Adjoint', 'Hybrid'}
            [Ubar, P]    = d.splitU( S(muDsc) );
            varargout{1} = obj.getFunctionalValue( Ubar, P);
            varargout{2} = obj.getAdjointGradient( Ubar, P );
        otherwise
            error('Gradient method not implemented');
        end
    case 3
        switch obj.gradientMethod
        case {'Adjoint Stiffness','Adjoint'}
            error('Hessian using the given method not implemented');
        case 'Hybrid'
            [U, gU]      = S(muDsc);
            [Ubar, P]    = d.splitU( U );
            gUbar   = d.splitGradientU( gU );
            varargout{1} = obj.getFunctionalValue( Ubar, P);
            [varargout{2}, LW] = obj.getAdjointGradient( Ubar, P );
            varargout{3} = obj.getHybridHessian( Ubar, gUbar, LW);
        otherwise
            error('Incorrect method for calculating the Hessian');
        end

    end

end
