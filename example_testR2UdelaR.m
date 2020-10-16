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
clear all, close all, addpath('./src');


% ==============================================================================
% ==========               example generation tests              ===============

% flag for setting output:
%   1 generate test without solution | 2 generate pdf with solutions
outputFlag = 1 ; 

% data structures for test information
testStrings = struct() ;
paramRanges = struct() ;

% set strings
testStrings.csvActa = ...
  './example_Folders/listStudentsFolder/ejemploActaUdelaR.csv'  ;
testStrings.testFolder = ...
  './carpetasEjemplo/carpetaLetraBaseEjemplo'                   ;
testStrings.testLabel = ...
  'PruebaEjemplo'                                               ;

paramRanges.names  = {'ejUnoLargo','ejUnoArea'} ;
paramRanges.iniVal = {          1 ,        0.1 } ;
paramRanges.endVal = {          2 ,        0.3 } ;
paramRanges.deltas = {         .5 ,        0.1 } ;

% 
%~ geLePru( outputFlag, stringsUtiles, rangosParametros ) 
