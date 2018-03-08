# Tools for Converting Things on the Google Drive to Markdown for the Wiki

- In the drive, go to the file you want to convert, right click it, and choose "Get shareable link".
- Paste that link into SOPlinks.txt
- In the `docsSOPs` directory run `make download`
	- `scrapeDocx.sh` will download all the links as DOCX files.
	- If Google doesn't know how to convert the requested file to DOCX, it'll give you an error.
	- The files will have the same name as in Google Drive, but problematic characters -- like spaces and parentheses -- will be removed.
	- Everything will go in `docsSOPs/downloads`
- To convert the downloaded DOCX files to markdown, run `make markdown`
	- (Stay in `docsSOPs`. Don't change into `downloads`.)
- If you want to preview the converted files, run `make pdf`, go into the `downloads` directory and open them in whatever pdf viewer.
- If the converted files look good, run `make deploy` to move them up out of `docsSOPs`.
	- Note, if files of the same names already exist, this will overwrite the existing files.
	  If you're worried about this, you can check `git status` to see if anything shows up as 
	  "modified" rather than "untracked".
- Commit your changes and push. They'll show up in the wiki.
