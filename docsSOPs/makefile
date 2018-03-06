GDDIR = docsSOPs
DOCXDIR = $(GDDIR)/docx
PDFDIR = $(GDDIR)/pdf
LINKFILE = $(GDDIR)/SOPlinks.txt
DOCXS:=$(shell ls $(DOCXDIR)/*)

all: download markdown pdf

download: $(LINKFILE)
	wget --input-file=$(LINKFILE) --directory-prefix=$(DOCXDIR)

markdown: $(DOCXDIR)/*
	./docx2md.sh $(DOCXDIR)/*
	mv media/* images/
	rmdir media

pdf: *.md
	pandoc *.md -t markdown_github

clean:
	rm -rf $(DOCXDIR)/* $(PDFDIR)/*
