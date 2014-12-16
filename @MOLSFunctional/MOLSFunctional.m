classdef MOLSFunctional < ObjectiveFunctional
    %MOLSFunctional  Brief class summary
    % Detailed description of class.
    %
    % See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-11-13
    properties
        Lzb;  % L(Zbar)
    end
    methods
        function obj = MOLSFunctional( s, Zbar, Zhat, gradientMethod )
        % Summary of class constructor.
            obj@ObjectiveFunctional(s, Zbar, Zhat, gradientMethod );
            d = obj.discretization;
            obj.Lzb = d.Q'*d.getAdjointStiffness(obj.Zbar);
        end
    end
end
