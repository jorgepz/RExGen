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

  % extract strings
  csvActa    = testStrings.csvActa    ;
  testFolder = testStrings.testFolder ;
  testLabel  = testStrings.testLabel  ;

  % --- reads students list ---
  fid       = fopen( csvActa, 'r') ;
    aux       = fgetl(fid);   aux = fgetl(fid); aux = fgetl(fid); 
    aux       = textscan(fid,'%s,%s,%s,%s,%s,,\n','Delimiter',',') ;
    
    % stores students personal data
    IDs       = aux{1,2} ; surnames = aux{1,3} ; names   = aux{1,4} ;
  fclose(fid);
  % ---------------------------
  
  fplanillaVals = fopen( [ outputFolder 'generatedParams.csv'],'w' );

  currFolder = cd(testFolder) ;
  
  if exist( 'nLetras' ) == 0 || nLetras > length( surnames )
    nLetras = length( surnames ) ;
  end
    
  % genera letras
  fprintf( [ ' Starting Exam files generation: \n'] ) ;
  
  for i=1:nLetras
  
    % etiquetas auxiliares
    surnameLabel = strrep( strrep( surnames{i,1} , " ", "-" ),"'","-" ) ;
    nameLabel    = strrep( strrep( names{i,1}    , " ", "-" ),"'","-" ) ;

    fprintf( sprintf( '  %3i - %s ', i, surnameLabel ) ) ;
    
    testFilename = sprintf( '%s_%03i_%s.pdf', testLabel, i, surnameLabel ) ;
    % ------------------

        
    % --- writes parameters file ---
    fprintf( fplanillaVals, '%03i', i );
    writeParamsFile( paramRanges, nameLabel, surnameLabel, IDs{i,1}, fplanillaVals ) ;
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
