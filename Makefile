CFLAGS=-lfl

%.c:
	flex -o $*.c $*.l

$(wildcard *.l): %.l: %.c
	$(CC) $(CFLAGS) -o $*.exe $<

clean:
	rm *.c *.exe