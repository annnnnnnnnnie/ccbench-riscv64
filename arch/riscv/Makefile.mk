##########################################
# Architecture-specific Makefile fragment
##########################################

CC=/home/tp1119/riscv/bin/riscv64-unknown-linux-gnu-gcc

# for now, compile common/barrier.* using our own barrier implementations.
# if your compiler cant handle march, you're using an older version of gcc
CFLAGS=-Wa,-march=rv64imafdch -std=gnu99 -O2 -ffast-math -funroll-loops -I../common -static
	
LD_FLAGS= -ffast-math
LD_LIBS=-lm -lc
