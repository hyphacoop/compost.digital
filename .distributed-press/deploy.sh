#!/bin/bash

# Get values from arguments
PROJECT_API_KEY=$1

# Configure the site
curl -v https://api.distributed.press/v0/publication/configure -H "Content-Type: multipart/form-data" -H "Accept: application/json" -H "Authorization: Bearer ${PROJECT_API_KEY}" -F "file=@./.distributed-press/config.json"

# Tar the website
tar -czvf www.tar.gz -C _site .

# Publish the website
curl -v https://api.distributed.press/v0/publication/publish -H "Content-Type: multipart/form-data" -H "Accept: application/json" -H "Authorization: Bearer ${PROJECT_API_KEY}" -F "file=@www.tar.gz"
