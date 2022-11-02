build
======

 make CROSS_COMPILE=riscv64-linux-gnu-

 my_bios.elf will be in build directory, and it can be run by qemu like:
 qemu-system-riscv64 -M virt -m 128M -nographic -bios my_bios.elf
