CC=gcc
LD=gcc
PREFIX=/usr/local
LIBDIR=$(PREFIX)/lib
INCLUDEDIR=$(PREFIX)/include
CFLAGS=-g -std=c99 -D_GNU_SOURCE -Wall -Werror -O3
SHCFLAGS=$(CFLAGS) -fPIC
SHLINKFLAGS=-shared

all:	src/libart.so
run:	src/main
	./src/main

src/main: src/main.o src/libart.o
	$(LD) -o $@ $^

src/libart.so:	src/libart.o
	$(LD) $(SHLINKFLAGS) -o $@ $<

src/art.c:	src/art.h

src/main.o: src/main.c src/art.h
	$(CC) $(SHCFLAGS) -o $@ -c $<

src/libart.o:	src/art.c
	$(CC) $(SHCFLAGS) -o $@ -c $<

install:	src/libart.so
	mkdir -p $(DESTDIR)$(LIBDIR)
	mkdir -p $(DESTDIR)$(INCLUDEDIR)
	cp src/libart.so $(DESTDIR)$(LIBDIR)/libart.so
	chmod 555 $(DESTDIR)$(LIBDIR)/libart.so
	cp src/art.h $(DESTDIR)$(INCLUDEDIR)/art.h
	chmod 444 $(DESTDIR)$(INCLUDEDIR)/art.h
