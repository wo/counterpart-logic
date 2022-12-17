\ProvidesClass{woarticle}
\NeedsTeXFormat{LaTeX2e}

% parent class scrartcl:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions
\LoadClass[footnotes=multiple]{scrartcl}

% encoding and language:
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[ddmmyyyy]{datetime}

% fonts and math packages:
\usepackage{framed}
\usepackage[framed]{ntheorem}
%\usepackage[fleqn,leqno]{amsmath}
\usepackage{amsmath}
%\usepackage{amsmath}
\usepackage{txfonts,latexsym,amssymb,nicefrac,mathrsfs}
\usepackage{textcomp}
%\usepackage{fouriernc}
%\usepackage[onlytext]{MinionPro}
%\renewcommand{\sfdefault}{Myriad-LF}
\usepackage{gensymb} % celsius
\usepackage{lmodern}


% titles serif
%\addtokomafont{disposition}{\rmfamily}
%\setkomafont{disposition}{\normalfont\sffamily}
%\addtokomafont{disposition}{\sffamily}
%\setkomafont{section}{\bfseries\fontsize{13}{15.5}\selectfont}
%\setkomafont{subsection}{\bfseries\fontsize{13}{15.5}\selectfont}


% indentation of left-aligned (fleqn) formulas:
\@ifundefined{mathindent}{}{%
  \setlength{\mathindent}{1.3\leftmargini}
}

% make lists take up less space
\usepackage{paralist}
\let\itemize\compactitem 
\let\description\compactdesc
\let\enumerate\compactenum

% additional packages:
\usepackage{booktabs,multirow,rotating}
\usepackage{eqlist}
\usepackage{mdwlist}

% layout:
\usepackage{url,ellipsis}
\usepackage[final=true,step=1]{microtype}
\usepackage{ragged2e}
\linespread{1.12}
\clubpenalty = 500
\widowpenalty = 1000
\urlstyle{sf}
\deffootnote[1.5em]{1.5em}{1.5em}{\thefootnotemark \hspace{0.2em}} 

%\setkomafont{sectioning}{\raggedright\sffamily}
%\renewcommand{\appendix}[1]{\section*{#1}}



% section headings:
% \usepackage{titlesec}
%\setkomafont{section}{\normalfont\fontsize{14}{17}\selectfont\scshape}
%\setkomafont{subsection}{\normalfont\slshape\fontsize{14}{17}\selectfont\scshape}
\setkomafont{section}{%
\renewcommand{\bfdefault}{sb}%
\fontfamily{put}\bfseries\fontsize{13}{15.5}\selectfont%
\renewcommand{\bfdefault}{bx}%
}
\setkomafont{subsection}{%
\renewcommand{\bfdefault}{sb}%
\fontfamily{put}\bfseries\fontsize{12}{13.5}\selectfont%
\renewcommand{\bfdefault}{bx}%
}


% TOC layout: reduces spaces between section entries and add dots
\usepackage{titletoc}
\titlecontents{section}[1.5em]
  {}
  {\contentslabel{1.5em}}
  {\hspace*{-2.3em}}
  {\titlerule*[1pc]{.}\contentspage}
\titlecontents{subsection}[4em]
  {}
  {\contentslabel{2.8em}}
  {\hspace*{-2.3em}}
  {\titlerule*[1pc]{.}\contentspage}

% colors and links:
\usepackage{xcolor,colortbl,graphicx} 
\definecolor{linkcol}{rgb}{0,0.1,0.4}
\definecolor{citecol}{rgb}{0,0.2,0.2}
\definecolor{notecol}{rgb}{0.2,0.2,0.2}
\usepackage[colorlinks=true,
            linkcolor=linkcol,
            urlcolor=linkcol,
            citecolor=citecol]{hyperref}

% theorems etc:
\theoremstyle{break}
%\theoremheaderfont{\scshape}
\theorembodyfont{\upshape}
\definecolor{gray}{rgb}{0.7,0.7,0.7}
\renewcommand*\FrameCommand{{\color{gray}\vrule width 4pt \hspace{10pt}}}
%\newframedtheorem{theorem}{Theorem}[section]
%\newframedtheorem{lemma}[theorem]{Lemma}
%\newframedtheorem{corollary}[theorem]{Corollary}
%\newframedtheorem{definition}[theorem]{Definition}
%\newtheorem{rem}[theorem]{Remark}
\theoremstyle{nonumberplain}
\theorembodyfont{\small}
\theoremheaderfont{\normalfont\scshape}
\theoremindent0.5cm
\theoremseparator{}
\newtheorem{proof}{Proof}
%\newenvironment{proof}%
%{\begin{list}{}%
%         {\setlength{\leftmargin}{0mm}}%
%         \item[]\small%
%}
%{\end{list}}

% own commands and environments:
\def\qed{{\parfillskip=0pt \widowpenalty=10000 \displaywidowpenalty=10000 %
          \finalhyphendemerits=0 \leavevmode \unskip \nobreak \hfil \penalty50 %
          \hskip.2em \null \hfill $\rule{1.2ex}{1.2ex}$ \par}}
\DeclareFontFamily{OT1}{pzc}{}
\DeclareFontShape{OT1}{pzc}{m}{it}{<-> s * [1.15] pzcmi7t}{}
\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}
\newcommand{\Fr}[1]{\ensuremath{\mathpzc{#1}}}
\newcommand{\Sc}[1]{\ensuremath{\mathpzc{#1}}}
\newcommand{\then}{\supset}
\renewcommand{\t}[1]{\ensuremath{\langle #1 \makebox[.2ex]{}\rangle}}
\newcommand{\The}{\mathrm{\rotatebox[origin=c]{180}{$\iotaup$}}}

\let\description=\eqlist
\let\enddescription=\endeqlist
\let\eqlistlabel\descriptionlabel
\newenvironment{semantics}{\begin{description}}{\end{description}}
%\newenvironment{remark}%
%{\begin{rem}\begin{enumerate}[(i)]}%
%{\end{enumerate}\end{rem}}
\newenvironment{cenum}%
{\medskip\begin{compactenum}}%
{\end{compactenum}\medskip\noindent}

% citations:
\usepackage{natbib}
\bibpunct[: ]{[}{]}{,}{A}{}{,~}
\renewcommand{\cite}[2][]{\citep[#1]{#2}}
\newcommand{\citey}[2][]{\citeyearpar[#1]{#2}}
\newcommand{\citeplain}[2][]{\citealt[#1]{#2}}
\newcommand{\citeyplain}[2][]{\citeyear[#1]{#2}}

% "compiled on" header:
\usepackage[headsepline]{scrlayer-scrpage}
% \pagestyle{empty}
\definecolor{headercol}{rgb}{0.4, 0.4, 0.4}
\deftriplepagestyle{compiledheader}{}{}
    {\color{headercol}\footnotesize compiled on \today}
    {} {} {}
% \thispagestyle{fancy}

% title:
\usepackage[UKenglish]{isodate}
\usepackage{setspace}
\cleanlookdateon% Remove ordinal day reference
\RequirePackage{pdfpages}
\definecolor{linecol}{rgb}{0.8,0.8,0.8}
\renewcommand{\maketitle}{%
\thispagestyle{compiledheader}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
%  \begin{center}
%\noindent{\color{linecol}\rule{\linewidth}{.2pt}}\\[4mm]
\renewcommand{\bfdefault}{sb}
%{\noindent\LARGE{\fontfamily{qtm}{qtm\textbf{\@title}}}}\\[10mm]
%{\noindent\LARGE{\fontfamily{qbg}{qbk\textbf{\@title}}}}\\[10mm]
%{\noindent\LARGE{\fontfamily{qcs}{qcs\textbf{\@title}}}}\\[10mm]
% {\noindent\LARGE{\fontfamily{put}{\textsb{\@title}}}}\\[7mm] % put is Utopia/Fourier
\definecolor{titlecol}{rgb}{0.38, 0.4, 0.4}
\begin{center}
  \par
  \hyphenpenalty=10000
  \exhyphenpenalty=10000
  \sloppy
  \setstretch{1.8}
  {\noindent\LARGE{\fontfamily{put}{\color{titlecol}\textbf{\@title}}}}\\[7mm] % put is Utopia/Fourier
%{\noindent\LARGE{\fontfamily{qhv}{qhv\textbf{\@title}}}}\\[10mm]
\end{center}
\begin{center}
%{\noindent\LARGE{\fontfamily{phv}{phv\textbf{\@title}}}}\\[10mm]
  %    {\Large\textbf{\sffamily \@subtitle}}\\[4mm]
%{\large{\sffamily\@author}}
{\large\fontfamily{put}{\@author}}\\[1mm]
\noindent{\large\fontfamily{put}{\@date}}
%\noindent{\large{\sffamily \@date}}
\end{center}
\bigskip

%\noindent{\color{linecol}\rule{\linewidth}{.2pt}}
  \@thanks
  \medskip
%  \end{center}
\renewcommand{\thefootnote}{\arabic{footnote}}
\setcounter{footnote}{0}
\renewcommand{\bfdefault}{bx}
}

