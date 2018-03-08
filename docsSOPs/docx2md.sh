#!/bin/bash
for f in $@
do
	f_base=$(basename $f) # name and extension, no path
	f_id="${f_base%.*}" # no path or extension, just the GDID
	f_noext="${f%.*}" # name and path, no extension
	echo converting $f to $f_noext'.md'
	pandoc $f --template=template.md --extract-media=docx/ -o $f_noext'.md'
done
