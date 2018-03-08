# Tools for Converting Things on Google Drive to Markdown 
Grab a bunch of document links from Google Drive and convert them to Markdown.
You put a bunch of links in a file, run some `make` commands, check your results, and copy the Markdown files wherever you need them.

This is very similar to [Goodls](https://github.com/tanaikech/goodls), except this uses more readily-available tools and is probably easier to break, lol.

## Dependencies
- make
- Curl
	- It would be trivial to swap out `curl` for `wget`, if you wanted to.
- Bash
- Pandoc
- XeLaTeX 
	- This is only for PDF previews.
	- Pandoc needs to know where XeLaTeX is.

## How to Use
01. In Google Drive, go to the file you want to convert, right click it, and choose "Get shareable link".
	- You need the _drive_ link, not the _docs_ link. It should look like this:
	  `https://drive.google.com/open?id=1x9sxi3rikPEjh2--X68eALqWpuUHYNjM_IMc1kB4T58`
	- It's okay to add a comment after the link as long as its separated from the ID with something that 
	  isn't a letter, number, dash, or underscore. So, for example, this would be fine:  
	  `https://drive.google.com/open?id=1x9sxi3rikPEjh2--X68eALqWpuUHYNjM_IMc1kB4T58 # K-40 (Mini Laser) SOP (WIP)`
	- You could technically just put "id=" followed by the file ID, since only strings of the above mentioned characters that follow "id=" are assumed to be Google Drive IDs, but let's not overcomplicate things \</irony\>.
20. Paste that link into SOPlinks.txt
30. In the `docsSOPs` directory run `make download`
	- `scrapeDocs.sh` will download all the links as DOCX files.
	- If Google doesn't know how to convert the requested file to DOCX, it'll give you an error.
	- The files will have the same name as in Google Drive, but problematic characters -- like spaces and parentheses -- will be removed.
	- Everything will go in `downloads/`
40. To convert the downloaded DOCX files to markdown, run `make markdown`
	- (Don't change into `downloads`.)
50. If you want to preview the converted files, run `make pdf`, go into the `downloads/` directory and open them in whatever pdf viewer.
60. If the converted files look good, run `make deploy` to move them out of `downloads/` into `TOGO/`.
	- Note, if files of the same names already exist in TOGO, this will overwrite the existing files.
	  If you're worried about this, you can check `git status` to see if anything shows up as 
	  "modified" rather than "untracked".
70. Move the converted files (and their associated media) from `TOGO/` to wherever you want them.
80. If you wish, run `make clean` to get rid of the stuff that was downloaded.
	- Deployed files will not be removed.
