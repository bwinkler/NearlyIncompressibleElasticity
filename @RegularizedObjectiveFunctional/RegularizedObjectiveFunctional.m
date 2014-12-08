classdef RegularizedObjectiveFunctional < Functional
    %RegularizedObjectiveFunctional  Brief class summary
    % Detailed description of class.
    %
    % See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-12-08
    properties
        J
        R
        regularizationParameter
    end
    methods
        function obj = RegularizedObjectiveFunctional(J, R, regularizationParameter )
        % Summary of class constructor.
            obj@Functional();
            if nargin > 0
                obj.discretization = J.discretization;
                obj.J = J;
                obj.R = R;
                obj.regularizationParameter = regularizationParameter;
            end
        end
    end
end
