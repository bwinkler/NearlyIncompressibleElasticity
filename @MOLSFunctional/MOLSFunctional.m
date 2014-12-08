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
        
    end
    methods
        function obj = MOLSFunctional( s, Zbar, Zhat )
        % Summary of class constructor.
            obj@ObjectiveFunctional(s, Zbar, Zhat);
        end
    end
end
