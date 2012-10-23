\ProvidesClass{jdsummary}
\LoadClass[12pt]{scrartcl}

\usepackage[compact]{titlesec}
\titlespacing*{\subsection}{0pt}{*0}{0pt}

\usepackage{xparse}

\makeatletter
\newcommand*\DefVar[1]{\@namedef{#1}##1{\global\@namedef{get#1}{##1}}}
\makeatother

\DefVar{course}

%%Title
%\makeatletter
%\RenewDocumentCommand{\title}{}{
%	\def \@title {\@course}
%}
%\makeatother

%Geometry
\usepackage[top=2.5cm,
			bottom=3cm,
			right=2cm,
			left=2.5cm]{geometry} 
\geometry{a4paper}                   
\usepackage[parfill]{parskip}

%Language & Fonts
\usepackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text}

%Graphics
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{tabularx}

\usepackage{color}
\usepackage[usenames,dvipsnames]{xcolor}

\newcommand{\remph}[1]{
	\textcolor{red}{#1}
}

%Highlight
\newcommand{\ssec}[1]{
	\textbf{#1}
}

\newcommand{\lsec}[1]{
	{
		\large
		\textbf{#1}\\
	}
}

%Title
\newcommand{\usec}[1]{
	\textbf{#1}\\
}

\newcommand{\esec}[1]{
	\textbf{#1}\nopagebreak
}


%%Group content
%\newcommand{\g}[1]{\begin{minipage}{\textwidth}#1\end{minipage}}

%Single Definitions
\newcommand{\ld}[1]{\textbf{#1}:&}
\newcommand{\sld}[1]{~~~\textsl{#1}:&}

\renewcommand{\tabcolsep}{0pt}

\newcommand{\defi}[2]{
	\begin{tabularx}{\textwidth}{l@{~}X}
	\ld{#1}#2\\
	\end{tabularx}
}

\newcommand{\sdefi}[2]{
	\begin{tabularx}{\textwidth}{l@{~}X}
	\sld{#1}#2\\
	\end{tabularx}
}

%Group of Definitions
\DeclareDocumentEnvironment{gdefi}{o}{
		\IfNoValueTF{#1}{}
			{
			\textbf{#1}\\[1mm]
			}
		\tabularx{\textwidth}{l@{~}X}
}{
		\endtabularx
}


\DeclareDocumentEnvironment{gsdefi}{o}{
	\IfNoValueTF{#1}{}
		{
		\textbf{#1}\nopagebreak\\[1mm]
		}
	\tabularx{\textwidth}{l@{~}X}
}{
	\endtabularx
}

\usepackage{float}
\usepackage{hyperref}

\makeatletter
	\usepackage{fancyhdr}
	\pagestyle{fancy}
	\renewcommand{\footrulewidth}{\headrulewidth}
	\fancyhf{}

	\newcommand{\updateheaders}{
		\ifx \getcourse \@empty
			\relax
		\else
			\fancyhead[R]{\getcourse}
		\fi
		
		\fancyhead[L]{JD}
	}

	\fancyfoot[C]{\pagemark}
\makeatother

%%%%%%
%Defined commands:
% \defi	Main Definition - Word (#1) Definition (#2)
% \sdefi	Side Definition - Word (#1) Definition (#2)
% \usec	Small Title - Word(#1) - (beneath \section or \subseciton)
% \ld		Format: Boldword colon & - Word (#1) - used within either gdefi or gsdefi environments
% \sld	Format: Italicword colon & - Word (#1) - used within either gdefi or gsdefi environments

%%%%%%
%Environments
% gdefi	Defines tabularx environment. (Many \defi{}s) Use \ld{word} or \sld{word}, followed by the definition and \\ for every line
% gsdefi	Defines tabularx environment. (Many \sdefi{}s) Use \ld{word} or \sld{word}, followed by the definition and \\ for every line
% sit		Defines compact item environment. Takes a title as an argument (#1). Use \item for entry
% sun	Defines compact enumerate environment. Takes a title as an argument (#1). Use \item for entry
%Example Usage:
%gdefi environment:
%%%\begin{gdefi}
%%%\ld{foo}bar\\
%%%\ld{abc}123\\
%%%\end{gdefi}
%%%%%%