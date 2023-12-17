#!/bin/bash

sudo docker build . -t docker-speeder:latest

### save image
# sudo docker save docker-speeder:latest | gzip > docker-speeder.tar.gz

### load image
# sudo docker load < docker-speeder.tar.gz