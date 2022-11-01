# Copyright xxx
#
# Authors:
#   xxx

src_dir=$(CURDIR)
build_dir=$(src_dir)/build

MY_BIOS_VERSION=0.1

ifdef CROSS_COMILE
CC	= $(CROSS_COMILE)gcc
AR	= $(CROSS_COMILE)ar
LD	= $(CROSS_COMILE)ld
OBJCOPY = $(CROSS_COMILE)objcopy
else
CC	?= gcc
AR	?= ar
LD	?= ld
OBJCOPY ?= objcopy
endif

.PHONY: all
all += my_bios.elf

$(build_dir)/my_bios.elf: $(build_dir)/init.o $(build_dir)/os_service.o
	$(CC) $^ -o my_bios.elf

$(build_dir)/init.o: $(src_dir)/init.S
	$(CC) $^ -o init.o

$(build_dir)/os_service.o: $(src_dir)/os_service.c
	$(CC) $^ -o os_service.o

.PHONY: clean
clean:
	rm -rf $(build_dir)
