classdef TikhonovRegularizer < Functional
    %TikhonovRegularizer  Brief class summary
    % Detailed description of class.
    %
    % See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
    %
    % Author:  Brian C. Winkler
    % Email:   brian.c.winkler@gmail.com
    % Created: 2014-12-08
    properties
        type  % Norm used for regularization
        A     % Matrix for calculating the discretized norm
    end
    methods
        function obj = TikhonovRegularizer( d, type )
        % Summary of class constructor.
            obj@Functional();
            if nargin > 0
                obj.discretization = d;
                obj.type = type;

                switch type
                case 'H1-norm'
                    obj.A = d.Kd + d.Md;
                case 'L2-norm'
                    obj.A = d.Md;
                case 'H1-seminorm'
                    obj.A = d.Kd;
                otherwise
                    error('Incorrect Tikhonov regularization specified.');
                end
            end
        end
    end
end
