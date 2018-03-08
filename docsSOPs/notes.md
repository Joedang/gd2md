# Notes for automatically converting the SOPs in google docs to markdown for the wiki

## Overview
00. people paste "share" links from google docs into `SOPlinks.txt`
10. extract the Google Drive ID from the shareable link
	```
	cat SOPlinks.txt | grep -P -o -e '(?<=id=)[[:alnum:]_-]*$'
	```
20. use the drive ID to create a "download as docx" URL
	- Okay
30. grab the docx via wget and put it in $DRIVEID.docx
	- via scrapeDocx.sh
40. get the document title and rename $DRIVEID.docx to $DOCTITLE.docx
	```
	pandoc asdf.docx --template=../titleOnly.md -o asdf.title
	cat asdf.title | sed -e 's/<span.*span>//'
	```
	- Actually, pandoc seems to go through the whole conversion anyways to get the title.
	  So, I could simply filter out the proper title after the conversion to markdown.
	- Some documents lack a title property, so you need to get it from the header of the server's response:
	  ```
	 curl 'https://docs.google.com/document/u/1/d/1INud6oCGb91eG66s3CbRsaI9LtjLOuevllvA9WApalw/export?format=docx' -L -D dumpHeader.out -o test.down
	 cat dumpHeader.out | grep -P -e '(?<=filename=").*(?=")'
	 ```
	 This code grabs the DOCX from GD, saves the header response from Googs to dumpheader.out and the actual file to test.out.
	 It then extracts the "no-nonsense" filename from the header.
50. use pandoc to convert to $DOCTITLE.md with the media in $DOCTITLE/
