GDDIR = 
DOCSDIR = $(GDDIR)downloads/
PDFDIR = $(GDDIR)pdf/
TOGODIR = TOGO/
HEADERDIR = $(GDDIR)headers/
LINKFILE = $(GDDIR)shareLinks.txt
# DOCS:=$(shell ls $(DOCSDIR)*.docx)

all: download markdown deploy

download: $(LINKFILE)
	### making sure the download and header directories exist ###
	mkdir -p $(DOCSDIR) $(HEADERDIR)
	### downloading the links provided in LINKFILE ###
	./scrapeDocs.sh $(LINKFILE)

markdown: 
	### converting the document files to markdown ###
	./docs2md.sh $(DOCSDIR)

pdf: #$(DOCSDIR)%.md
	### convert the markdown files to pdf ###
	./md2pdf.sh $(DOCSDIR)

deploy: #$(DOCSDIR)%.md
	### making sure the TOGO directory exists ###
	mkdir -p $(TOGODIR)
	### moving the markdown files into the TOGO directory ###
	mv $(DOCSDIR)*.md $(TOGODIR)
	### moving their media files into the wiki ###
	mv $(DOCSDIR)images/* $(TOGODIR)images/

clean:
	### nuking the processing directories ###
	rm -rf $(DOCSDIR)* $(PDFDIR)* $(HEADERDIR)*
