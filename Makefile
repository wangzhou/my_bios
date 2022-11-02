# Copyright xxx
#
# Authors:
#   Sherlock Wang

src_dir=$(CURDIR)
build_dir=$(src_dir)/build

MY_BIOS_VERSION=0.1

ifdef CROSS_COMPILE
CC	= $(CROSS_COMPILE)gcc
AR	= $(CROSS_COMPILE)ar
LD	= $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy
else
CC	?= gcc
AR	?= ar
LD	?= ld
OBJCOPY ?= objcopy
endif

.PHONY: all
all = my_bios.elf

$(build_dir)/my_bios.elf: $(build_dir)/init.o $(build_dir)/os_service.o
	@mkdir -p $(build_dir)
	$(LD) $^ -nostartfiles -T $(src_dir)/init.elf.ldS -o $@

$(build_dir)/init.o: $(src_dir)/init.S
	@mkdir -p $(build_dir)
	$(CC) $^ -c -o $@

$(build_dir)/os_service.o: $(src_dir)/os_service.c
	@mkdir -p $(build_dir)
	$(CC) $^ -c -o $@

.PHONY: clean
clean:
	rm -rf $(build_dir)
