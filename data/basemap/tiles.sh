#!/bin/bash

# Define the local directory and file paths (use forward slashes for Git Bash)
BASE_DIR="/d/Amigos/TG/Telangana-water-log/data/basemap/"
PBF_FILE="$BASE_DIR/telangana.osm.pbf"
PROCESS_FILE="$BASE_DIR/process-openmaptiles.lua"
CONFIG_FILE="$BASE_DIR/config-openmaptiles.json"
OUTPUT_FILE="$BASE_DIR/hyderabad.pmtiles"

# Download the OpenStreetMap PBF file for Telangana
wget -nc https://download.openstreetmap.fr/extracts/asia/india/telangana.osm.pbf -O "$PBF_FILE"

# Run the tilemaker Docker container with explicit volume mapping
docker run -it --rm --pull always \
  -v "/d/Amigos/TG/Telangana-water-log/data/basemap:/data" \
  ghcr.io/systemed/tilemaker:master \
  /data/telangana.osm.pbf \
  --output /data/basemap.pmtiles \
  --bbox 78.2,17.2,78.6,17.6 \
  --process /data/process-openmaptiles.lua \
  --config /data/config-openmaptiles.json \
  --skip-integrity


  docker run -it --rm --pull always -v "D:\Amigos\TG\Telangana-water-log\data\basemap:/data" ghcr.io/systemed/tilemaker:master /data/telangana.osm.pbf --output /data/basemap.pmtiles --bbox 78.2,17.2,78.6,17.6 --process /data/process-openmaptiles.lua --config /data/config-openmaptiles.json --skip-integrity