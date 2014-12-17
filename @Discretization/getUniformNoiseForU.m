function [Unoise, errNorm] = getUniformNoiseForU( d, U, noisePercent, normType )
%getUniformNoiseForU - Description
%
% Syntax:  output = getUniformNoiseForU(input)
%
% Inputs:
%    input - Description
%
% Outputs:
%    output - Description
%
% Example: 
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
%
% Author:  Brian C. Winkler
% Email:   brian.c.winkler@gmail.com
% Created: 2014-12-17
%

  [Ux, Uy] = d.splitUxy( U );
  [Mx, My] = d.splitUxy( d.meshPoints );

  N        = size(Ux,1);
  Ud1      = zeros(size(Ux));
  Ud2      = zeros(size(Uy));

  Vx       = Ux - Mx;
  Vy       = Uy - My;

  norms    = sqrt( Vx.^2 + Vy.^2);

  avgNorm  = mean(norms);
  maxNorm  = max(norms);

  for i = 1:N
      switch normType
      case 'avg'
	    a = -noisePercent * avgNorm;
      case 'max'
	    a = -noisePercent * maxNorm;
      otherwise
	    a = -noisePercent * norms(i);
      end
	  b      = -a;
	  r      = a + (b-a) * rand();
	  Ud1(i) = r;

	  r      = a + (b-a) * rand();
	  Ud2(i) = r;
  end

  Unoise   = d.mergeUxy(Ud1, Ud2);
  err_norm = norm( Unoise );
end
