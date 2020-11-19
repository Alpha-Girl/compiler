rm -f *.BAK *.o core *~* *.a 
rm -f src/*.tab.* 
rm -f src/*.lex.* *.out*
rm -f bin/*
mkdir -p src
mkdir -p bin
bison -d -y -b exprL-s3 -o src/exprL-s3.tab.c config/exprL-s3.y
flex -i -I -o src/expr.lex.c config/expr.lex
gcc -g -Isrc -o bin/exprL-s3 src/expr.lex.c src/exprL-s3.tab.c -lfl -lm
mkdir -p src
mkdir -p bin
bison -d -y -b exprL-pre-s3 -o src/exprL-pre-s3.tab.c config/exprL-pre-s3.y
flex -i -I -o src/expr.lex.c config/expr.lex
gcc -g -Isrc -o bin/exprL-pre-s3 src/expr.lex.c src/exprL-pre-s3.tab.c -lfl -lm