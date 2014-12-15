function Jval = getFunctionalValueFull(o, Ubar, P)
%getFunctionalValue - Description
%
% Syntax:  output = getFunctionalValue(input)
%
% Inputs:
%    input - Description
%
% Outputs:
%    output - Description
%
% Example: 
%
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-12-10
%
    d    = o.discretization;

    Jval = 0.5*(Ubar - o.Zbar)' * d.KhatFull * (Ubar - o.Zbar);
    Jval = Jval + (Ubar - o.Zbar)' * d.Bfull * (P - o.Zhat);
    Jval = Jval - 0.5 * (P - o.Zhat)' * d.C * (P - o.Zhat);
end
