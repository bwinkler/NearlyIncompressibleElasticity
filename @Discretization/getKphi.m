function Kphi = getKphi(obj)
  for i = 1:obj.dDOF
      phi = zeros( obj.dDOF, 1 );
      phi(i) = 1;
      KhatPhi = obj.getKhat( phi );
      Kphi{i} = [ ds.Q'* KhatPhi *ds.Q, ds.B; ds.B', -ds.C];
  end
end
