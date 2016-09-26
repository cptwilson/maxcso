#SOURCES = buffer_pool.cpp checksum.cpp compress.cpp \
#	input.cpp output.cpp sector.cpp uv_helper.cpp \
#	buffer_pool.h checksum.h compress.h cso.h \
#	dax.h input.h output.h sector.h uv_helper.h
SOURCES = src/buffer_pool.cpp src/checksum.cpp src/compress.cpp \
	src/input.cpp src/output.cpp src/sector.cpp src/uv_helper.cpp \
	src/buffer_pool.h src/checksum.h src/compress.h src/cso.h \
	src/dax.h src/input.h src/output.h src/sector.h src/uv_helper.h
	
OBJECTS = buffer_pool.o checksum.o compress.o \
	input.o output.o sector.o uv_helper.o

CC=gcc
CXX=g++
LD=ld
AR=ar
SHELL=/bin/bash

LDFLAGS = -L "/usr/lib:/usr/include:./zopfli/src/zopfli:./libuv/include:./lz4/lib" \
-lz -luv -lrt -lpthread -lnsl -ldl -llz4 -shared -rdynamic -fPIC

CFLAGS = -Wno-error -O2 -g -std=c++0x
CXXFLAGS = ${CFLAGS}

maxcso:
	$(CXX) $(CFLAGS) $(LDFLAGS) -o maxcso $(SOURCES)
	
all: maxcso

clean:
	rm -f *.o maxcso

