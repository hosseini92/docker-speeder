# docker-udpspeeder

![Docker Pulls](https://img.shields.io/docker/pulls/dogbutcat/docker-speeder) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/dogbutcat/docker-speeder)

## Change Log

> 2023-12

- remove unsupported wget option
- update udpspeeder to 20230206.0

> 2021-09

- fix fetch ipv4 by default
- update updspeeder to 20210116.0

> 2020-06

- update udpspeeder to 20190121.0
- update script

> 2019-03

- update udpspeeder

## Introducing

this image is based on alpine image & you need basic docker knowledge. You can get it from Google or [Git-book](https://yeasy.gitbooks.io/docker_practice/) for Chinese Learning. Then DON'T ASK ME! :D

## Word first

this is for udpspeeder usage. Build-in version is [Here](https://github.com/wangyu-/UDPspeeder/releases/tag/20230206.0)

## How To Use It

### Server

```sh
name_server="docker-speeder-server"
bin_server=speederv2_amd64 # or speederv2_arm ...
sudo docker run -d \
            --restart always \
            --network host \
            --name $name_server \
            docker-speeder:latest \
            $bin_server -s -l 0.0.0.0:8855 -r 127.0.0.1:7777 -f 20:10 -k "passwds" --mode 0
```

### Client

```sh
name_client="docker-speeder-client"
bin_client=speederv2_amd64 # or speederv2_arm ...
sudo docker run -d \
            --restart always \
            --network host \
            --cap-add NET_ADMIN \
            --name $name_client \
            docker-speeder:latest \
            $bin_client -c -l 0.0.0.0:3333 -r 127.0.0.1:8855  -f 20:10 -k "passwds" --mode 0
```

## Notice:

For several days' testing, if you need to change NAT(Network Address Translation) type, MUST work in `host` network mode while docker bridge network is also working in NAT - [Helpful Link](http://blog.daocloud.io/docker-bridge/).

That's explains why NAT type after docker would be `Symmetric` type
