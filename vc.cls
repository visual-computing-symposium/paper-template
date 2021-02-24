%%
%% ``vc.cls'' is a paper template class for visual computing (VC) symposiums.
%%
%% Copyright 2021 Yuki Koyama
%%
%% This class file is distributed under the MIT License.
%%
\ProvidesClass{vc}[2021/02/24]

\LoadClass[autodetect-engine,dvi=dvipdfmx,a4paper,twocolumn,ja=standard]{bxjsarticle}

% Reference: https://qiita.com/zr_tex8r/items/297154ca924749e62471
\RequirePackage{bxpapersize}

\pagestyle{empty}
\setlength{\topmargin}{-2cm}
\setlength{\textwidth}{18cm}
\setlength{\textheight}{25.5cm}
\setlength{\oddsidemargin}{-10mm}
\setlength{\evensidemargin}{-10mm}
\setlength{\columnsep}{6mm}

\renewcommand{\maketitle}{%
  \twocolumn[\vc@maketitle]
}
\newcommand{\vc@maketitle}{%
  \begin{center}
    \ifx\@title\@undefined\else{\LARGE\@title\par}\fi
    \vskip 3mm
    \ifx\@author\@undefined\else
      \@author
    \fi
  \end{center}
}
