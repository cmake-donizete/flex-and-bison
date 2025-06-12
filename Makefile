CC=gcc
CFLAGS=-g -lfl

flex: $(wildcard *.l)
	flex -o $?.yy.c $?