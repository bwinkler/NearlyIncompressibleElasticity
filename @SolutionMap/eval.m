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

    if nargout > 1
        error('SolutionMap: Gradient and Hessian of solution map not yet supported');
    end
end



