# Introduction

This project is used to serve tiles for `https://tiles.openstreetmap.org.ua/`.

![Map preview](static/images/map_preview.png)

## Usage

Tiles are available by url:

    https://tiles.openstreetmap.org.ua/tile/{z}/{x}/{y}.png
    

Here is an example how to connect tiles to your leaflet map:

    var map = L.map('map').setView([48.959, 32.311], 6);

    L.tileLayer('https://tiles.openstreetmap.org.ua/tile/{z}/{x}/{y}.png', {
        minZoom: 6,
        maxZoom: 18,
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright/">OpenStreetMap</a> contributors, <a href="http://opendatacommons.org/licenses/odbl/">ODbL</a>',
        id: 'base'
    }).addTo(map);

Usage is free, but if you expect more than 1000 clients, please, 
contact `shalal545@gmail.com` before using this tile server.

## Background
This project uses https://github.com/Monstrofil/osm_tileserver_docker to serve tiles.

# Credits
- Andrii B for creating script that prepares pbf file