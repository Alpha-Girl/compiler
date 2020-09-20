问题2-1：
1.
        -nostdinc选项的作用是不在标准系统目录中搜索头文件。
2.
        使用gcc -xc -E -v - 命令
        /usr/lib/gcc/x86_64-linux-gnu/5/include
        /usr/local/include
        /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
        /usr/include/x86_64-linux-gnu
        /usr/include
3.
        gcc -E -nostdinc -I /usr/include -I /usr/lib/gcc/x86_64-linux-gnu/5/include sample-io.c -o sample-io.i
        原因：sample-io.c编译所需全部的头文件，都能在这两个目录下找到。
问题2-2：
1.
        -nostdlib选项的作用是链接时不使用标准库和标准系统启动文件。
2.
        写一个只含int main(){}的test.c文件，依次执行
        gcc test.c -o test
        ldd test
        输出
        linux-vdso.so.1 =>  (0x00007ffc287be000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007feb28b93000)
        /lib64/ld-linux-x86-64.so.2 (0x00007feb28f5d000)
3.
        gcc -nostdlib sample-io.c -o sample-io -Xlinker /lib/x86_64-linux-gnu/libc.so.6 -Xlinker /lib64/ld-linux-x86-64.so.2   
        链接了sample-io.c所需的库文件。