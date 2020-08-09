#!/usr/bin/env bash

wget https://download.geofabrik.de/europe/ukraine-latest.osm.pbf -O ukraine-latest-new-crimea.osm.pbf
rm -f /bin/osmconvert64 \
  && wget http://m.m.i24.cc/osmconvert64 -O /bin/osmconvert64 \
  && chmod +x /bin/osmconvert64
osmconvert64 ukraine-latest-new-crimea.osm.pbf -B=ukraine.poly -o=ukraine-latest-no-crimea.osm
osmconvert64 ukraine-latest-no-crimea.osm crimea.osm --out-pbf > output/ukraine-latest-fixed-crimea.osm.pbf
