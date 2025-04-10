# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install dependencies including Tippecanoe
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    git \
    wget \
    make \
    gcc \
    g++ \
    libsqlite3-dev \
    libmapnik-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Tippecanoe
RUN curl -LO https://github.com/mapbox/tippecanoe/releases/download/v2.16.0/tippecanoe-v2.16.0-x86_64-linux.tar.gz \
    && tar -xzvf tippecanoe-v2.16.0-x86_64-linux.tar.gz \
    && mv tippecanoe /usr/local/bin/

# Set the working directory inside the container
WORKDIR /workspace

# Copy the script and the GeoJSON into the container
COPY generate_stream_tiles.sh /workspace/
COPY stream_influence_reclass.geojson /workspace/

# Make the script executable
RUN chmod +x /workspace/generate_stream_tiles.sh

# Default command to run the script
CMD ["./generate_stream_tiles.sh", "stream_influence_reclass.geojson", "tiles.pmtiles"]
