classdef SolutionMap < handle
    properties
        discretization
    end

    methods
        function obj = SolutionMap( d )
            if nargin > 0
                obj.discretization = d;
            end
        end
    end
end
