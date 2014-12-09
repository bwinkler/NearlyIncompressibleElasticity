function muDsc = evalMu(obj, muFunc)
%evalMu - Get a discretized evaluation of the function mu 
%
% Syntax:  uDsc = evalU(uFunc)
%
% Inputs:
%    muFunc - String representation of the solution U 
%
% Outputs:
%    muDsc -  Solution U discretized on the given discretization 
%
% Example: 
%          muDsc =  d.evalMu( '2.5' );
%
% See also: Discretization
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-12-08
%
    if ~iscell(muFunc)
        muFunc = {muFunc};
    end
    muDsc = gf_mesh_fem_get(obj.meshFemD, 'eval', muFunc );
    muDsc = muDsc';
end
