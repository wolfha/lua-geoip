package.cpath = package.cpath..";../src/?.so"

require 'geoip'

print(geoip.country_code_by_name("212.56.71.159"))
