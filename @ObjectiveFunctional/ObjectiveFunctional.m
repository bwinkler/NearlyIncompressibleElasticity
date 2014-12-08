classdef ObjectiveFunctional < Functional
    %ObjectiveFunctional  Objective functional abstract class
    % Detailed description of class.
    %
    % See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-11-13
    properties
        solutionMap    % Solution map for the direct problem.
        Zbar           % Data for Ubar
        Zbn            % Zbar with Dirichlet constraints
        Zhat           % Data for P
    end
    methods
        function obj = ObjectiveFunctional( s, Zbar, Zhat )
        % Summary of class constructor.
            obj@Functional();
            if nargin > 0
                obj.discretization = s.discretization;
                obj.solutionMap = s;
                obj.Zbar = Zbar;
                obj.Zbn  = obj.discretization.Q' * Zbar;
                obj.Zhat = Zhat;
            end
        end
    end
end
