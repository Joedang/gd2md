#!/bin/bash
for f in $@
do
	f_base=$(basename $f) # name and extension, no path
	f_base_noext="${f_base%.*}" # no path or extension
	f_noext="${f%.*}" # name and path, no extension
	pandoc $f --template=template.md --extract-media=. -o $f_noext'.md'
done
