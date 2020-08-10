#!/usr/bin/env bash

set -x

wget https://download.geofabrik.de/europe/ukraine-latest.osm.pbf -O ukraine-latest-new-crimea.osm.pbf
rm -f /bin/osmconvert64 \
  && wget http://m.m.i24.cc/osmconvert64 -O /bin/osmconvert64 \
  && chmod +x /bin/osmconvert64
rm -f /bin/osmfilter64 \
  && wget http://m.m.i24.cc/osmfilter64 -O /bin/osmfilter64 \
  && chmod +x /bin/osmfilter64

# crop downloaded polygon by borders
osmconvert64 ukraine-latest-new-crimea.osm.pbf -B=ukraine.poly -o=ukraine-latest-no-crimea.osm
# drop relations to Russia
osmfilter64 ukraine-latest-no-crimea.osm --verbose \
  --drop-relations="@id=1059500 or @id=3560388 or @id=3563652 or @id=3564042 or @id=3788824 or @id=3795586 or @id=30189 or @id=3826845 or @id=60189 @id=2800681 or @id=2858674 or @id=3805584" \
  -o=ukraine-latest-no-crimea-no-russia.osm
# combine and convert to pbf again
osmconvert64 ukraine-latest-no-crimea-no-russia.osm crimea_fixed.osm --out-pbf > output/ukraine-latest-fixed-crimea.osm.pbf
