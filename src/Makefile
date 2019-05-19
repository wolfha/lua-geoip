#
#
#

CFLAGS = -lGeoIP -llua5.1 -fPIC -W -Wall -O2 -I/usr/include/lua5.1 

OBJECTS = lgeoip.o geoip.o
SOURCES = lgeoip.c geoip.c
AR = ar rcu
EXT = so 

all: geoip.a
	$(CC) $(CFLAGS) -o geoip.$(EXT) -shared *.o -llua5.1

geoip.a: $(OBJECTS)
	$(AR) $@ $(OBJECTS)

clean:
	rm -f $(OBJECTS) geoip.a *.$(EXT)
