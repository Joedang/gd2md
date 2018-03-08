GDDIR = 
DOCXDIR = $(GDDIR)downloads/
PDFDIR = $(GDDIR)pdf/
HEADERDIR = $(GDDIR)headers/
LINKFILE = $(GDDIR)SOPlinks.txt
DOCS:=$(shell ls $(DOCXDIR)*.docx)

all: download markdown pdf

download: $(LINKFILE)
	./scrapeDocx.sh $(LINKFILE)

markdown: $(DOCXDIR)*
	./docx2md.sh $(DOCXDIR)*.docx
	# mv media/* images/
	# rmdir media

pdf: *.md
	pandoc *.md -t markdown_github

clean:
	rm -rf $(DOCXDIR)* $(PDFDIR)* $(HEADERDIR)*
