% Copyright (C) 2020, Jorge M. Perez Zerpa
%
% This file is part of RandExam
%
% RandExam is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% RandExam is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with RandExam.  If not, see <https://www.gnu.org/licenses/>.

function writeParamsFile( paramRanges, nameLabel, surnameLabel, id )

  fparamsLetra = fopen( 'problemsParams.tex', 'w' ); 

  % student personal data
  fprintf( fparamsLetra, [ '\\newcommand{\\nombres}{'   nameLabel    '}\n'] ) ;
  fprintf( fparamsLetra, [ '\\newcommand{\\apellidos}{' surnameLabel '}\n'] ) ;
  fprintf( fparamsLetra, [ '\\newcommand{\\CI}{' id '}\n'] ) ;

  % valores numericos
  nParams = length( paramRanges.names ) ;
   
  for i=1:nParams
  
    % choose value
    valsSet = ( paramRanges.iniVal{i} : paramRanges.deltas{i} : paramRanges.endVal{i} )' ;
    
    chosenVal = valsSet( randi( length( valsSet ) ) ) ;
    
    % write line  
    fprintf( fparamsLetra, [ '\\newcommand{\\' paramRanges.names{i} '}{%g}\n'], chosenVal ) ;
  end
  
  fclose( fparamsLetra ) ;

end
