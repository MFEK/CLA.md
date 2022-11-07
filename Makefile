#!/usr/bin/env gmake
include mk/init.mk
SCRIPTS := $(shell find . -name '*.md.sh' | cut -c 3- | sort)
TARGETS := $(shell (for s in $(SCRIPTS); do echo $$s | head -c -4 && echo; done; echo CLA.txt) | sort)
SOURCES := $(shell comm -3 <(for f in *.md $(TARGETS); do echo "$$f"; done | sort | uniq) <(for f in $(TARGETS); do echo "$$f"; done))

%.md: %.md.sh $(SOURCES)
	./$< > $@ && \
		R --no-save <<< 'rmarkdown::render("$@", prettydoc::html_pretty(keep_md = TRUE, toc = TRUE))'

CLA.txt: $(shell find . -name '[[:digit:]]*-CLA.md')
	pandoc -i $< -o $@ -f markdown -t plain

.PHONY:
all:
	$(MAKE) $(MAKEFLAGSADD) -j$(words $(TARGETS)) $(TARGETS) && \
		rm -r *_files/

.PHONY:
clean:
	rm $$([ ! -z "$$CLEAN_INTERACTIVE" ] && printf '%s' -i || false) $(TARGETS)

.PHONY:
debug:
	@echo Scripts: $(SCRIPTS) Outputs: $(TARGETS) Components: $(SOURCES)
