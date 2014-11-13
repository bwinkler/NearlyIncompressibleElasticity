function L = getAdjointStiffness( obj, U )
%getAdjointStiffness - Calculates the adjoint stiffness matrix L
% The adjoint stiffness matrix satisfies Khat(mu)Ubar = L(Ubar)mu
%
% Syntax:  L = getAdjointStiffness(obj, U)
%
% Inputs:
%    obj - The discretization
%    U   - The solution to find L(U)
%
% Outputs:
%    L   - The adjoint stiffness matrix.
%
% Example: 
%    L = d.getAdjointStiffness(U)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: Discretization
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-11-13
%

  L = gf_asm('volumic',[ ...
             'u=data(#2);',...
             't=comp(vGrad(#2).vGrad(#2).Base(#1));',...
             'e=(t{:,2,3,:,5,6,:}+t{:,3,2,:,5,6,:}',...
             '+t{:,2,3,:,6,5,:}+t{:,3,2,:,6,5,:})/2;',...
             'g=e(:,i,j,:,i,j,:);M(#2,#1)+=g(j,:,:).u(j)'],...
             obj.integrationMethod,...
             obj.meshFemD,...
             obj.meshFemU,...
             U);
