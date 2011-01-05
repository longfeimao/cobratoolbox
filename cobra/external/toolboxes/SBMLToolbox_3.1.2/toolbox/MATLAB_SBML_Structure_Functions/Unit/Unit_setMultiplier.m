function SBMLUnit = Unit_setMultiplier(SBMLUnit, multiplier)
%
%   Unit_setMultiplier 
%             takes  1) an SBMLUnit structure 
%             and    2) the multiplier to be set
%
%             and returns 
%               the unit with the multiplier set
%
%       SBMLUnit = Unit_setMultiplier(SBMLUnit, multiplier)

%  Filename    :   Unit_setMultiplier.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: Unit_setMultiplier.m 7155 2008-06-26 20:24:00Z mhucka $
%  $Source v $
%
%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright 2005-2007 California Institute of Technology.
% Copyright 2002-2005 California Institute of Technology and
%                     Japan Science and Technology Corporation.
% 
% This library is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
% and also available online as http://sbml.org/software/sbmltoolbox/license.html
%----------------------------------------------------------------------- -->



% check that input is correct
if (~isstruct(SBMLUnit))
    error(sprintf('%s', ...
      'argument must be an SBML Unit structure'));
end;
 
[sbmlLevel, sbmlVersion] = GetLevelVersion(SBMLUnit);

if (~isSBML_Unit(SBMLUnit, sbmlLevel, sbmlVersion))
    error(sprintf('%s\n%s', 'Unit_setMultiplier(SBMLUnit, multiplier)', 'first argument must be an SBML unit structure'));
elseif (sbmlLevel ~= 2)
    error(sprintf('%s\n%s', 'Unit_setMultiplier(SBMLUnit, multiplier)', 'no multiplier field in a level 1 model'));    
elseif (~isnumeric(multiplier))
    error(sprintf('%s\n%s', 'Unit_setMultiplier(SBMLUnit, multiplier)', 'second argument must be a number representing the multiplier'));        
end;

SBMLUnit.multiplier = multiplier;