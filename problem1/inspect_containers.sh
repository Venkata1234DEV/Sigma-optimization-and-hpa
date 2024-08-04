#!/bin/bash

# Inspect redis-service and store the output in redis-service-inspect.json
docker inspect redis-service > redis-service-inspect.json

# Inspect api-gw and store the output in api-gw-inspect.json
docker inspect api-gw > api-gw-inspect.json

# Inspect mongodb-service and store the output in mongodb-service-inspect.json
docker inspect mongodb-service > mongodb-service-inspect.json

echo "Inspection output stored in separate files."

