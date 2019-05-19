/* this file is part of lua-geoip 
2012  <dev@augmentedlogic.com>
Do What The Fuck You Want To Public License */

#include <GeoIP.h>

char *lookup_by_country(char *ip, GeoIP *gi) {
	const char * result;
	result = GeoIP_country_code_by_name(gi, ip);
	return (char *)result;
}
