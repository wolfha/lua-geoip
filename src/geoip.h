#ifndef LGEOIP_H
#define LGEOIP_H

#include <GeoIP.h>

char *lookup_by_country(char *ip, const GeoIP *gi);

#endif
