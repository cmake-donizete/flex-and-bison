CFLAGS=-lfl

bisons=$(wildcard *.y)
flexes=$(filter-out $(bisons:.y=.l),$(wildcard *.l))

all: $(flexes) $(bisons)

.PHONY: all

$(flexes): %.l: %.l.c
	$(CC) $(CFLAGS) -o $*.exe $^

$(bisons): %.y: %.y.c %.l.c
	$(CC) $(CFLAGS) -o $*.exe $*.y.c $*.l.c

%.l.c:
	flex -o $*.l.c $*.l

%.y.c:
	bison -o $*.y.c -d $*.y

clean:
	rm *.h *.c *.exe