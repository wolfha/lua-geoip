/* this file is part of lua-geoip 
2012  <dev@augmentedlogic.com>
Do What The Fuck You Want To Public License */

#include "geoip.h"
#include "lua.h"
#include <GeoIP.h>
#include "lauxlib.h"

GeoIP * gi;

static int country_code_by_name(lua_State *L) {
	size_t l;
	const char *s = luaL_checklstring(L, 1, &l);
	lua_pushstring(L, lookup_by_country((char *)s, gi));
	return 1;
}


static const struct luaL_reg lib[] = {
	{"country_code_by_name", country_code_by_name},
	{NULL, NULL}
};


LUALIB_API int luaopen_geoip(lua_State *L) {
	gi = GeoIP_new(GEOIP_STANDARD);

	luaL_openlib(L, "geoip", lib, 0);
	return 1;
}
