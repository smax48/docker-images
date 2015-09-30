# General Info

This docker image is designed for running the OSRM server (https://github.com/Project-OSRM/osrm-backend).
Data & config files are accessed from a special separate docker data container (osrm-data) and persisted to the host.
Map can be extracted & built when a osrm-backend container is started in the interactive mode.
Map data file must be called 'map.osm.pbf' and placed into a volume mapped to the '/opt/osrm/data' on the data container.

# Run data container

docker run -t -d -v ~/osrm/volumes/etc:/opt/osrm/etc -v ~/osrm/volumes/data:/opt/osrm/data -v ~/osrm/volumes/profiles:/opt/osrm/profiles --name osrm-data busybox:ubuntu-14.04

# Build osrm data from .osm.pbf

When building, the script will try to find a file called map.osm.pbf

```
$ docker run -ti --rm --volumes-from=osrm-data smax48/osrm-backend /bin/bash
$ cd /opt/osrm/bin
$ ./build
```

# Run osrm server

When running, the script will try to find a file called map.osrm

```
$ docker run -d -p 5000:5000 --volumes-from=osrm-data --name=osrm_server smax48/osrm-backend
```