SPINNER_THEME = theme/assets
SPINNER_FRAMES = $(shell seq 0 29)
SPINNER_FILES  = $(SPINNER_FRAMES:%=$(SPINNER_THEME)/spinner-%.png)

.INTERMEDIATE: $(SPINNER_FILES)
$(SPINNER_THEME)/spinner-%.png:
	@sh scripts/generate-spinner.sh $@ $*

.PHONY: assets
assets: $(SPINNER_FILES)
