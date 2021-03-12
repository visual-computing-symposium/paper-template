%%
%% ``vc.cls'' is a paper template class for visual computing (VC) symposiums.
%%
%% Copyright 2021 Yuki Koyama
%%
%% This class file is distributed under the MIT License.
%%
\ProvidesClass{vc}[2021/02/24]

\LoadClass[autodetect-engine,dvi=dvipdfmx,a4paper,twocolumn,ja=standard]{bxjsarticle}

\RequirePackage[hyphens]{url}
\RequirePackage[colorlinks]{hyperref}
\RequirePackage[all]{hypcap}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{array}
\RequirePackage[square,sort,comma,numbers]{natbib}

% Reference: https://qiita.com/zr_tex8r/items/297154ca924749e62471
\RequirePackage{bxpapersize}

% For the \Collect@Body command
\RequirePackage{environ}

% For the \StrLen command
\RequirePackage{xstring}

% ------------------------------------------------------------------------------
% ページ全体の定義
% ------------------------------------------------------------------------------

\pagestyle{empty}

\setlength{\topmargin}{-2cm}
\setlength{\textwidth}{18cm}
\setlength{\textheight}{25.5cm}
\setlength{\oddsidemargin}{-10mm}
\setlength{\evensidemargin}{-10mm}
\setlength{\columnsep}{6mm}

% ------------------------------------------------------------------------------
% 色の定義
% ------------------------------------------------------------------------------

\colorlet{LinkColor}{NavyBlue}
\hypersetup{allcolors=LinkColor}

% ------------------------------------------------------------------------------
% \autorefの表記の設定
% ------------------------------------------------------------------------------

\renewcommand{\equationautorefname}{式}
\renewcommand{\figureautorefname}{図}
\renewcommand{\tableautorefname}{表}
\renewcommand{\sectionautorefname}{\S}
\renewcommand{\subsectionautorefname}{\S}
\renewcommand{\subsubsectionautorefname}{\S}

% ------------------------------------------------------------------------------
% 参考文献のスタイル設定
% ------------------------------------------------------------------------------

\renewcommand*{\bibfont}{\small}

% ------------------------------------------------------------------------------
% 環境の定義
% ------------------------------------------------------------------------------

\newenvironment{authors}{\Collect@Body\@saveauthors}{}
\long\def\@saveauthors#1{\long\gdef\@authors{#1}}
\@saveauthors{}

\newenvironment{affiliations}{\Collect@Body\@saveaffiliations}{}
\long\def\@saveaffiliations#1{\long\gdef\@affiliations{#1}}
\@saveaffiliations{}

\newenvironment{emails}{\Collect@Body\@saveemails}{}
\long\def\@saveemails#1{\long\gdef\@emails{#1}}
\@saveemails{}

\renewenvironment{abstract}{\Collect@Body\@saveabstract}{}
\long\def\@saveabstract#1{\long\gdef\@abstract{#1}}
\@saveabstract{}

\newenvironment{teaserfigure}{\Collect@Body\@saveteaser}{}
\long\def\@saveteaser#1{\long\gdef\@teaser{#1}}
\@saveteaser{}

% ------------------------------------------------------------------------------
% タイトル部分の定義
% ------------------------------------------------------------------------------

\renewcommand{\maketitle}{%
  \twocolumn[\vc@maketitle]
}
\newcommand{\vc@maketitle}{%
  \begin{center}
    \ifx\@title\@undefined\else
      {\LARGE\@title\par}
    \fi
    \vskip 3mm
    \ifx\@authors\@undefined\else
      \begingroup
        \large
        \centering
        \@authors
      \endgroup
      \vskip 1mm
    \fi
    \ifx\@affiliations\@undefined\else
      \@affiliations
    \fi
    \ifx\@emails\@undefined\else
      \vskip 0mm
      \@emails
    \fi
    \ifx\@abstract\@undefined\else
      \StrLen{\@abstract}[\length@abstract]
      \ifnum\length@abstract>0
        \vskip 3mm
        \parbox{.8\textwidth}{\small \textbf{概要} \@abstract}
        \vskip 2mm
      \fi
    \fi
    \ifx\@teaser\@undefined\else
      \vskip 2mm
      \begingroup
        \def\@captype{figure}
        \@teaser
      \endgroup
      \vskip 5mm
    \fi
  \end{center}
}

% ------------------------------------------------------------------------------
% PDFメタデータの設定
% ------------------------------------------------------------------------------

\newcommand{\plainauthors}[1]{\gdef\@plainauthors{#1}}

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
  \hypersetup{
    pdftitle={\@title},
    pdfauthor={\@plainauthors},
  }
  \oldmaketitle
}
