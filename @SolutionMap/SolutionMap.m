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
    end

    methods
        function obj = SolutionMap( d )
            if nargin > 0
                obj.discretization = d;
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
                    varargout{1} = obj.eval( s.subs{1} );
                otherwise
                    error('SolutionMap: Incorrect usage of ()');
                end

            end
        end
    end
end
