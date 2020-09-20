ASM_FLAGS= -m64 
sort: sort.c
	gcc -E ${ASM_FLAGS} sort.c -o sort.i
	gcc -S ${ASM_FLAGS} sort.i -o sort.s
	 gcc -c ${ASM_FLAGS} sort.s -o sort.o
	gcc ${ASM_FLAGS} sort.o -o sort



