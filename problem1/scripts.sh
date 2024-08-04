#!/bin/bash

# Find all containers labeled "com.a2odev.app=sigma"
containers=$(docker ps --filter "label=com.a2odev.app=sigma" --format "{{.ID}}")

# Loop through each container
for container in $containers; do
  # Set a memory limit of 64MB and memory swap limit to 128MB
  docker update --memory 64m --memory-swap 128m $container
  
  # Set a restart policy of "No more than 5 times after failure"
  docker update --restart=on-failure:5 $container
done

echo "Configuration applied to all containers with label com.a2odev.app=sigma."

