#define FIRESIM_START_TRIGGER asm volatile ("addi x0, x1, 0":::"cc")
#define FIRESIM_END_TRIGGER asm volatile ("addi x0, x2, 0":::"cc")