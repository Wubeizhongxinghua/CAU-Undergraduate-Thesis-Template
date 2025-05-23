# 中国农业大学本科生毕设论文LaTeX模板

![](https://github.com/Wubeizhongxinghua/CAU-Undergraduate-Thesis-Template/blob/main/pictures/CAU.png)

本LaTeX模板可以根据所填内容自动生成满足[《**中国农业大学本科生毕业论文（设计）撰写基本规范**》](https://cem.cau.edu.cn/module/download/downfile.jsp?classid=0&filename=c806c54bfaac421c9103c7760d3a77f9.pdf)的本科生毕业论文。

本模板提供 `caugraduatethesis`文档类，该文档类中封装有一系列满足格式要求的插入方法，并对LaTeX中内置代码进行了一系列的格式修改。详细使用方法见下文。

## 使用方法

根据 `CAU_Undergraduate_Thesis_Template.tex`文件中所提供的示例进行使用，并可进行满足自己要求的更改。

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
              \para{文章摘要内容} %每一段都需要用\para{}括起来
          }{
              关键词1，关键词2，关键词3
  }
      %生成英文摘要页
  \makeabsen{
              \para{This is the abstract of article.} %每一段都需要用\para{}括起来
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
  	}{tbl:ex2}{ %后文中\ref{}使用的名称，如\ref{tbl:ex2}，此参数最好以此形式编写，不推荐换行、缩进等，可能造成错误    %以下插入表格具体内容
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
    		图片描述 %可留空，即无描述
   	}{
		0.6 %图片宽度（占整行的宽比）
	}{fig:ex1} %后文中\ref{}使用的名称，如\ref{fig:ex1}，此参数最好以此形式编写，不推荐换行、缩进等，可能造成错误。
  ```
+ 插入正文段落：
  `caugraduatethesis`文档类中，内置了 `\para`方法，可以生成满足格式要求的段落。

  ```tex
  \para{正文段落} %使用\para{}时，末尾无须添加换行符。推荐一段使用一个\para{}
  ```

**有关正文段落需要注意的事项：**

正文段落中若需要插入下划线"\_"、百分号"%"，需要在下划线前添加转义符。否则报错。


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
        \para{
            这是作者的基本介绍。\\
            这是第二行。
        }
    }{
        \para{
            这是作者的教育经历
        }
    }{
        \para{
            这是作者本科期间发表的论文
        }
    }{
        \para{
            这是作者本科期间参与的科研项目
        }
    }{
        \para{
            这是作者本科期间获得的荣誉
        }
    }{
        \para{
            这是作者的其他成果
        }
    }
  ```
+ 插入文章引用：
  本文档类支持biblatex包的引用方式。编辑本库中的 `./bibsource.bib`，随后在正文中使用 `\cite{}`进行引用即可。

## 说明

+ 推荐的编译方式：
  `xelatex -> biber -> xelatex*2`

## 更新日志

+ 0.2:

  + 将章节编号从阿拉伯数字更改为汉字。
  + 更新了用于图片描述的参数。
  + 图片和表格的label参数（如fig:ex1）可能造成错误，修改了使用说明的使用范例。

+ 0.3:
  + 更新了图片参数，图片现在可以调整宽度了
  + 添加了一些针对`\para{}`的使用提示。
  + 支持附录的图片编号以类似S-1的形式展现
  + 修改了`\makeprofile{}`的使用方法，并美化了显示格式
  + 隐藏了超链接的边框
  + 调整致谢、附录、作者简介在目录页面的格式与其他保持一致

+ 0.4:
  + 添加了代码格式，现在可以插入代码了
  + 作者简介栏目的插入文字方法现在与正文一致，都需要`\para{}`
  + 摘要现在需要用`\para{}`将段落括起来

+ 0.5 by [#1](https://github.com/Wubeizhongxinghua/CAU-Undergraduate-Thesis-Template/pull/1) by [YanTianlong-01](https://github.com/YanTianlong-01):
  + 修改引用文献条目样式，符合标准。
  + 修改图表标题字体。
  + 修改图片详细描述的位置。
  + 修改三级标题的段前、段后间距。
  + 同时把项目上传到Overleaf上，无需本地配置，即开即用。
