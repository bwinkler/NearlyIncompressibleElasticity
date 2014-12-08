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
    Zbar = obj.Zbar;
    Zhat = obj.Zhat;

    [Ubar, P] = d.splitU( S(muDsc) );


    Jval = 0.5*(Ubar - Zbar)' * d.KhatFull * (Ubar - Zbar);
    Jval = Jval + 0.5*(Ubar - Zbar)' * d.Bfull * (P - Zhat);
    Jval = Jval - (P - Zhat)' * d.C * (P - Zhat);

    %Un = d.Q' * Ubar;
    %Jval = 0.5*(Un - Zn)' * d.Khat * (Un - Zn);
    %Jval = Jval + 0.5*(Un - Zn)' * d.B * (P - Zhat);
    %Jval = Jval - (P - Zhat)' * d.C * (P - Zhat);

    varargout{1} = Jval;

    if( nargout > 1)
        % Calculate the gradient.
       L = d.getAdjointStiffness(Ubar + Zbar); 
       gJ = -0.5* L' * (Ubar - Zbar);
       varargout{2} = gJ;
    end

    if( nargout == 3)
        % Calculate the Hessian.
        varargout{3} = zeros(d.dDOF, d.dDOF);
    end
end
