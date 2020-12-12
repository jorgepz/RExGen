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

% auxiliar commands
clear all, close all; addpath( [ pwd '/../src'] );


% ==============================================================================
% ==========               example generation tests              ===============

% data structures for test information
testStrings = struct() ;
paramRanges = struct() ;

% set strings
testStrings.csvActa     = '../example_Folders/listStudentsFolder/ejemploActaUdelaR.csv' ;
testStrings.testFolder  = '../example_Folders/texFilesFolder'                           ;
testStrings.testLabel   = 'SimulacroR2'                                                ;
testStrings.numNotList  = 0                                                            ;

paramRanges.names  = { 'ejUnovalorA', 'ejUnovalorP', 'ejUnovalorL', 'ejDosvalorI','ejDosvalorL','ejDosvalorq','ejDosvalorP' } ;
paramRanges.iniVal = {            1 , 1, 1, 1,1, 1, 1 } ;
paramRanges.endVal = {           4  , 4, 4,4, 4, 4, 4 } ;
paramRanges.deltas = {           .5 ,        0.1,0.1,.5 ,        0.1 ,.5 ,        0.1  } ;

outputPath = './exampleC_generatedExams/' ;

generateExams( testStrings, paramRanges, outputPath ) ;
 
