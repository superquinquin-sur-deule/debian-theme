THEME      = superquinquin
VERSION   ?= 1.0.0
BUILD_DIR  = build/plymouth-theme-$(THEME)-$(VERSION)_all
ASSETS_DIR = theme/assets
FRAMES     = $(shell seq 0 29)
ASSETS     = $(FRAMES:%=$(ASSETS_DIR)/spinner-%.png)
ASSETS    += $(ASSETS_DIR)/splash.png
LOGO_URL   = https://www.superquinquin.fr/wp-content/themes/superquinquin/img/superquinquin_logo_deule.svg

.PHONY: build
build:
	mkdir -p $(BUILD_DIR)/usr/share/plymouth/themes/$(THEME)
	cp -r theme/* $(BUILD_DIR)/usr/share/plymouth/themes/$(THEME)
	cp -r DEBIAN $(BUILD_DIR)/
	sed -i "s/{{VERSION}}/$(VERSION)/" $(BUILD_DIR)/DEBIAN/control
	sed -i "s/{{THEME}}/$(THEME)/" $(BUILD_DIR)/DEBIAN/postinst
	chmod 755 $(BUILD_DIR)/DEBIAN/postinst
	@command -v dpkg-deb >/dev/null 2>&1 \
	  && dpkg-deb --build $(BUILD_DIR) \
	  || echo "Warning: dpkg-deb not found, skipping package build"
	mv $(BUILD_DIR).deb .

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
