# 中国农业大学本科生毕设论文LaTeX模板

本LaTeX模板可以根据所填内容自动生成满足《**中国农业大学本科生毕业论文（设计）撰写基本规范**》的本科生毕业论文。

本模板提供 `caugraduatethesis`文档类，该文档类中封装有一系列满足格式要求的插入方法，并对LaTeX中内置代码进行了一系列的格式修改。详细使用方法见下文。

## 使用方法

根据 `main.tex`文件中所提供的示例进行使用，并可进行满足自己要求的更改。

+ 插入封面：

  ```TeX
  \makecover{
          论文标题
      }{
          English Title
      }{
          学生姓名
      }{
          指导教师
      }{
          合作指导教师
      }{
          专业名称
      }{
          所在学院
  }
  ```
+ 生成摘要页：

  ```tex
  \makeabs{
              文章摘要内容
          }{
              关键词1，关键词2，关键词3
  }
      %生成英文摘要页
  \makeabsen{
              This is the abstract of article.
          }{
              kwd1, kwd2, kwd3
  }
  ```
+ 插入表格：
  `caugraduatethesis`文档类中，内置了 `\cautable`方法，可以生成满足格式要求的表格。

  ```tex
  \cautable{
  		表格标题
  	}{
  		ZZZZ %此处Z的个数代表插入的表格所含列数，如ZZZZ代表表格拥有4个列。
  	}{
  		表注 %表注可空，若为空则不生成表注
  	}{
  		tbl:ex2 %后文中\ref{}使用的名称
  	}{ %以下插入表格具体内容
              \toprule %三线表第一线
              a & b & c & d \\
              \midrule %三线表第二线
              1 & 2 & 3 & 10 \\
              4 & 5 & 6 & 11 \\
              7 & 8 & 9 & 12 \\
              \bottomrule %三线表第三线
  }
  ```
+ 插入图片：
  `caugraduatethesis`文档类中，内置了 `\caufig`方法，可以生成满足格式要求的插图。

  ```tex
  \caufig{
  		./pictures/fig1.png %插入图片的相对路径
  	}{
  		图片标题
  	}{
  		fig:ex1 %后文中\ref{}使用的名称
  }
  ```
+ 插入正文段落：
  `caugraduatethesis`文档类中，内置了 `\para`方法，可以生成满足格式要求的段落。

  ```tex
  \para{正文段落} %使用\para{}时，末尾无须添加换行符。推荐一段使用一个\para{}
  ```
+ 插入致谢、附录和作者简介：
  `caugraduatethesis`文档类中，内置了 `\thank, \makeappx, \makeprofile`方法，可以生成满足格式要求的致谢、附录和作者简介页面。

  ```tex
  %生成致谢
  \thank{
  		姓名 %作者（致谢者）的姓名
  	}{
          	\para{致谢内容}
  }


  %生成附录
  \makeappx{
          \para{附录内容} %表格、文字、图片皆可
  }

  %生成作者简介
  \makeprofile{
          作者基本介绍 %直接在这里写内容即可，标题自动生成
      }{
          作者教育经历
      }{
          作者本科期间发表的论文
      }{
          作者本科期间参与的科研项目
      }{
          作者本科期间获得的荣誉
      }{
          作者的其他成果
  }
  ```

+ 插入文章引用：
  本文档类支持biblatex包的引用方式。编辑本库中的`./bibsource.bib`，随后在正文中使用`\cite{}`进行引用即可。

## 说明

+ 推荐的编译方式：
  `xelatex -> biblatex -> xelatex*2`
