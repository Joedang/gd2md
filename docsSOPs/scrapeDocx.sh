#!/bin/bash
# scrape a bunch of DOCX files from a list of google docs share links
# take names of files containing lists of GD share links
# download them to files named after their GDID
# 2018-03-05
# Joe Shields

# prefix to request a GD as DOCX
docxPrefix='https://docs.google.com/document/u/1/d/'

# suffix 
docxSuffix='/export?format=docx'

# extract the Googoo Drive IDs from the list files given:
GDIDS=`cat "$@" | grep -P -o -e '(?<=id=)[[:alnum:]_-]*$'`

# dowload directory
DLdir=docx/

# header directory
Hdir=headers/

echo links given: 
cat "$@"
echo
echo Google Drive IDs: 
echo $GDIDS
echo

fails=0
for id in $GDIDS
do
	docxLink=$docxPrefix$id$docxSuffix
	echo
	echo DOWNLOADING: $docxLink 
	# don't wuss-out if there's an error
	set +e 
	{ # try
	curl -L -D $Hdir$id.header "$docxLink" -o $DLdir$id'.download'
	if ! grep -i Error $Hdir$id.header;# if the server didn't give errors, rename the download
	then
		filename=`cat $id.header | grep -P -o -e '(?<=filename=").*(?=")'`
		echo I would like to move $DLdir$id.download to $DLdir$filename
	fi
	} || { # catch
	echo WARNING: $id failed to download.
	fails=$((fails + 1))
	echo
	}
	echo
done
echo done scraping
echo $fails links failed to download
