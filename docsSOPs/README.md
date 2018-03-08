# Tools for Converting Things on the Google Drive to Markdown for the Wiki

01. In the drive, go to the file you want to convert, right click it, and choose "Get shareable link".
	- You need the _drive_ link, not the _docs_ link. It should look like this:
	  `https://drive.google.com/open?id=1x9sxi3rikPEjh2--X68eALqWpuUHYNjM_IMc1kB4T58`
	- It's okay to add a comment after the link as long as its separated from the ID with something that 
	  isn't a letter, number, dash, or underscore. So, for example, this would be fine:  
	  `https://drive.google.com/open?id=1x9sxi3rikPEjh2--X68eALqWpuUHYNjM_IMc1kB4T58 # K-40 (Mini Laser) SOP (WIP)`
	- You could technically just put "id=" followed by the file ID, since only strings of the above mentioned characters that follow "id=" are assumed to be Google Drive IDs, but let's not overcomplicate things \</irony\>.
20. Paste that link into SOPlinks.txt
30. In the `docsSOPs` directory run `make download`
	- `scrapeDocx.sh` will download all the links as DOCX files.
	- If Google doesn't know how to convert the requested file to DOCX, it'll give you an error.
	- The files will have the same name as in Google Drive, but problematic characters -- like spaces and parentheses -- will be removed.
	- Everything will go in `docsSOPs/downloads`
40. To convert the downloaded DOCX files to markdown, run `make markdown`
	- (Stay in `docsSOPs`. Don't change into `downloads`.)
50. If you want to preview the converted files, run `make pdf`, go into the `downloads` directory and open them in whatever pdf viewer.
60. If the converted files look good, run `make deploy` to move them up out of `docsSOPs`.
	- Note, if files of the same names already exist, this will overwrite the existing files.
	  If you're worried about this, you can check `git status` to see if anything shows up as 
	  "modified" rather than "untracked".
70. Commit your changes and push. They'll show up in the wiki.
	- One way to get the changes over to the master branch would be to deploy the markdown files on dev_joe, checkout master (stash the changes if you need to), and then commit.
	- Another solution would be to commit the deployed files on dev_joe and then cherry-pick only the commit(s) which involve the markdown files. 
80. If you wish, run `make clean` to get rid of the stuff that was downloaded.
	- Deployed files will not be removed.
