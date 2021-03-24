%%
%% ``vc.cls'' is a paper template class for visual computing (VC) symposiums.
%%
%% Copyright 2021 Yuki Koyama
%%
%% This class file is distributed under the MIT License.
%%
\ProvidesClass{vc}[2021/03/24 v1.2]

\DeclareOption{anonymous}{\def\vc@anonymous{}}
\DeclareOption{english}{\def\vc@english{}}
\ProcessOptions\relax

\LoadClass[autodetect-engine,dvi=dvipdfmx,a4paper,twocolumn,ja=standard,base=10pt]{bxjsarticle}

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
\RequirePackage[noabbrev,nameinlink]{cleveref}

% Reference: https://qiita.com/zr_tex8r/items/297154ca924749e62471
\RequirePackage{bxpapersize}

% For the \Collect@Body command
\RequirePackage{environ}

% For the \titlespacing command
\RequirePackage{titlesec}

% For enforce first paragraphs to be indented (to follow Japanese tradition)
\ifx\vc@english\@undefined
  \RequirePackage{indentfirst}
\fi

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
\renewcommand{\baselinestretch}{0.9}

\titlespacing*{\section}{0pt}{12.0pt}{6.0pt}
\titlespacing*{\subsection}{0pt}{8.0pt}{4.0pt}
\titlespacing*{\subsubsection}{0pt}{4.0pt}{2.0pt}

% ------------------------------------------------------------------------------
% 色の定義
% ------------------------------------------------------------------------------

\colorlet{LinkColor}{NavyBlue}
\hypersetup{allcolors=LinkColor}

% ------------------------------------------------------------------------------
% \autorefの表記の設定
% ------------------------------------------------------------------------------

\ifx\vc@english\@undefined
  \renewcommand{\equationautorefname}{式}
  \renewcommand{\figureautorefname}{図}
  \renewcommand{\tableautorefname}{表}
  \renewcommand{\sectionautorefname}{\S}
  \renewcommand{\subsectionautorefname}{\S}
  \renewcommand{\subsubsectionautorefname}{\S}
\fi

% ------------------------------------------------------------------------------
% \crefの表記の設定
% ------------------------------------------------------------------------------

\ifx\vc@english\@undefined
  \crefname{section}{}{}
  \crefname{subsection}{}{}
  \crefname{subsubsection}{}{}
  \crefname{figure}{}{}
  \crefname{table}{}{}
  \crefname{equation}{}{}
  \creflabelformat{section}{#2第#1節#3}
  \creflabelformat{subsection}{#2第#1小節#3}
  \creflabelformat{subsubsection}{#2第#1項#3}
  \creflabelformat{figure}{#2図#1#3}
  \creflabelformat{table}{#2表#1#3}
  \creflabelformat{equation}{#2式(#1)#3}
\fi

% ------------------------------------------------------------------------------
% 英語環境における追加定義
% ------------------------------------------------------------------------------

\ifx\vc@english\@undefined\else
  \renewcommand{\figurename}{Figure\ }
  \renewcommand{\tablename}{Table\ }
  \renewcommand{\refname}{References}
\fi

% ------------------------------------------------------------------------------
% 参考文献のスタイル設定
% ------------------------------------------------------------------------------

\renewcommand*{\bibfont}{\small}

% ------------------------------------------------------------------------------
% 環境の定義
% ------------------------------------------------------------------------------

\newenvironment{authors}{\Collect@Body\@saveauthors\ignorespaces}{\ignorespacesafterend}
\long\def\@saveauthors#1{\long\gdef\@authors{#1}}
\@saveauthors{}

\newenvironment{affiliations}{\Collect@Body\@saveaffiliations\ignorespaces}{\ignorespacesafterend}
\long\def\@saveaffiliations#1{\long\gdef\@affiliations{#1}}
\@saveaffiliations{}

\newenvironment{emails}{\Collect@Body\@saveemails\ignorespaces}{\ignorespacesafterend}
\long\def\@saveemails#1{\long\gdef\@emails{#1}}
\@saveemails{}

\renewenvironment{abstract}{\Collect@Body\@saveabstract\ignorespaces}{\gdef\@abstract@defined{}\ignorespacesafterend}
\long\def\@saveabstract#1{\long\gdef\@abstract{#1}}
\@saveabstract{}

\newenvironment{teaserfigure}{\Collect@Body\@saveteaser\ignorespaces}{\ignorespacesafterend}
\long\def\@saveteaser#1{\long\gdef\@teaser{#1}}
\@saveteaser{}

% ------------------------------------------------------------------------------
% タイトル部分の定義
% ------------------------------------------------------------------------------

\renewcommand{\maketitle}{%
  \twocolumn[\vc@maketitle]
  \ifx\@abstract@defined\@undefined\else
    \ifx\vc@english\@undefined
      \section*{概要}
    \else
      \section*{Abstract}
    \fi
    \@abstract
  \fi
}
\newcommand{\vc@maketitle}{%
  \begin{center}
    \ifx\@title\@undefined\else
      {\LARGE\textbf{\@title}\par}
    \fi
    \vskip 3mm
    \ifx\@authors\@undefined\else
      \begingroup
        \large
        \centering
        \ifx\vc@anonymous\@undefined
          \@authors
        \else
          Anonymous Authors
        \fi
      \endgroup
      \vskip 1mm
    \fi
    \ifx\@affiliations\@undefined\else
      \ifx\vc@anonymous\@undefined
        \@affiliations
      \fi
    \fi
    \ifx\@emails\@undefined\else
      \ifx\vc@anonymous\@undefined
        \vskip 0mm
        \@emails
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

\newcommand{\plainauthors}[1]{
  \ifx\vc@anonymous\@undefined
    \gdef\@plainauthors{#1}
  \else
    \gdef\@plainauthors{Anonymous Authors}
  \fi
}

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
  \hypersetup{
    pdftitle={\@title},
    pdfauthor={\@plainauthors},
  }
  \oldmaketitle
}
