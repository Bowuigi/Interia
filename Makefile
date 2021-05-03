# MHI's makefile
# By Bowuigi

CPP=g++
CPPFLAGS=-Os -std=c++11
FILES=core.cpp core.hpp
PREFIX=/usr/local
OUT=mhi

build:
		$(CPP) $(FILES) $(CPPFLAGS)
		mv a.out $(OUT)
		strip --strip-unneeded $(OUT)

install: build
		cp $(OUT) $(PREFIX)/bin

clean:
	rm -f $(OUT) *.gch

