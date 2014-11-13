function U = solve(obj)
%solve - Solves the discretized underlying variational for U.
%
% Syntax:  U = solve(obj)
%
% Inputs:
%    obj - SolutionMap class instance
%
% Outputs:
%    U   - Solution to the discretized variational problem.
%
% Example: 
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: SolutionMap, Discretization
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-11-13

    d = obj.discretization;
    Utemp = d.K \ d.F;
    [Un, P] = d.splitU(Utemp);
    Ubar = d.Q* Un + d.Ud;
    U = [Ubar; P];
end
  
