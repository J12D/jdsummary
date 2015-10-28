\ProvidesClass{jdsummary}
\LoadClass[parskip=half]{scrartcl}

%\RedeclareSectionCommands[
%  beforeskip=-.5\baselineskip,
%  afterskip=.25\baselineskip
%]{section,subsection,subsubsection}
%\RedeclareSectionCommands[
%  beforeskip=.5\baselineskip,
%  afterskip=-1em]{paragraph,subparagraph}

\RequirePackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text}

\RequirePackage{jdcommands}
\jdfontsetup{}

\usepackage{setspace}\onehalfspacing
\AtBeginDocument{%
  \addtolength\abovedisplayskip{-0.5\baselineskip}%
  \addtolength\belowdisplayskip{-0.5\baselineskip}%
%  \addtolength\abovedisplayshortskip{-0.5\baselineskip}%
%  \addtolength\belowdisplayshortskip{-0.5\baselineskip}%
}

\RequirePackage{hyperref}

%Graphics
\RequirePackage{graphicx}
\RequirePackage{amsmath}

\newcommand{\remph}[1]{
	\textcolor{red}{#1}
}
