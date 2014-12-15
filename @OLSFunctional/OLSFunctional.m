classdef OLSFunctional < ObjectiveFunctional
    %OLSFunctional  Brief class summary
    % Detailed description of class.
    %
    % See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-11-13
    properties
        CiB  % C^{-1} * B^T
        BCiB % B * C^{-1} * B^T
        H1   % K + M
        QH1  % Q' * (K + M) * Q
    end
    methods
        function obj = OLSFunctional( s, Zbar, Zhat, gradientMethod )
        % Summary of class constructor.
            obj@ObjectiveFunctional(s, Zbar, Zhat, gradientMethod );
            d        = obj.discretization;
            obj.CiB  = d.C \ d.B';
            obj.BCiB = d.B * obj.CiB;
            obj.H1   = d.Ku + d.Mu;
            obj.QH1  = d.Q'* obj.H1 * d.Q;
        end
    end
end
