.PHONY: all download install
all: download

download: usr/lib/gumboot/armboot.bin usr/lib/gumboot/gumboot.elf usr/lib/gumboot/gui.elf usr/lib/gumboot/LICENSE usr/lib/gumboot/README


usr/lib/gumboot/%:
	wget https://wii-linux.org/archive/gumboot/$(subst usr/lib/gumboot/,,$@) -O $@
