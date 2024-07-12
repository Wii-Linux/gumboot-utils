DESTDIR ?= $(PWD)/install

.PHONY: all download install
all: download
install: download
	find etc usr -type f -exec sh -c 'f="{}"; echo "$$f"; mode=$$(stat -c "%a" "$$f"); install -Dm $$mode "$$f" "$(DESTDIR)/$$f"' \;
	mkdir -p $(DESTDIR)/usr/bin
	cp gumboot-install update-gumboot gumboot-mkconfig $(DESTDIR)/usr/bin/


download: usr/lib/gumboot/armboot.bin usr/lib/gumboot/gumboot.elf usr/lib/gumboot/gui.elf usr/lib/gumboot/LICENSE usr/lib/gumboot/README


usr/lib/gumboot/%:
	wget https://wii-linux.org/archive/gumboot/$(subst usr/lib/gumboot/,,$@) -O $@
