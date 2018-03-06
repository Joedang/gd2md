GDDIR = 
DOCXDIR = $(GDDIR)docx/
PDFDIR = $(GDDIR)pdf/
LINKFILE = $(GDDIR)SOPlinks.txt
DOCXS:=$(shell ls $(DOCXDIR)*.docx)

all: download markdown pdf

download: $(LINKFILE)
	./scrapeDocx.sh $(LINKFILE)

markdown: $(DOCXDIR)*
	./docx2md.sh $(DOCXDIR)*
	mv media/* images/
	rmdir media

pdf: *.md
	pandoc *.md -t markdown_github

clean:
	rm -rf $(DOCXDIR)* $(PDFDIR)*
