\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{wtpc}  %[Clase para charlas del WTPC]
\LoadClass{beamer}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% COLORS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{codeComment}{rgb}{0,0.6,0}
\definecolor{codeNumber}{rgb}{0.5,0.5,0.5}
\definecolor{codeString}{rgb}{0.58,0,0.82}
\definecolor{codeBackground}{rgb}{0.95,0.95,0.92}
\definecolor{codeKeyword}{rgb}{0.9,0,0.9}
\definecolor{shellBackground}{rgb}{0,0,0}
\definecolor{shellBasic}{rgb}{1,1,1}
\logo{\includegraphics[width=0.1\textwidth]{logos/wtpc.png}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%% AUTHORS DATA AND STYLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{WTPCcolor}{RGB}{127,232,76}

\DeclareOption*{\PassOptionToClass{\CurrentOption}{beamer}}
\DeclareOption{cecilia}{
  \author{Cecilia Jarne}
  \date{\href{mailto:katejarne@gmail.com}{katejarne@gmail.com}}
  \definecolor{WTPCcolor}{RGB}{96,237,255}
}
\DeclareOption{graciela}{
  \author{M. Graciela Molina}
  \date{\href{mailto:m.graciela.molina@gmail.com}{m.graciela.molina@gmail.com}}
  \definecolor{WTPCcolor}{RGB}{140,76,232}
}
\DeclareOption{pablo}{
  \author{Pablo N. Alcain}
  \date{\href{mailto:pabloalcain@gmail.com}{pabloalcain@gmail.com}}
  \definecolor{WTPCcolor}{RGB}{255,119,103}
}
\DeclareOption{rodrigo}{
  \author{Rodrigo Lugones}
  \date{\href{mailto:rodrigolugones@gmail.com}{rodrigolugones@gmail.com}}
  \definecolor{WTPCcolor}{RGB}{127,232,76}
}
\ProcessOptions\relax




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Captions
\RequirePackage{caption}
\RequirePackage{subfigure}

%% Style
\RequirePackage{fancyhdr}
%\RequirePackage[includefoot, includehead]{geometry}
%\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{psfrag}
\RequirePackage{verbatim}
\RequirePackage{xcolor}
\RequirePackage{paralist}

%% Idioma
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}

%% Symbols
\RequirePackage{amsmath}
\RequirePackage{amssymb}

%% Code
\RequirePackage{listings}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{lstlinebgrd} %To highlight code
\RequirePackage{pgffor} %To highlight code


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% BEAMER CUSTOMIZATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usetheme{Madrid}
\setbeamercolor{structure}{fg=black!40!WTPCcolor}

%% Itemize
\setbeamertemplate{itemize items}[circle]

%% Transparency
\setbeamercovered{transparent=0}

%% List numbering across frames
\newcounter{savedenum}
\newcommand*{\saveenum}{\setcounter{savedenum}{\theenumi}}
\newcommand*{\resume}{\setcounter{enumi}{\thesavedenum}}

\graphicspath{{./fig/}, {./}}
%\def\DeclareAuthorVariable#1{\@namedef{#1}##1{\@namedef{@#1}{##1}}}
%\DeclareAuthorVariable{email}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% INCLUDING CODE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic style for all languages
\lstdefinestyle{codeAll}{
  backgroundcolor=\color{codeBackground},
  commentstyle=\color{codeComment}\ttfamily,
  keywordstyle=\color{codeKeyword}\ttfamily,
  numberstyle=\tiny\color{codeNumber}\ttfamily,
  stringstyle=\color{codeString}\ttfamily,
  basicstyle=\footnotesize\ttfamily,
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  columns=fullflexible,
  keepspaces=true,
  numbers=left,
  numbersep=3pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
}

% C Style
\lstdefinestyle{C}{
  style=codeAll,
  language=C,
}

% Fortran Style
\lstdefinestyle{Fortran}{
  style=codeAll,
  language=Fortran,
}

% C++ Style
\lstdefinestyle{Cpp}{
  style=codeAll,
  language=C++,
}

% Python Style
\lstdefinestyle{Python}{
  style=codeAll,
  language=Python,
  classoffset=2,
  morekeywords={as},
  classoffset=3,
  morekeywords={__init__, self},
  keywordstyle=\color{blue},
}

% Shell style
\lstdefinestyle{shell}{
  style=codeAll,
  backgroundcolor=\color{shellBackground},
  numberstyle=\tiny,
  basicstyle=\color{shellBasic}\footnotesize\ttfamily,
  language=bash,
}

% Definitions
\newcommand{\includecode}[2]{
  \begin{mdframed}[backgroundcolor=codeBackground,hidealllines=true,%
    innerleftmargin=0cm,innerrightmargin=0cm,innertopmargin=-0.5cm,innerbottommargin=-0.5cm]
    \lstinputlisting[#1]{#2}
  \end{mdframed}
}
\newcommand{\includeshell}[1]{
  \begin{mdframed}[backgroundcolor=shellBackground,hidealllines=true,%
    innerleftmargin=0cm,innerrightmargin=0cm,innertopmargin=-0.5cm,innerbottommargin=-0.5cm]
    \lstinputlisting[style=shell]{#1}
  \end{mdframed}
}
\newcommand{\codeinline}[2]{\lstinline[style=#1]{#2}}
\newcommand{\shellinline}[1]{\colorbox{shellBackground}{\lstinline[style=shell]{#1}}}

\lstnewenvironment{code}[2][]{
  \lstset{#2, #1}
  \mdframed[backgroundcolor=codeBackground,hidealllines=true,%
    innerleftmargin=0cm,innerrightmargin=0cm,innertopmargin=-0.5cm,innerbottommargin=-0.5cm]
}
{\endmdframed}
\lstnewenvironment{shell}[1][]{
  \lstset{style=shell, #1}
  \mdframed[backgroundcolor=shellBackground,hidealllines=true,%
    innerleftmargin=0cm,innerrightmargin=0cm,innertopmargin=-0.5cm,innerbottommargin=-0.5cm]
}
{\endmdframed}


%% Highlight code
\newcount\bt@rangea
\newcount\bt@rangeb

\newcommand\btIfInRange[2]{%
  \global\let\bt@inrange\@secondoftwo%
  \edef\bt@rangelist{#2}%
  \foreach \range in \bt@rangelist {%
    \afterassignment\bt@getrangeb%
    \bt@rangea=0\range\relax%
    \pgfmathtruncatemacro\result{ ( #1 >= \bt@rangea) && (#1 <= \bt@rangeb) }%
    \ifnum\result=1\relax%
    \breakforeach%
    \global\let\bt@inrange\@firstoftwo%
    \fi%
  }%
  \bt@inrange%
}
\newcommand\bt@getrangeb{%
  \@ifnextchar\relax%
  {\bt@rangeb=\bt@rangea}%
  {\@getrangeb}%
}
\def\@getrangeb-#1\relax{%
  \ifx\relax#1\relax%
  \bt@rangeb=100000%   \maxdimen is too large for pgfmath
  \else%
  \bt@rangeb=#1\relax%
  \fi%
}

% \btLstHL<overlay spec>{range list}
\newcommand<>{\btLstHL}[1]{%
  \only#2{\btIfInRange{\value{lstnumber}}{#1}%
    {\color{orange!30}}%
    {\def\lst@linebgrdcmd####1####2####3{}}% define as no-op
  }%
}%
\endinput
