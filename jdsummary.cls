\ProvidesClass{jdsummary}
\LoadClass[12pt]{scrartcl}

\usepackage[compact]{titlesec}
\titlespacing*{\subsection}{0pt}{*0}{0pt}

\usepackage{xparse}

\newcommand{\gq}[1]{\glqq #1\grqq}

\makeatletter
	\newcommand{\course}[1]{\def \@course {#1}}
	\newcommand{\semester}[1]{\def \@semester {#1}}
\makeatother

%Geometry
\usepackage[top=2.5cm,
			bottom=3cm,
			right=2cm,
			left=2.5cm]{geometry} 
\geometry{a4paper}                   
\usepackage[parfill]{parskip}

%Language & Fonts
\usepackage[ngerman]{babel}
\usepackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text}

%Graphics
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{tabularx}

%Group content
\newcommand{\g}[1]{\begin{minipage}{\textwidth}#1\end{minipage}}

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
			\textbf{\large #1}\\[1mm]
			}
		\tabularx{\textwidth}{l@{~}X}
}{
		\endtabularx
}


\DeclareDocumentEnvironment{gsdefi}{o}{
	\IfNoValueTF{#1}{}
		{
		\textbf{\large #1}\\
		}
	\tabularx{\textwidth}{l@{~}X}
}{
	\endtabularx
}


%Title
\newcommand{\usec}[1]{
	\textbf{#1}\\
}


%Short enumerations
\usepackage{enumitem}
\setlist{nolistsep}
\DeclareDocumentEnvironment{sit}{o}
{
	\begin{minipage}{\textwidth}
		\vspace{1mm}
		\IfNoValueTF{#1}{}{\textbf{\large #1}}
		\begin{itemize}[noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt]
}{
		\end{itemize}
		\vspace{1mm}
	\end{minipage}
}

\DeclareDocumentEnvironment{snu}{o}
{
	\begin{minipage}{\textwidth}
		\IfNoValueTF{#1}{}{\textbf{\large #1}}
		\begin{enumerate}[noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt]
}{
		\end{enumerate}
		\vspace{1mm}
	\end{minipage}
}

\usepackage{float}
\usepackage{hyperref}

\makeatletter
	\usepackage{fancyhdr}
	\pagestyle{fancy}
	\renewcommand{\footrulewidth}{\headrulewidth}
	\fancyhf{}

	\newcommand{\updateheaders}{
		\ifx \@course \@empty
			\relax
		\else
			\fancyhead[R]{Zusammenfassung \@course}
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
%\sld	Format: Italicword colon & - Word (#1) - used within either gdefi or gsdefi environments
% ssep	Small Separator: \\[-1em] Be careful: This breaks easily
%Environments:
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