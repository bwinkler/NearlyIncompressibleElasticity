classdef SolutionMap < handle
    %SolutionMap  - Takes a discretization and provides the map S(mu) = (U(mu), P(mu)) 
    % Detailed description of class.
    %
    % See also: Discretization
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-11-13
    properties
        discretization
        CiB  % C^{-1} * B^T
        BCiB % B * C^{-1} * B^T
    end

    methods
        function obj = SolutionMap( d )
            if nargin > 0
                obj.discretization = d;
                obj.CiB  = d.C \ d.B';
                obj.BCiB = d.B * obj.CiB;
            end
        end
        function varargout = subsref(obj,s)

            switch s(1).type
            case {'.', '{}'}
                varargout{1} = builtin('subsref', obj, s);
            case '()'
                switch length(s.subs)
                case 0
                    varargout{1} = obj.solve();
                case 1
                    if nargout == 1
                        varargout{1} = obj.eval( s.subs{1} );
                    elseif nargout == 2
                        [varargout{1}, varargout{2}] = obj.eval( s.subs{1} );
                    elseif nargout == 3
                        [varargout{1}, varargout{2}, varargout{3}] = obj.eval( s.subs{1} );
                    else
                        error('SolutionMap: Too many output arguments');
                    end
                otherwise
                    error('SolutionMap: Incorrect usage of ()');
                end

            end
        end
    end
end
