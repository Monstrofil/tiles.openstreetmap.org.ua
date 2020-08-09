FROM ubuntu:18.04

RUN apt update
RUN apt install -y wget unzip

# dir where resulting file will be stored
RUN mkdir /output

COPY ukraine.poly ukraine.poly
COPY crimea.osm.zip crimea.osm.zip
RUN unzip crimea.osm.zip && rm -f crimea.osm.zip

COPY prepare_ukraine_pbf.sh prepare_ukraine_pbf.sh
ENTRYPOINT ./prepare_ukraine_pbf.sh