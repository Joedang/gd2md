#!/bin/bash
DOCSDIR=$1
OLDDIR=`pwd`
cd $DOCSDIR
for f in *.docx
do
	f_base=$(basename $f) # name and extension, no path
	f_name="${f_base%.*}" # no path or extension, just the name
	f_noext="${f%.*}" # name and path, no extension
	echo converting $f to $f_noext'.md'
	pandoc $f --template=$OLDDIR/template.md --extract-media=$f_name -o $f_noext'.md'
done
cd $OLDDIR
