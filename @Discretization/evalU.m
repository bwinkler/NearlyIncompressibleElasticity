function uDsc = evalU(obj, uFunc)
%evalU - Get a discretized evaluation of the function U
%
% Syntax:  uDsc = evalU(uFunc)
%
% Inputs:
%    uFunc - String representation of the solution U 
%
% Outputs:
%    uDsc -  Solution U discretized on the given discretization 
%
% Example: 
%          uDsc =  d.evalU( { '1+x'; '1+y' });
%
% See also: Discretization
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-12-08
%
    if size(uFunc,2) == 1
        uFunc = uFunc';
    end
    uDsc = gf_mesh_fem_get(obj.meshFemU, 'eval', uFunc );
    uDsc = uDsc';
end
