# btmon.py with influx

Docker image for btmon.py

## Config

Map your btmon.cfg into the volume in /etc e.g.

``` bash
docker run -it \
  -v $(pwd)/btmon.cfg:/etc/btmon.cfg \
  btmon-influxdb
```

## TODO

* Support command line options

## Development

``` bash
# Build
docker build -t btmon-influxdb .

# Test
docker run -it \
  -v btmon.cfg:/etc/btmon.cfg \
  --device=/dev/ttyUSB0:/dev/ttyUSB0 \
  btmon-influxdb

```

## Release

``` bash
# Update the change log
vi CHANGELOG.md

# Create a release
hub release create --browse v1.0.0

# Import the changelog
:r CHANGELOG.md

# Check Github Actions
```
