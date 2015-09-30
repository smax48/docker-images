# Run data container

docker run -t -d -v ~/osrm/volumes/etc:/opt/osrm/etc -v ~/osrm/volumes/data:/opt/osrm/data -v ~/osrm/volumes/profiles:/opt/osrm/profiles --name osrm-data busybox:ubuntu-14.04

# Build osrm data from .osm.pbf

# Run osrm server