function [U, gU, hU] = eval(obj, muDsc)
%eval - Evaluates the solution map at muDsc
%
% Syntax:  [Ubar, P] = s.eval(muDsc)
%
% Inputs:
%    muDsc - Discrete value of mu
%
% Outputs:
%    U  - The solution for a given muDsc
%    gU - The gradient of the solution map at muDsc
%    hU - The hessian  of the solution map at muDsc
%
% Example: 
%   [Ubar, P]  = s.eval(muDsc)
%
% See also: Discretization, SolutionMap
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-11-13
%
    d = obj.discretization;
    d.muDsc = muDsc;

    U = obj.solve();

    switch nargout
    case {0,1}
    case 2
        [Ubar, P] = d.splitU( U );
        L         = d.Q'*d.getAdjointStiffness( Ubar );
        gUbar     = -(d.Khat + obj.BCiB) \ L;
        gP        = obj.CiB * gUbar;
        gU        = [ gUbar; gP ];
    case 3
        error('Hessian of solution map not implemented');
    otherwise
        error('Error using solution map: too many output argments');
    end

end



