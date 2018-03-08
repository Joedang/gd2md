#!/bin/bash
OLDDIR=`pwd`
cd $1
for f_md in *.md
do
	f_pdf=${f_md%.md}.pdf
	echo converting $f_md to $f_pdf
	pandoc $f_md --toc --latex-engine=xelatex -o $f_pdf
done
cd $OLDDIR
