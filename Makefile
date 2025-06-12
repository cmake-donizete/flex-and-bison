CFLAGS=-lfl

flexes=$(wildcard *.l)

all: $(flexes)

.PHONY: all

$(flexes): %.l: %.c
	$(CC) $(CFLAGS) -o $*.exe $^

%.c:
	flex -o $*.c $*.l

clean:
	rm *.c *.exe