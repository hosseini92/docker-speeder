#!/bin/bash
sudo docker build . -t docker-speeder:latest

# sudo docker save docker-speeder:latest | gzip > docker-speeder.tar.gz
# sudo docker load < docker-speeder.tar.gz

name="docker-speeder"

# sample run on server
bin_server=speederv2_amd64 # or speederv2_arm ...
sudo docker run -d \
            --restart always \
            --network host \
            --name $name \
            docker-speeder:latest \
            $bin_server  -s -l0.0.0.0:8855 -r 127.0.0.1:7777 -f20:10 -k "passwds" --mode 0
          
# sample run on client
bin_client=speederv2_amd64 # or speederv2_arm ...
sudo docker run -d \
            --restart always \
            --network host \
            --cap-add NET_ADMIN \
            --name $name \
            docker-speeder:latest \
            $bin_client -c -l0.0.0.0:3333 -r 45.66.77.88:8855  -f20:10 -k "passwds" --mode 0
