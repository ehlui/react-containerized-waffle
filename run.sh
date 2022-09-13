#!/bin/bash

# Script to build and run our nginx service with our react app within
docker build --no-cache -t test-multistage-img .
docker run  --name test-multistage --rm  -p 80:3000 test-multistage-img