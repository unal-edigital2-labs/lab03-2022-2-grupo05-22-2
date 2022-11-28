PACKAGES=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata bios
PACKAGE_DIRS=/home/rodrigo/litex/litex/soc/software/libc /home/rodrigo/litex/litex/soc/software/libcompiler_rt /home/rodrigo/litex/litex/soc/software/libbase /home/rodrigo/litex/litex/soc/software/libfatfs /home/rodrigo/litex/litex/soc/software/liblitespi /home/rodrigo/litex/litex/soc/software/liblitedram /home/rodrigo/litex/litex/soc/software/libliteeth /home/rodrigo/litex/litex/soc/software/liblitesdcard /home/rodrigo/litex/litex/soc/software/liblitesata /home/rodrigo/litex/litex/soc/software/bios
LIBS=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata
TRIPLE=riscv64-unknown-elf
CPU=vexriscv
CPUFAMILY=riscv
CPUFLAGS=-march=rv32i2p0_m     -mabi=ilp32 -D__vexriscv__
CPUENDIANNESS=little
CLANG=0
CPU_DIRECTORY=/home/rodrigo/litex/litex/soc/cores/cpu/vexriscv
SOC_DIRECTORY=/home/rodrigo/litex/litex/soc
PICOLIBC_DIRECTORY=/home/rodrigo/pythondata-software-picolibc/pythondata_software_picolibc/data
COMPILER_RT_DIRECTORY=/home/rodrigo/pythondata-software-compiler_rt/pythondata_software_compiler_rt/data
export BUILDINC_DIRECTORY
BUILDINC_DIRECTORY=/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/build/software/include
LIBC_DIRECTORY=/home/rodrigo/litex/litex/soc/software/libc
LIBCOMPILER_RT_DIRECTORY=/home/rodrigo/litex/litex/soc/software/libcompiler_rt
LIBBASE_DIRECTORY=/home/rodrigo/litex/litex/soc/software/libbase
LIBFATFS_DIRECTORY=/home/rodrigo/litex/litex/soc/software/libfatfs
LIBLITESPI_DIRECTORY=/home/rodrigo/litex/litex/soc/software/liblitespi
LIBLITEDRAM_DIRECTORY=/home/rodrigo/litex/litex/soc/software/liblitedram
LIBLITEETH_DIRECTORY=/home/rodrigo/litex/litex/soc/software/libliteeth
LIBLITESDCARD_DIRECTORY=/home/rodrigo/litex/litex/soc/software/liblitesdcard
LIBLITESATA_DIRECTORY=/home/rodrigo/litex/litex/soc/software/liblitesata
BIOS_DIRECTORY=/home/rodrigo/litex/litex/soc/software/bios
LTO=0
BIOS_CONSOLE_FULL=1