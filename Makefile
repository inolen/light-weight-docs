DOCS = $(wildcard *.md)
HTMLDOCS = $(DOCS:.md=.html)

default: docs

%.html: %.md layout/layout.tpl lib/docgen.js
	@echo "... $< -> $@"
	@markdown $< | lib/docgen.js layout/layout.tpl > $@

docs: $(HTMLDOCS)
