function varargout = getAdjointGradient(o, Ubar, P)
%getAdjointGradient - Description
%
% Syntax:  output = getAdjointGradient(input)
%
% Inputs:
%    input - Description
%
% Outputs:
%    output - Description
%
% Example: 
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-12-11
%

    d = o.discretization;
    % Zero boundary conditions 
    % Best
    [ Wn, Pw ] = d.splitU( d.K \ [ d.Q'*d.Mu*(o.Zbar - Ubar) ; zeros(d.pDOF,1) ]);
    W = d.Q*Wn;
    L = d.getAdjointStiffness( W );
    g = Ubar' * L;
    g = g';

    switch nargout
    case {0,1}
        varargout{1} = g;
    case 2
        varargout{1} = g;
        varargout{2} = L;
    end

end

    % The gallery of incorrect/useless adjoint code:

    %Un = d.Q' * Ubar;

    %dirichletBoundaries = { UnitSquareDiscretization.Boundaries.Top,...
                        %UnitSquareDiscretization.Boundaries.Bottom, ...
                        %UnitSquareDiscretization.Boundaries.Left,...
                        %UnitSquareDiscretization.Boundaries.Right };


    %adjDisc = UnitSquareDiscretization( d.meshType, d.N, dirichletBoundaries, {UnitSquareDiscretization.Boundaries.Top},...
                %{'0' ; '0'},...
                %{'0' ; '0'},...
                %{ {'0' ;'0'}},...
                %'0', ...
                %'0' ); 
    %adjQ = adjDisc.Q;

    %adjLHS = [ d.KhatFull*adjQ, d.Bfull; d.Bfull'*adjQ, -d.C ];
    %[ Wn, Pw ] = d.splitU( adjLHS \ [ d.Mu*(o.Zbar - Ubar) ; zeros(d.pDOF,1)]);
    %W = adjQ*Wn;


    %adjLHS = [ adjQ'*d.KhatFull*adjQ, adjQ'*d.Bfull; d.Bfull'*adjQ, -d.C ];
    %[ Wn, Pw ] = d.splitU( adjLHS \ [ adjQ'*d.Mu*(o.Zbar - Ubar); zeros(d.pDOF,1)]);
    %W = adjQ*Wn;

    %L = d.getAdjointStiffness( Ubar );
    %g = Ubar' * L;
    %g = g';


    % With Dirichlet boundary conditions on adjoint equations using K
    %[ Wn, Pw ] = d.splitU( d.K \ [ (d.Q'*d.Mu*(o.Zbar - Ubar) - d.Q' * d.KhatFull * d.Ud); -d.Bfull'* d.Ud]);
    %W = d.Q*Wn + d.Ud;
    %L = d.getAdjointStiffness( W );
    %g = Ubar' * L;
    %g = g';

    % With Dirichlet boundary conditions on adjoint equations using no K
    %adjLHS = [ d.KhatFull*d.Q, d.Bfull; d.Bfull'*d.Q, -d.C ];
    %[ Wn, Pw ] = d.splitU( adjLHS \ [ d.Mu*(o.Zbar - Ubar) - d.KhatFull * d.Ud; -d.Bfull'* d.Ud]);
    %W = d.Q*Wn + d.Ud;
    %L = d.getAdjointStiffness( W );
    %g = Ubar' * L;
    %g = g';

    % Zero boundary conditions, no K
    %adjLHS = [ d.KhatFull*d.Q, d.Bfull; d.Bfull'*d.Q, -d.C ];
    %[ Wn, Pw ] = d.splitU( adjLHS \ [ d.Mu*(o.Zbar - Ubar); zeros(d.pDOF,1)]);
    %W = d.Q*Wn;
    %L = d.getAdjointStiffness( W );
    %g = Ubar' * L;
    %g = g';

    %[ Wn, Pw ] = d.splitU( d.K \ [ d.Q'*d.Mu*d.Q*(o.Zbn - Un) ; zeros(d.pDOF,1) ]);
    %W = d.Q*Wn;
    %L = d.getAdjointStiffness( Ubar );
    %g = W' * L;
    %g = g';


    % With full system, no boundary conditions
    %lambda = 1E-2;
    %adjLHS = [ d.KhatFull + lambda*speye(d.uDOF), d.Bfull; d.Bfull', -d.C];
    %[ W, Pw ]  = d.splitU( adjLHS \ [d.Mu*(o.Zbar - Ubar); zeros(d.pDOF,1)]);
    %L = d.getAdjointStiffness( Ubar );
    %g = W' * L;
    %g = g';
