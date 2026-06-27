THEME      = superquinquin
ASSETS_DIR = theme/assets
FRAMES     = $(shell seq 0 29)
ASSETS     = $(FRAMES:%=$(ASSETS_DIR)/spinner-%.png)
ASSETS    += $(ASSETS_DIR)/splash.png
LOGO_URL   = https://www.superquinquin.fr/wp-content/themes/superquinquin/img/superquinquin_logo_deule.svg

.PHONY: build
build:
	mkdir -p build/usr/share/plymouth/themes/$(THEME)
	cp -r theme/* build/usr/share/plymouth/themes/$(THEME)
	cp -r DEBIAN build/
	sed -i "s/Version:.*/Version: ${VERSION}/" build/DEBIAN/control
	chmod 755 build/DEBIAN/postinst

.PHONY: assets
assets: $(ASSETS)

.INTERMEDIATE: $(ASSETS)
$(ASSETS_DIR)/spinner-%.png:
	@echo "Generating $@..."
	@sh scripts/generate-spinner.sh $@ $*

$(ASSETS_DIR)/splash.png:
	@echo "Generating $@..."
	@magick -size 320x320 xc:white \( $(LOGO_URL) -resize 320x320 -trim \) \
	  -gravity Center -composite PNG24:$@
