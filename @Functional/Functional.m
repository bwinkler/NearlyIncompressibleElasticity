classdef Functional < handle
    %Functional  Functional abstract class
    % Detailed description of class.
    %
    % See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-11-13
    properties
        discretization % Problem discretization
    end
    methods
        function obj = Functional( d )
        % Summary of class constructor.
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
                case 1
                    switch nargout
                    case {0,1}
                        varargout{1} = obj.eval( s.subs{1} );
                    case 2
                        [varargout{1}, varargout{2}] = obj.eval( s.subs{1});
                    case 3
                        [varargout{1}, varargout{2}, varargout{3}] = obj.eval( s.subs{1});
                    otherwise
                        error('ObjectiveFunctional: Too many output arguments');
                    end

                otherwise
                    error('ObjectiveFunctional: Incorrect usage of ()');
                end

            end
        end
    end
    methods ( Abstract )
        eval( obj, muDsc )
    end
end
