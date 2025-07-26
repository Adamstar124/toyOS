all: os-image.bin

boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

kernel.bin: kernel.c linker.ld
	i386-elf-gcc -ffreestanding -m32 -c kernel.c -o kernel.o
	i386-elf-ld -T linker.ld -m elf_i386 kernel.o -o kernel.elf
	objcopy -O binary kernel.elf kernel.bin

os-image.bin: boot.bin kernel.bin
	cat boot.bin kernel.bin > os-image.bin

run: os-image.bin
	qemu-system-i386 -drive format=raw,file=os-image.bin

clean:
	rm -f *.bin *.o *.elf
