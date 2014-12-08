function pDsc = evalP(obj, pFunc)
%evalP - Evaluates the a function for the pressure term 
%
% Syntax:  pDsc = evalP(pFunc)
%
% Inputs:
%    pFunc - String representing p function to evaluate. 
%
% Outputs:
%    pDsc - Discretized P on the given mesh/mesh FEM.
%
% Example: 
%    pDsc = d.evalP('0');
%
%
% See also: Discretization
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-12-08
%
    if ~iscell(pFunc)
        pFunc = {pFunc};
    end
    pDsc = gf_mesh_fem_get(obj.meshFemP, 'eval', pFunc );
    pDsc = pDsc';
end
