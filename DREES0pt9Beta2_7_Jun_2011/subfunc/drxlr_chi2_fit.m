function [chi2,p]=drxlr_chi2_fit(O,E,np,flag)
% compute the CHI2 goodness of fit
% O: observed
% E: expected
% np: number of parameters in the model
% flag: 1 transform to probability, 0: no transform 
% Written by Issam El Naqa 06/12/06
%
% Copyright 2010, Joseph O. Deasy, on behalf of the DREES development team.
% 
% This file is part of the Dose Response Explorer System (DREES).
% 
% DREES development has been led by:  Issam El Naqa, Aditya Apte, Gita Suneja, and Joseph O. Deasy.
% 
% DREES has been financially supported by the US National Institutes of Health under multiple grants.
% 
% DREES is distributed under the terms of the Lesser GNU Public License. 
% 
%     This version of DREES is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
% DREES is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
% without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
% See the GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with DREES.  If not, see <http://www.gnu.org/licenses/>.

% convert expected to probability
if flag
    E=E/max(E)*10;
    Ep=drxlr_invlogit(E)-0.5;
else
    Ep=E;
end
chi2 = sum((O(:)-Ep(:)).^2 ./ (Ep(:)+1e-3));
p=drxlr_get_p_chi2(chi2,np);

return