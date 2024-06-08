#include some definitions
include $(wildcard mk/defs.mk)
include $(wildcard mk/bitbake-doc-cn.mk)

#default target
default: bitbake-doc-cn.pdf

# sanity check to make sure all .tex files exist
$(foreach file,$(BITBAKE_DOC_CN_PAGES),$(if $(wildcard contents/$(file)),,$(error Missing file contents/$(file) !)))
ALL_PAGES_TEX      = $(foreach s,$(BITBAKE_DOC_CN_PAGES),$(wildcard contents/$(s)))

BITBAKEDOC_STY = common/bitbakedoc.sty
AUTO_GEN_TEX = $(OUTDIR)/last-update.tex $(OUTDIR)/bitbake-version.tex
bitbake-doc-cn.pdf: $(BITBAKEDOC_STY) $(ALL_PAGES_TEX) $(AUTO_GEN_TEX)
	@mkdir -p $(OUTDIR)
	rm -f $(OUTDIR)/$(basename $@).tex
	for f in $(basename $(notdir $(AUTO_GEN_TEX))); do \
		echo "\input{$$f}" >> $(OUTDIR)/$(basename $@).tex ; \
	done

	for f in $(filter-out $(AUTO_GEN_TEX), $(filter %.tex,$^)) ; do \
		echo -n "\input{../"          >> $(OUTDIR)/$(basename $@).tex ; \
		echo -n $$f | sed 's%\.tex%%' >> $(OUTDIR)/$(basename $@).tex ; \
		echo "}"                      >> $(OUTDIR)/$(basename $@).tex ; \
	done
	(cd $(OUTDIR); $(PDFLATEX_ENV) $(PDFLATEX) $(PDFLATEX_OPT) $(basename $@).tex)
	(cd $(OUTDIR); $(MKGLOSSARY) $(basename $@))
	(cd $(OUTDIR); $(PDFLATEX_ENV) $(PDFLATEX) $(PDFLATEX_OPT) $(basename $@).tex > /dev/null 2>&1)
	cat out/$@ > $(basename $@)-$(BITBAKE_VER_STR).pdf

$(OUTDIR)/last-update.tex:
	mkdir -p $(@D)
	t=`git log -1 --format=%ct` && printf "\def \lastupdateen{%s}\n" "`(LANG=en_EN.UTF-8 date -d @$${t} +'%Y/%m/%d')`" > $@

$(OUTDIR)/bitbake-version.tex:
	mkdir -p $(@D)
	printf "\def \\\bbversion{$(BITBAKE_VER_NUM)}\n" > $@

.PRECIOUS: $(OUTDIR)/%.png
$(OUTDIR)/%.png: %.png
	@mkdir -p $(dir $@)
	@cp $^ $@

.PRECIOUS: $(OUTDIR)/%.jpg
$(OUTDIR)/%.jpg: %.jpg
	mkdir -p $(dir $@)
	@cp $^ $@

$(OUTDIR)/%.pdf: %.pdf
	mkdir -p $(dir $@)
	@cp $^ $@

COVER_TITLE_DIR = $(shell pwd)/contents/0_cover_title
clean:
	@$(RM) -rf $(OUTDIR) *.pdf
	@$(RM) -rf $(COVER_TITLE_DIR)/cover_title.aux
	@$(RM) -rf $(COVER_TITLE_DIR)/cover_title.bbl
	@$(RM) -rf $(COVER_TITLE_DIR)/cover_title.fdb_latexmk
	@$(RM) -rf $(COVER_TITLE_DIR)/cover_title.fls
	@$(RM) -rf $(COVER_TITLE_DIR)/cover_title.log
	@$(RM) -rf $(COVER_TITLE_DIR)/cover_title.pyg
	@$(RM) -rf $(COVER_TITLE_DIR)/cover_title.run.xml