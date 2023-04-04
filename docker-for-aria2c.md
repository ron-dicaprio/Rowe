# DOCKER FOR ARIA2C
## 1、pull docker images 
```docker
docker pull p3terx/aria2-pro
docker pull p3terx/ariang
```
## 2、run docker images 
```docker
docker run -d \
    --name aria2-pro \
    --restart unless-stopped \
    --log-opt max-size=1m \
    -e PUID=$UID \
    -e PGID=$GID \
    -e UMASK_SET=022 \
    -e RPC_SECRET=sysadmin \
    -e RPC_PORT=6800 \
    -p 56800:6800 \
    -e LISTEN_PORT=6888 \
    -p 6888:6888 \
    -p 6888:6888/udp \
    -v /aria2c/aria2-config:/config \
    -v /data/aria2-downloads:/downloads \
    p3terx/aria2-pro

docker run -d \
    --name ariang \
    --log-opt max-size=1m \
    --restart unless-stopped \
    -p 56880:6880 \
    p3terx/ariang

```