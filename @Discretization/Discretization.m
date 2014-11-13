classdef Discretization < handle
    %Discretization - Discretization of the nearly incompressible elasticity problem
    % Detailed description of class.
    %
    % See also: SolutionMap, UnitSquareDiscretization
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-11-13
    properties
	    numPoints         % Number of points on the mesh
        mu                % The mu coefficient function
        ld                % lambda
        mesh              % The mesh to solve on
        meshFemU          % The solution mesh fem
        meshFemD          % The parameter mesh fem
        meshFemP          % The pressure mesh fem
        integrationMethod % getfem integration method
        fDsc              % The discretized f(x)
        muDsc             % The discretized mu(x)
        muZeros
	    ldDsc
        uDsc              % Discretized U
        uFunc             % Description of exact U function
        dirDsc            % Discretized Dirichlet conditions
        neuDsc            % Discretized Neumann conditions
        dirBoundID        % The boundary ID for the Dirichlet conditions
        K                 % The stiffness matrix
        F                 % The discretized F after dirichlet conditions
        Ft
        Khat
        B
        Q                 % Projector into Dirichlet solution space
        Ud
        Kfull             % List of matrices
        Bfull
        uDOF
        unDOF             % # of degrees of freedom for Un
        dDOF
        pDOF
        C
        KhatFull
        Fp
        Fn
        G
        Mu
        Mp
        Md
        Ku
        Kp
        Kd
    end
    methods
        function d = Discretization( mesh,...
                                     mu, ld,...
                                     Fp, Fn,...
                                     meshFemU, meshFemD, meshFemP,...
                                     integrationMethod ,... 
                                     dirBoundID, gFunc )
        % Creates an discretization with the given mesh, meshfems, integration method, functions and boundary info.

            if nargin > 0
                d.mesh              = mesh;
                d.meshFemU          = meshFemU;
                d.meshFemD          = meshFemD;
                d.meshFemP          = meshFemP;
                d.integrationMethod = integrationMethod;


                d.Fp                = Fp;
                d.Fn                = Fn;

                d.ld                = ld;
                d.muZeros           = gf_mesh_fem_get(d.meshFemD, 'eval', 0 );

                d.dirBoundID        = dirBoundID;
                d.dirDsc            = gf_mesh_fem_get(d.meshFemD, 'eval', gFunc );



                d.Bfull             = gf_asm( 'volumic', ...
                                          'M(#1,#2)+=comp(vGrad(#1).Base(#2))(:,i,i,:)', ...
                                          d.integrationMethod, d.meshFemU, d.meshFemP );

                ldInv               = d.ld^(-1);

                d.C                 = ldInv*gf_asm( 'mass matrix',...
                                          d.integrationMethod,...
                                          d.meshFemP);

                [H, R]      = gf_asm( 'dirichlet',...
                                 dirBoundID,...
                                 integrationMethod,...
                                 meshFemU, ...
                                 meshFemD, ...
                                 repmat( eye(2), [1, 1, d.dDOF ] ),...
                                 d.dirDsc );
                [d.Q, d.Ud] = gf_spmat_get(H, 'dirichlet_nullspace', R);
                d.Ud        = d.Ud';

                d.B         = d.Q' * d.Bfull;
                d.G         = -d.Bfull'*d.Ud;
                
                d.mu        = mu;

                d.Mu        = gf_asm('mass_matrix', integrationMethod, meshFemU);
                d.Mp        = gf_asm('mass_matrix', integrationMethod, meshFemP);
                d.Md        = gf_asm('mass_matrix', integrationMethod, meshFemD);

                onesDsc     = gf_mesh_fem_get(meshFemD, 'eval', {1} );
                %d.Ku = gf_asm('laplacian', integrationMethod, meshFemU, meshFemD, onesDsc );
                d.Kp        = gf_asm('laplacian', integrationMethod, meshFemP, meshFemD, onesDsc );
                d.Kd        = gf_asm('laplacian', integrationMethod, meshFemD, meshFemD, onesDsc );
            end

        end
        function obj = set.mesh(obj, mesh)
            obj.mesh = mesh;
            obj.numPoints = gf_mesh_get(obj.mesh, 'nbpts');
        end
        function obj = set.mu(obj, mu)
            obj.mu = mu;
            obj.muDsc = gf_mesh_fem_get(obj.meshFemD, 'eval', {obj.mu} );
        end

        function obj = set.muDsc(obj, muDsc)
            if size(muDsc,2) == 1
                muDsc = muDsc';
            end
            obj.muDsc = muDsc;
            obj.KhatFull = obj.getKhat( muDsc );
        end

        function obj = set.KhatFull(obj, KhatFull);
            obj.KhatFull = KhatFull;
            obj.Khat     = obj.Q' * obj.KhatFull * obj.Q;
            obj.Kfull    = [ obj.KhatFull, obj.Bfull; obj.Bfull', -obj.C ];
            obj.K        = [ obj.Khat, obj.B; obj.B', -obj.C];
            obj.Ft       = obj.Q' * ( (obj.Fp + obj.Fn) - obj.KhatFull * obj.Ud);
            obj.F        = [obj.Ft; obj.G];
        end

        function obj = set.meshFemU(obj, mf)
            obj.meshFemU = mf;
            obj.uDOF = gf_mesh_fem_get(mf, 'nbdof');
        end
        function obj = set.meshFemD(obj, mf)
            obj.meshFemD = mf;
            obj.dDOF = gf_mesh_fem_get(mf, 'nbdof');
        end
        function obj = set.meshFemP(obj, mf)
            obj.meshFemP = mf;
            obj.pDOF = gf_mesh_fem_get(mf, 'nbdof');
        end
        function obj = set.Q(obj, myQ)
            obj.Q = myQ;
            obj.unDOF = size(myQ,2);
        end
        function obj = set.uFunc(obj, u)
            obj.uFunc = u;
            obj.uDsc = gf_mesh_fem_get(obj.meshFemU, 'eval', u );
        end
    end
end

