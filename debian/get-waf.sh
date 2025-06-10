#!/bin/sh

scriptdir="${0%/*}"
wafversion=$1
if [ "x${wafversion}" = "x" ]; then
  echo "usage: $0 <wafversion>" 1>&2
  echo "   eg: $0 2.0.19" 1>&2
  exit 1
fi

url="https://waf.io/waf-${wafversion}.tar.bz2"
echo "downloading WAF from ${url} to ${scriptdir}/waf"

cd "${scriptdir}"

rm -rf waf
mkdir -p waf
curl "${url}" | tar --strip-components=1 -C waf -xvjf -
for d in demos/ docs/ tests/ utils/ zip/ build_system_kit/ playground/ waf; do
  rm -rf waf/${d}
done
