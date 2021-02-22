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

function generateExams( testStrings, paramRanges, outputFolder )

  % extract strings and param
  csvActa     = testStrings.csvActa     ;
  testFolder  = testStrings.testFolder  ;
  testLabel   = testStrings.testLabel   ;
  numNotList  = testStrings.numNotList  ;
 
  IDs = {} ; surnames = {} ; names = {} ;
  numStudent = 0 ;
  
  % --- reads students list ---
  if ~isempty( csvActa )
    fid       = fopen( csvActa, 'r') ;
    aux       = fgetl(fid);   aux = fgetl(fid); aux = fgetl(fid); 
    
    while ~feof(fid)
      numStudent += 1 ;
      aux       = textscan( fgetl( fid ), '%s', 'Delimiter', ',' ){1} ;
      % stores students personal data
      IDs{numStudent} = aux{2,1} ; surnames{numStudent} = aux{3,1} ; names{numStudent} = aux{4} ;
    end
    fclose(fid);
  end
  % ---------------------------

  if numNotList > 0
    for i = 1 : numNotList
      IDs{numStudent+i} = '-'; surnames{ numStudent+i} = 'Not in list'; names{numStudent+i} = '';
    end
  end

  if exist( outputFolder ) == 7 % out
    fprintf( ['  - Removing output directory.\n'] ) ;
    confirm_recursive_rmdir(0)
    % delete
    [aux, msg] = rmdir( outputFolder ,'s') ;
  
    % create empty
    mkdir( outputFolder );

  else
    fprintf( ['  - Creating output directory.\n'] ) ;
    mkdir( outputFolder );
  end

  fplanillaVals = fopen( [ outputFolder 'generatedParams.csv'],'w' ) ;

  currFolder = cd( testFolder ) ;

  if exist( 'nLetras' ) == 0 || nLetras > length( surnames )
    nLetras = length( surnames ) ;
  end
  
  % genera letras
  fprintf( [ ' Starting Exam files generation: \n'] ) ;

  fprintf( fplanillaVals, '#' ) ;
  for i = 1:size( paramRanges.names, 2 )
    fprintf( fplanillaVals, ',%s', paramRanges.names{1,i} ) ;
  end
  fprintf( fplanillaVals, '\n' ) ;

  
  for i=1:nLetras
  
    % etiquetas auxiliares
    surnameLabel = strrep( strrep( surnames{i} , " ", "-" ),"'","-" ) ;
    nameLabel    = strrep( strrep( names{i}    , " ", "-" ),"'","-" ) ;

    fprintf( sprintf( '  %3i - %s ', i, surnameLabel ) ) ;
    
    testFilename = sprintf( '%s_%03i_%s.pdf', testLabel, i, surnameLabel ) ;
    % ------------------

    % --- writes parameters file ---
    fprintf( fplanillaVals, '%03i', i );
    writeParamsFile( paramRanges, nameLabel, surnameLabel, IDs{i}, fplanillaVals ) ;
    fprintf( fplanillaVals, '\n' );
    % ----------------------------

    % generates and rename file
    [status, output] = system( [ 'pdflatex ' testLabel '.tex' ] );
    [status, output] = system( [ 'mv ' testLabel '.pdf ' currFolder '/' outputFolder testFilename ] ) ;
    
    % termina generacion de esta letra
    fprintf( [ ' done\n'] ) ;
  
  end
  
  fclose(fplanillaVals);
  
  cd( currFolder );
  
end
