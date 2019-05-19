#
# Makefile
#

VERSION=0.1
PACKAGE_VERSION=1
PROG=dpkg
SOURCE=./build
FLAGS=-b
ARCH=$$(dpkg --print-architecture)
DEBTARGET=liblua5.1-geoip0_$(VERSION)-$(PACKAGE_VERSION)_$(ARCH).deb
TMP=./build
TARGET=lua-geoip_$(VERSION)

default: 
	make -C src/

all: default debian_package

debian_package: 
	make -C src/
	mkdir -p ./$(TMP)/DEBIAN
	mkdir -p ./$(TMP)/usr/lib/lua/5.1
	mkdir -p ./$(TMP)/usr/share/doc/liblua5.1-geoip0
	mkdir -p ./$(TMP)/usr/share/doc/liblua5.1-geoip0/examples
	cp debian/control ./$(TMP)/DEBIAN
	cp examples/*.lua ./$(TMP)/usr/share/doc/liblua5.1-geoip0/examples/
	cp src/README ./$(TMP)/usr/share/doc/liblua5.1-geoip0/
	cp src/geoip.so ./$(TMP)/usr/lib/lua/5.1/
	strip --strip-unneeded ./$(TMP)/usr/lib/lua/5.1/geoip.so
	cp debian/copyright ./$(TMP)/usr/share/doc/liblua5.1-geoip0/copyright
	fakeroot $(PROG) $(FLAGS) $(SOURCE) $(DEBTARGET)

snapshot:
	svn export ./ $(TARGET)
	tar cvvf $(TARGET).tar $(TARGET)
	gzip $(TARGET).tar
	rm -R $(TARGET)

clean:
	make -C src/ clean	
	rm -Rf ./build/
