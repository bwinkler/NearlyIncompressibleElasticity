classdef UnitSquareDiscretization < Discretization
    properties
        N
        h
        pts
        ptsTop
        ptsBottom
        ptsLeft
        ptsRight
        dirichletBoundaries
        neumannBoundaries
        fFunc
        gFunc
        hFuncs
        meshType
    end
    properties(Constant)
        Quadrangles      = struct(...
                                'name',       'cartesian',...
                                'uFEM',       'FEM_QK(2,1)',...
                                'dFEM',       'FEM_QK(2,1)',...
                                'pFEM',       'FEM_QK(2,0)',...
                                'quadMethod', 'IM_QUAD(5)' );
        TrianglesGrid    = struct(...
                                'name',       'triangles grid',...
                                'uFEM',       'FEM_PK(2,1)',...
                                'dFEM',       'FEM_PK(2,1)',...
                                'pFEM',       'FEM_PK(2,0)',...
                                'quadMethod', 'IM_TRIANGLE(5)' );
        TrianglesRegular = struct(...
                                'name',       'regular simplices',...
                                'uFEM',       'FEM_PK(2,1)',...
                                'dFEM',       'FEM_PK(2,1)',...
                                'pFEM',       'FEM_PK(2,0)',...
                                'quadMethod', 'IM_TRIANGLE(5)' );
        Boundaries       = struct(...
                                'Top',            0,...
                                'Bottom',         1,...
                                'Left',           2,...
                                'Right',          3 );
    end
    methods
        function d = UnitSquareDiscretization( meshType, ...
                                               N,...
                                               dirichletBoundaries,...
                                               neumannBoundaries,...
                                               fFunc,...
                                               gFunc,...
                                               hFuncs,...
                                               mu,...
                                               ld )
            h = 1/(N+1);

            m   = gf_mesh(meshType.name, [0:h:1], [0:h:1] );

            mfu = gf_mesh_fem( m, 2 );
            gf_mesh_fem_set( mfu, 'fem',gf_fem( meshType.uFEM ));

            mfd = gf_mesh_fem( m );
            gf_mesh_fem_set( mfd, 'fem', gf_fem( meshType.dFEM ));

            mfp = gf_mesh_fem( m );
            gf_mesh_fem_set( mfp, 'fem', gf_fem( meshType.pFEM ));
            mim = gf_mesh_im( m, gf_integ( meshType.quadMethod ));


            pts = gf_mesh_get(m,'pts');
            ptsLeft = find( abs(pts(1,:) ) < 1/(2*(N+1)) );
            ptsRight = find( abs(pts(1,:) - 1 ) < 1/(2*(N+1)) );
            ptsBottom = find( abs( pts(2,:) ) < 1/(2*(N+1)) );
            ptsTop = find( abs( pts(2,:) - 1 ) < 1/(2*(N+1)) );

            dirBoundaryPts = [];
            for b = dirichletBoundaries
                switch b{:} 
                case UnitSquareDiscretization.Boundaries.Top
                    dirBoundaryPts = union(dirBoundaryPts, ptsTop);
                case UnitSquareDiscretization.Boundaries.Bottom
                    dirBoundaryPts = union(dirBoundaryPts, ptsBottom);
                case UnitSquareDiscretization.Boundaries.Left
                    dirBoundaryPts = union(dirBoundaryPts, ptsLeft);
                case UnitSquareDiscretization.Boundaries.Right
                    dirBoundaryPts = union(dirBoundaryPts, ptsRight);
                end
            end

            dirBoundID = 1;
            dirBoundFaces = gf_mesh_get(m, 'faces_from_pid', dirBoundaryPts );
            gf_mesh_set(m, 'boundary', dirBoundID, dirBoundFaces);

            fVec = gf_mesh_fem_get(mfd, 'eval', fFunc );
            Fp = gf_asm( 'volumic source', mim, mfu, mfd, fVec );

            Fn = gf_asm( 'volumic source', mim, mfu, mfd, zeros(size(fVec)) );

            for i = 1:length(hFuncs)

                neuVec = gf_mesh_fem_get( mfd, 'eval', hFuncs{i});

                switch neumannBoundaries{i} 
                case UnitSquareDiscretization.Boundaries.Top
                    neuBoundFaces = gf_mesh_get(m, 'faces_from_pid', ptsTop );
                case UnitSquareDiscretization.Boundaries.Bottom
                    neuBoundFaces = gf_mesh_get(m, 'faces_from_pid', ptsBottom );
                case UnitSquareDiscretization.Boundaries.Left
                    neuBoundFaces = gf_mesh_get(m, 'faces_from_pid', ptsLeft );
                case UnitSquareDiscretization.Boundaries.Right
                    neuBoundFaces = gf_mesh_get(m, 'faces_from_pid', ptsRight );
                end

                neuBoundID = i + 1; 
                gf_mesh_set(m, 'boundary', neuBoundID, neuBoundFaces);
                Fn = Fn + gf_asm('boundary source', neuBoundID, mim, mfu, mfd, neuVec);
            end

            d@Discretization( m, mu, ld, Fp, Fn, mfu, mfd, mfp, mim, dirBoundID, gFunc );
            d.N = N;
            d.h = h;
            d.dirichletBoundaries = dirichletBoundaries;
            d.neumannBoundaries   = neumannBoundaries;
            d.pts = pts;
            d.ptsLeft = ptsLeft;
            d.ptsRight = ptsRight;
            d.ptsTop  = ptsTop;
            d.ptsBottom = ptsBottom;
            d.meshType = meshType;
        end

    end
end

