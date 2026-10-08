CC	= gcc
CFLAGS	= -Wall -Wextra -O2
PREFIX	?= /usr/local

OBJS	= main.o conway.o

conway: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

main.o: main.c conway.h
	$(CC) $(CFLAGS) -c main.c

conway.o: conway.c conway.h
	$(CC) $(CFLAGS) -c conway.c

clean:
	rm -f conway $(OBJS)

install: conway
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 755 conway $(DESTDIR)$(PREFIX)/bin/conway

.PHONY: clean install 
