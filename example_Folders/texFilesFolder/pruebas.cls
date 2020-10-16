% ====================================================
% =============     pruebas.cls     ===================
%
% Clase de LaTeX para preparacion de pruebas escritas.
%
% Escrito para pruebas del Instituto de Estructuras y Transporte 
% de la Facultad de Ingenieria de la Universidad de la Republica.
% Montevido, Uruguay.
%
% Historial de versiones
% ----------------------------------------------------
% fecha       quien     version  detalle             
% ----------------------------------------------------
% 2012.06.05  jperez    0.1      creacion                    0.1
% 2012.06.06  jperez    0.2      contador partes + paquetes ams math
%
%
% Modo de compilacion: pdflatex
%
%
% ====================================================
%
%
%
\def\filename{pruebas.cls}
\def\fileversion{v0.2}
\def\filedate{2012/06/05}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pruebas}[\filedate\ \fileversion\ Tests composition]
\LoadClass[12pt,a4paper]{article}
%
%\RequirePackage{hyphenat}
\RequirePackage{hyperref}
\RequirePackage[spanish,es-nodecimaldot]{babel}
%\RequirePackage{nopageno}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{overpic}
%\RequirePackage{wrapfig}
\RequirePackage{setspace}
\RequirePackage{tabularx}
%\RequirePackage{eqparbox}
%\RequirePackage{times}
%
\RequirePackage[a4paper,bindingoffset=0.0cm,vcentering=true,%
top=2.0cm,bottom=1.5cm,left=2.25cm,right=2.25cm]{geometry}
% options
%\ProcessOptions\relax
%
\newcommand\curso[1]{%
  \global\def\@curso{#1}%
}
%
\newcommand\tipodeprueba[1]{%
  \global\def\@tipodeprueba{#1}%
}
%
\newcommand\fechaprueba[3]{%
  \day=#1
  \month=#2
  \year=#3
}
%
\newcommand\local@monthname{\ifcase\month\or
  Enero\or Febrero\or Marzo\or Abril\or Mayo\or Junio\or
  Julio\or Agosto\or Setiembre\or Octubre\or Noviembre\or Diciembre\fi %
}
%
\newcommand\tituloletra{%
  \noindent%
%  \begin{tabular}{ p{0.5\textwidth} p{0.5\textwidth} }
%  \noindent%
%      %
%      \begin{small}%
%        Instituto de Estructuras y Transporte, Departamento de Estructuras\\ %
%        %
%        Facultad de Ingenier\'{i}a, Universidad de la Rep\'ublica %
%      \end{small}%
%      %
%      &
%  
%    \includegraphics[width=.95\textwidth]{logo_udelar} % .21
%  %\tabularnewline
%  \end{tabular} %
  %
  \begin{minipage}[t]{.88\textwidth}%
    \vspace{0.5mm}%
    \noindent%
    %
    %\begin{small}%
    \@tipodeprueba\ de \@curso\ \\
  Ingenier\'ia Civil - Plan 97 \\
  Materia: Resistencia de Materiales %\\
  %\number\day\ de \local@monthname\ de \number\year
%      Instituto de Estructuras y Transporte\\ %
%      Departamento de Estructuras\\ %
%      %
%      Facultad de Ingenier\'{i}a, Universidad de la Rep\'ublica %
    %\end{small}%
    %
%  \datosestudiante
  \end{minipage}%
  %
  \begin{minipage}[t]{.12\textwidth}
    \vspace{0.5mm}%
    \includegraphics[width=.95\textwidth]{logo_udelar} % .21
  \end{minipage} %
  %
  \vspace{-1.5cm}
  \begin{center} %
  	\textbf{\large{ \@tipodeprueba\ de \@curso\ }}\\
  	%\textbf{
  	\large{\number\day\ de \local@monthname\ de \number\year}
  	%} %
  \end{center}%
}
%
\newcommand\titulosolucion{%
\setcounter{ejercicio}{0}
\setcounter{pregunta}{0}
  \noindent
  \begin{minipage}[t]{.88\textwidth}
   \vspace{0.5mm}%
   \noindent
  %
  Soluci\'on de \@tipodeprueba\ de \@curso\ \\
  Ingeniería Civil - Plan 97 \\
  Materia: Resistencia de Materiales
%  Instituto de Estructuras y Transporte\\ %
%  Departamento de Estructuras\\ %
%  %
%  Facultad de Ingenier\'{\i}a, Universidad de la Rep\'ublica %
  \begin{center} %
  \textbf{\large{Soluci\'on de \@tipodeprueba\ de \@curso\ }}\\
  \large{\number\day\ de \local@monthname\ de \number\year}
  \end{center} %
  \end{minipage}%
  \begin{minipage}[t]{.12\textwidth}
    \vspace{0.5mm}%
    \includegraphics[width=.95\textwidth]{logo_udelar} % .21
  \end{minipage}
  %
  %\vspace{3mm}
  %
}
%
\newcounter{parte}
%
\newcommand{\parte}{
  \stepcounter{parte}
  \vskip 2mm
  \par\noindent{\alph{parte})}\;
}
%
\newcounter{ejercicio}
\setcounter{ejercicio}{0}
\newcommand{\ejercicio}{
  \setcounter{parte}{0}
  \stepcounter{ejercicio}
  \vskip 4mm
  \par\noindent{\large{\bf Ejercicio \arabic{ejercicio}}}\;
%    \vskip 4mm
}
%
\newcounter{pregunta}
\setcounter{pregunta}{0}
\newcommand{\pregunta}{
  \setcounter{parte}{0}
  \stepcounter{pregunta}
  \vskip 4mm
  \par\noindent{\large{\bf Pregunta \arabic{pregunta}}}\;
}
%
\newcommand\datosestudiante{%
  \begin{small}
  \begin{center} %
%    \begin{tabular}{ccc} %
    \begin{tabular}{|c|c|c|} %
      \hline %
      N\'umero de prueba  & APELLIDO, Nombre & C\'edula de identidad\\
      \hline
      \hspace{1.5cm} & \hspace{5cm} & \hspace{5.5cm}\\
        &  & \\
      \hline
    \end{tabular} %
  \end{center} %
  \end{small}
}
%%
\newcommand\titulohojadeformulas{%
  \noindent
  \begin{minipage}[t]{.88\textwidth}
   \vspace{0.5mm}%
   \noindent
  %
  Hoja de fórmulas - \@tipodeprueba\ de \@curso\ \\
  Ingeniería Civil - Plan 97 \\
  Materia: Resistencia de Materiales
%  Instituto de Estructuras y Transporte\\ %
%  Departamento de Estructuras\\ %
%  %
%  Facultad de Ingenier\'{\i}a, Universidad de la Rep\'ublica %
  \begin{center} %
  \textbf{\large{Hoja de fórmulas}}\\
  \large{\number\day\ de \local@monthname\ de \number\year}
  \end{center} %
  \end{minipage}%
  \begin{minipage}[t]{.12\textwidth}
    \vspace{0.5mm}%
    \includegraphics[width=.95\textwidth]{logo_udelar} % .21
  \end{minipage}
  %
  %\vspace{3mm}
  %
}
%%
