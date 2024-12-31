set -ex 
OUTPUT=main.bin.gcc
CC=g++
$CC main.cc --coverage -c -o main.o 
$CC main.o --coverage -o $OUTPUT
