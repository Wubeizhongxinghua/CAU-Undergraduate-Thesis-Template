%% caugraduatethesis.cls
%% Copyright 2023 李明阳
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%%
%% The Current Maintainer of this work is 李明阳.
%%
%% This work consists of the file caugraduatethesis.cls
%% and the derived files:
%%   Logo.jpg
%%   CAU_Course_Thesis_Template.tex
%%   CAU_Course_Thesis_Template.pdf
%%   gb7714-2015.bbx
%%   中国农业大学课程论文写作格式.doc
%% ---------------------------------------------------------------------------
%% Class Name   : caugraduatethesis
%% Description  : China Agricultural University Undergraduate Thesis LaTeX Template
%% Repository   : https://github.com/Wubeizhongxinghua/CAU-Undergraduate-Thesis-Template
%% Version      : 0.2
%% Copyright    : 2023 李明阳
%% E-mail       : limingyang200101@gmail.com
%% License      : LaTeX Project Public License v1.3c or later
%% License URI  : https://www.latex-project.org/lppl.txt
%% Files        : caugraduatethesis.cls
%%                pictures/fig1.png
%%                pictures/title.png
%%                CAU_Undergraduate_Thesis_Template.tex
%%                CAU_Undergraduate_Thesis_Template.pdf
%% ---------------------------------------------------------------------------

\ProvidesClass{caugraduatethesis}
\NeedsTeXFormat{LaTeX2e}
\LoadClass[a4paper]{article} % 继承自 article 文档类


%---------------- 基本包导入 ----------------
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{ctex}
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{zhnumber}
\RequirePackage{listings}
% \RequirePackage{tocloft}
% \RequirePackage{fancyhdr}
% \RequirePackage{pagenumbering}
%---------------- 默认字体设置 ----------------
% \setCJKmainfont{SimSun}
\setmainfont{Times New Roman}
% \RequirePackage{ifplatform}
% \ifmacosx
%     \RequirePackage{fontspec}
%     \setmainfont{Times New Roman}
%     \setsansfont{Arial}
%     \setmonofont{Courier New}
% \else
%     \RequirePackage{ctex}
%     \setmainfont{SimSun}
%     \setsansfont{SimHei}
%     \setmonofont{Courier}
% \fi
% \fontsize{12pt}
\zihao{-4}
%---------------- 设置页面布局 ----------------
\RequirePackage{geometry} % 使用 geometry 宏包
\geometry{
    top=30mm,
    bottom=25mm,
    left=30mm,
    right=25mm,
    headheight=23mm,
    footskip=7mm
}
\pagestyle{plain}
\setlength{\baselineskip}{20pt}

%---------------- 公式编号格式 ----------------
\RequirePackage{amsmath}
\numberwithin{equation}{section} % 设置公式编号格式，按照章节编号计数
\renewcommand{\theequation}{\thesection-\arabic{equation}} % 定义公式编号前缀，形如2-1
\makeatletter % 使@符号可用
\def\tagform@#1{\maketag@@@{公式(#1)}}
\makeatother % 恢复@符号原有意义

%---------------- 表格格式 ----------------
\RequirePackage{caption}
\RequirePackage{ifthen}
\captionsetup{labelsep=quad} % 设置表格编号和标题之间的间距
\DeclareCaptionLabelFormat{tableprefix}{表#2} % 定义表格编号格式 #2对应\thetable
\captionsetup[table]{labelformat=tableprefix} % 应用表格编号格式到所有表格
\renewcommand{\captionfont}{\zihao{5}\heiti}
\renewcommand{\thetable}{\thesection-\arabic{table}} %章节数-图序号
%如下设置使得\ref的输出格式与展示格式相同
% \numberwithin{table}{section}
% \renewcommand{\thetable}{\thesection-\arabic{table}} % 定义公式编号前缀，形如2-1
% \makeatletter % 使@符号可用
% \def\tagform@#1{\maketag@@@{表(#1)}}
% \makeatother % 恢复@符号原有意义

\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{xstring}
\newcolumntype{Z}{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}X}
\newcolumntype{Y}{>{\centering\arraybackslash}p{0.1\linewidth}}
\newcolumntype{W}{>{\centering\arraybackslash}p{0.2\linewidth}}

\newcommand{\tblcaption}{}
\newcommand{\tblanno}{}
\newcommand{\tblcontext}{}
\newcommand{\tblref}{}

\newcommand{\cautable}[5]{
    \renewcommand{\tblcaption}{#1}
    \renewcommand{\tblanno}{#3}
    \renewcommand{\tblcontext}{#5}
    \renewcommand{\tblref}{#4}
    % \newcolumntype{Y}{>{\centering\arraybackslash\songti\zihao{5}}X}
    \begin{table}[htbp]
        \centering % 表格整体居中
        \begin{threeparttable}
            \zihao{5}
            \songti
            \captionsetup{type=table}
            \ifthenelse{\equal{\tblcaption}{}}{}{
                \caption{\tblcaption}
            }
            \label{\tblref}
            \begin{tabularx}{\linewidth}{#2}
                \tblcontext
            \end{tabularx}
            \ifthenelse{\equal{\tblanno}{}}{}{
                \begin{tablenotes} % 使用 tablenotes 环境添加表格注释
                    \zihao{-5} \songti
                    \item 表注：\tblanno
                \end{tablenotes}
            }
        \end{threeparttable}
    \end{table}
}

%---------------- 图片格式 ----------------
\RequirePackage{float}
\newcommand{\figaddr}{}
\newcommand{\figcap}{}
\newcommand{\figdes}{}
\newcommand{\figwidth}{}
\newcommand{\figref}{}

\captionsetup{labelsep=quad} % 设置表格编号和标题之间的间距
\DeclareCaptionLabelFormat{figureprefix}{图#2} % 定义表格编号格式
\captionsetup[figure]{labelformat=figureprefix} % 应用表格编号格式到所有表格
\renewcommand{\captionfont}{\zihao{5}\heiti}
\renewcommand{\thefigure}{\thesection-\arabic{figure}}
%如下设置使得\ref的输出格式与展示格式相同
% \numberwithin{figure}{section}
% \renewcommand{\thefigure}{\thesection-\arabic{figure}} % 定义公式编号前缀，形如2-1
% \makeatletter % 使@符号可用
% \def\tagform@#1{\maketag@@@{图(#1)}}
% \makeatother % 恢复@符号原有意义

\newcommand{\caufig}[5]{
    \renewcommand{\figaddr}{#1}
    \renewcommand{\figcap}{#2}
    \renewcommand{\figdes}{#3}
    \renewcommand{\figwidth}{#4}
    \renewcommand{\figref}{#5}
 
    \begin{figure}[H]
        \centering
        \includegraphics[width=\figwidth \linewidth]{\figaddr}
        \captionsetup{type=figure}
        \caption{\figcap}
        \label{\figref}
        \ifthenelse{\equal{\figdes}{}}{}{
            % \vspace{0.5em}
            \captionsetup{font=small}
            \caption*{\figdes}
        }
    \end{figure}
}
%---------------- 封面 ----------------
% 定义封面参数
\newcommand{\thesistitlezh}{}
\newcommand{\thesistitleen}{}
\newcommand{\thesisauthor}{}
\newcommand{\thesisadvisor}{}
\newcommand{\thesiscoadvisor}{}
\newcommand{\thesisfield}{}
\newcommand{\thesiscollege}{}

\renewcommand{\today}{\number\year 年 \number\month 月}

% 定义 \makecover 命令，用于生成封面
\newcommand{\makecover}[7]{%
    %接收参数
    \renewcommand{\thesistitlezh}{#1}
    \renewcommand{\thesistitleen}{#2}
    \renewcommand{\thesisauthor}{#3}
    \renewcommand{\thesisadvisor}{#4}
    \renewcommand{\thesiscoadvisor}{#5}
    \renewcommand{\thesisfield}{#6}
    \renewcommand{\thesiscollege}{#7}

    \clearpage\thispagestyle{empty}%
    \begin{center}%
        \begin{spacing}{1.0833333333}
            \fontsize{10pt}{1.0\baselineskip}\selectfont
            \vspace*{4\baselineskip}
            \href{http://www.cau.edu.cn/}{\includegraphics[scale=0.5]{./pictures/title.jpg}}\\
            \fontsize{14pt}{1.0\baselineskip}\selectfont
            \vspace*{\baselineskip}
            \textbf{\zihao{-2}\selectfont\songti 本科生毕业论文（设计）}\\

            \fontsize{14pt}{1.0\baselineskip}\selectfont
            \vspace*{2\baselineskip}

            \begin{spacing}{1.625}
            {\zihao{2}\bfseries \heiti \thesistitlezh} \\
            \end{spacing}
            \fontsize{10pt}{0.5\baselineskip}\selectfont
            \vspace*{\baselineskip}
            \begin{spacing}{1.625}
            {\zihao{3}\bfseries \thesistitleen} \\
            \end{spacing}
            \fontsize{10pt}{1.0\baselineskip}\selectfont
            \vspace*{3\baselineskip}
        \end{spacing}
        \begin{spacing}{2.1666666667}
            {\zihao{4}
            \setlength{\parindent}{1.47cm}\makebox[9em][s]{学生姓名}：\underline{\makebox[14.6em][c]{\thesisauthor}}\\
            \setlength{\parindent}{1.47cm}\makebox[9em][s]{指导老师}：\underline{\makebox[14.6em][c]{\thesisadvisor}}\\
            \setlength{\parindent}{1.47cm}\makebox[9em][s]{合作指导教师}：\underline{\makebox[14.6em][c]{\thesiscoadvisor}}\\
            \setlength{\parindent}{1.47cm}\makebox[9em][s]{专业名称}：\underline{\makebox[14.6em][c]{\thesisfield}}\\
            \setlength{\parindent}{1.47cm}\makebox[9em][s]{所在学院}：\underline{\makebox[14.6em][c]{\thesiscollege}}\\}
        \end{spacing}
        \begin{spacing}{1.0833333333}
            \fontsize{14pt}{1.0\baselineskip}\selectfont
            % \vspace*{10\baselineskip}
            \vspace*{\fill}
            \today
        \end{spacing}
    \end{center}
    \clearpage
}

% ---------------- 定义空白命令，用于生成空白页 -----------------
\RequirePackage{afterpage}
\newcommand\emptypage{
    \null
    \thispagestyle{empty}
    \addtocounter{page}{-1}
    \newpage
}

% ----------------- 摘要和关键字 -----------------------

\newcommand{\abstext}{}
\newcommand{\keyword}{}

% 定义\makeabs命令，用于生成摘要和关键字
\newcommand{\makeabs}[2]{
    \renewcommand{\abstext}{#1}
    \renewcommand{\keyword}{#2}
    \clearpage
    % \thispagestyle{empty}%
    \setcounter{page}{1}%
    \fancypagestyle{empty}{%
        \fancyhf{}
        \renewcommand{\headrulewidth}{0pt}
        \fancyfoot[C]{\thepage}
    }
    \begin{spacing}{2.1666666667}
        \para{
        \begin{center}
            \textbf{\zihao{3}摘\hspace{1em}要}
        \end{center}
        }
        \abstext
        \textbf{\zihao{4}关键词：}{\zihao{-4}\keyword}
    \end{spacing}
    \clearpage
}


\newcommand{\abstexten}{}
\newcommand{\keyworden}{}
% 定义\makeabsen命令，用于生成英文摘要和关键字
\newcommand{\makeabsen}[2]{
    \renewcommand{\abstexten}{#1}
    \renewcommand{\keyworden}{#2}
    \clearpage
    % \thispagestyle{empty}%
    \fancypagestyle{empty}{%
        \fancyhf{}
        \renewcommand{\headrulewidth}{0pt}
        \fancyfoot[C]{\thepage}
    }
    \begin{spacing}{2.1666666667}
        \para{
        \begin{center}
            \textbf{\zihao{3}Abstract}
        \end{center}
        }
        \abstexten
        \textbf{\zihao{4}Key words: }{\zihao{-4}\keyworden}
    \end{spacing}
    \clearpage
}
%-------------------------- 目录格式设置 ---------------------------
\renewcommand{\contentsname}{\centering\hfill\zihao{3}\bfseries 目\hspace{1.5em}录\hfill}

\titlecontents{section}
[1.5em]
{\zihao{4}\heiti}
{\thecontentslabel\quad}
{}
{\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}
[4.5em] %缩进
{\indent\zihao{-4}\heiti}
{\thecontentslabel\quad}
{}
{\titlerule*[0.5pc]{.}\contentspage}

%-------------------------- 插图和附表环境 -------------------------
\newenvironment{listoffigtbl}
    {
        \titleformat{\section}
        {\zihao{4} \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
        {}
        {0em}
        {} % 标题内容
        \titlespacing*{\section}{0cm}{0cm}{0cm}
        % \patchcmd{\listoffigures}{\section*}{\section}{}{}
        % \patchcmd{\listoftables}{\section*}{\section}{}{}
        \renewcommand{\listfigurename}{插图}
        \renewcommand{\listtablename}{附表}
        \let\clearpage\relax
        \let\cleardoublepage\relax
        \let\newpage\relax
    }
    {}

%-------------------------- 正文格式设置 ---------------------------
%一级标题
\titleformat{\section}
{\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
{第\zhnumber{\thesection} 章~}
{0em}
{} % 标题内容
\titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}


%二级标题
\titleformat{\subsection}
{\raggedright\zihao{4}\heiti\selectfont} % 更改字体为粗体和大号
{\thesubsection~}
{0em}
{} % 标题内容
\titlespacing*{\subsection}{0cm}{\baselineskip}{\baselineskip}

%三级标题
\titleformat{\subsubsection}
{\raggedright\zihao{-4}\heiti\selectfont} % 更改字体为粗体和大号
{\thesubsubsection~}
{0em}
{} % 标题内容
\titlespacing*{\subsubsection}{0cm}{0.7\baselineskip}{0.7\baselineskip}

%正文
\newcommand{\maintext}{}
\newcommand{\para}[1]{
    \renewcommand{\maintext}{#1}
    \setlength{\baselineskip}{20pt}
    {\zihao{-4} \songti \maintext}

}

%-------------------------- 参考文献格式设置 ---------------------------
\RequirePackage{url}
% !BIB TS-program = biber
\RequirePackage[style=gb7714-2015,backend=biber,sorting=none,maxnames=3,minnames=3,date=year,isbn=false]{biblatex}
\addbibresource{bibsource.bib} %注意这里bibfile.bib要替换成你的bib文件名
\renewcommand{\bibfont}{\zihao{-5}\songti}
% \newcommand{\bibname}{参考文献}
\setlength{\bibitemsep}{2pt}
\defbibheading{bibliography}[\bibname]{%
    \specialsection{#1}}%

\newcommand{\makebib}{
    \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}
    % \section{参考文献}
    \printbibliography[heading=bibintoc,title=]%打印引用文献
}

%-------------------------- 致谢格式设置 ---------------------------
\newcommand{\thankcontext}{}
\newcommand{\thanker}{}

\newcommand{\thank}[2]{
    \newpage
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[R]{\zihao{-5}\songti 致谢} %\leftmark：表示“一级标题”
    \fancyhead[L]{\zihao{-5}\songti 中国农业大学本科生毕业论文（设计）}
    \fancyfoot[C]{\thepage}
    % \section*{\texorpdfstring{致谢}{致谢}}
    \titleformat{\section}
    {\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
    {}
    {0em}
    {} % 标题内容
    \titlecontents{section}
    [1.5em]
    {\zihao{4}\heiti}
    {}
    {}
    {\titlerule*[0.5pc]{.}\contentspage}
    \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}
    \renewcommand{\thesection}{}
    \section{致谢}
    \renewcommand{\thanker}{#1}
    \renewcommand{\thankcontext}{#2}

    \thankcontext
    \begin{flushright}
        \textbf{\thanker} \hfill
    \end{flushright}
    \begin{flushright}
        \textbf{\today} \hfill
    \end{flushright}
}

%-------------------------- 附录格式设置 ---------------------------
\newcommand{\appxcontext}{}

\newcommand{\makeappx}[1]{
    \newpage
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[R]{\zihao{-5}\songti 附录} %\leftmark：表示“一级标题”
    \fancyhead[L]{\zihao{-5}\songti 中国农业大学本科生毕业论文（设计）}
    \fancyfoot[C]{\thepage}
    % \section*{\texorpdfstring{附录}{附录}}
    \titleformat{\section}
    {\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
    {}
    {0em}
    {} % 标题内容
    \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}

    \captionsetup{labelsep=quad} % 设置表格编号和标题之间的间距
    % \DeclareCaptionLabelFormat{figureprefix}{图#2} % 定义表格编号格式
    % \captionsetup[figure]{labelformat=figureprefix} % 应用表格编号格式到所有表格
    % \renewcommand{\captionfont}{\bfseries\zihao{5}\heiti}
    \renewcommand{\thefigure}{S-\arabic{figure}}
    \renewcommand{\thetable}{S-\arabic{table}} %章节数-图序号
    \section{附录}
    \renewcommand{\thesection}{}
    % \addcontentsline{toc}{section}{附录}
    \renewcommand{\appxcontext}{#1}
    \appxcontext
}

%-------------------------- 作者简介格式设置 ---------------------------
\newcommand{\baseprofile}{}
\newcommand{\educationpro}{}
\newcommand{\publicationpro}{}
\newcommand{\projectpro}{}
\newcommand{\awardpro}{}
\newcommand{\otherspro}{}

\newcommand{\makeprofile}[6]{
    \newpage
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[R]{\zihao{-5}\songti 作者简介} %\leftmark：表示“一级标题”
    \fancyhead[L]{\zihao{-5}\songti 中国农业大学本科生毕业论文（设计）}
    \fancyfoot[C]{\thepage}
    % \section*{\texorpdfstring{附录}{附录}}
    \titleformat{\section}
    {\newpage\centering\zihao{3}\bfseries \heiti\selectfont \setcounter{table}{0} \setcounter{figure}{0} \setcounter{equation}{0}} % 更改字体为粗体和大号
    {}
    {0em}
    {} % 标题内容
    \titlespacing*{\section}{0cm}{\baselineskip}{\baselineskip}
    \section{作者简介}
    \renewcommand{\thesection}{}
    % \addcontentsline{toc}{section}{附录}
    \renewcommand{\baseprofile}{#1}
    \renewcommand{\educationpro}{#2}
    \renewcommand{\publicationpro}{#3}
    \renewcommand{\projectpro}{#4}
    \renewcommand{\awardpro}{#5}
    \renewcommand{\otherspro}{#6}

    \begin{spacing}{2.1666666667}
        \para{{\heiti \bfseries \zihao{4}基本介绍（姓名、性别、出生日期、籍贯等）：}}
        \vspace*{\baselineskip}
        \baseprofile
        \vspace*{\baselineskip}
        \para{{\heiti \bfseries \zihao{4}教育经历：}}
        \vspace*{\baselineskip}
        \educationpro
        \vspace*{\baselineskip}
        \para{{\heiti \bfseries \zihao{4}本科期间发表的学术论文：}}
        \vspace*{\baselineskip}
        \publicationpro
        \vspace*{\baselineskip}
        \para{{\heiti \bfseries \zihao{4}本科期间主持/参与的科研项目：}}
        \vspace*{\baselineskip}
        \projectpro
        \vspace*{\baselineskip}
        \para{{\heiti \bfseries \zihao{4}本科期间获得的奖励和荣誉：}}
        \vspace*{\baselineskip}
        \awardpro
        \vspace*{\baselineskip}
        \para{{\heiti \bfseries \zihao{4}其他成果：}}
        \vspace*{\baselineskip}
        \otherspro
    \end{spacing}
}

%-------------------------- 代码环境 ---------------------------
\lstset{
    basicstyle=\small, %环境中的代码字体变小 [在结尾要加逗号！]
    basicstyle=\tt, %使用teletype字体（一种等宽字体
    columns=fixed,
    numbers=left,                                        % 在左侧显示行号
        breaklines,%自动换行
    columns=flexible,
    numberstyle=\tiny\color{gray},                       % 设定行号格式
    frame=none,                                          % 不显示背景边框
    backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
    keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
    numberstyle=\footnotesize\color{darkgray},
    commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
    stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
    showstringspaces=false,                              % 不显示字符串中的空格
    language=python,                                        % 设置语言
}
