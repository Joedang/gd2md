# Notes for automatically converting the SOPs in google docs to markdown for the wiki

## Overview
00. people paste "share" links from google docs into `SOPlinks.txt`
10. extract the Google Drive ID from the shareable link
20. use the drive ID to create a "download as docx" URL
30. grab the docx via wget and put it in $DRIVEID.docx
40. get the document title and rename $DRIVEID.docx to $DOCTITLE.docx
	- pandoc asdf.docx --template=../titleOnly.md -o asdf.title
	- cat asdf.title | sed -e 's/<span.*span>//'
	- Actually, pandoc seems to go through the whole conversion anyways to get the title.
	  So, I could simply filter out the proper title after the conversion to markdown.
50. use pandoc to convert to $DOCTITLE.md with the media in $DOCTITLE/
