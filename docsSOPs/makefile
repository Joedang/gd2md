GDDIR = 
DOCSDIR = $(GDDIR)downloads/
PDFDIR = $(GDDIR)pdf/
HEADERDIR = $(GDDIR)headers/
LINKFILE = $(GDDIR)SOPlinks.txt
DOCS:=$(shell ls $(DOCSDIR)*.docx)

all: download markdown pdf deploy

download: $(LINKFILE)
	# make sure the download and header directories exist
	mkdir -p $(DOCSDIR) $(HEADERDIR)
	# download the links provided in LINKFILE
	./scrapeDocx.sh $(LINKFILE)

markdown: $(DOCSDIR)*.docx
	# convert the docx files to markdown
	./docx2md.sh $(DOCSDIR)

pdf: $(DOCSDIR)*.md
	# convert the markdown files to pdf
	find $(DOCSDIR) -iname '*.md' -type f -exec sh -c \
		'pandoc $${0} --toc --latex-engine=xelatex -o $${0%.md}.pdf' {} \;

deploy: $(DOCSDIR)*.md
	# move the markdown files into the wiki:
	mv $(DOCSDIR)*.md ../
	# move their media files into the wiki:
	find $(DOCSDIR) -maxdepth 1 -type d -not -path $(DOCSDIR) -exec mv {} ../ \;

clean:
	# nuke the processing directories
	rm -rf $(DOCSDIR)* $(PDFDIR)* $(HEADERDIR)*
