
# How To run a peer2peer tunnel

## pull a docker image
docker pull linuxserver/wireguard

## run a docker container
docker run -d \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -e SERVERURL=52.69.93.175 \
  -e SERVERPORT=51820 \
  -e PEERS=5 \
  -e PEERDNS=8.8.4.4 \
  -e INTERNAL_SUBNET=10.13.13.0 \
  -e ALLOWEDIPS=0.0.0.0/0 \
  -e PERSISTENTKEEPALIVE_PEERS=all \
  -e LOG_CONFS=true \
  -p 51820:51820/udp \
  -v /etc/wireguard/config:/config \
  -v /lib/modules:/lib/modules \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  linuxserver/wireguard


## scan you fuck QRcode via wireguard
