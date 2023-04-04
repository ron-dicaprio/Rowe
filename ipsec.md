# 搭建VPN服务器
## 拉取镜像
```sh
docker pull hwdsl2/ipsec-vpn-server
```
## 编辑宿主机配置文件
```shell
# vim /etc/ipsec.env
VPN_IPSEC_PSK=sysadmin
VPN_USER=sysadmin
VPN_PASSWORD=sysadmin
VPN_NETWORK_INTERFACE=eth0
VPN_PUBLIC_IP=<server ip>
VPN_ENABLE_MODP1024=yes
VPN_ADDL_USERS=user01 user02 user03 user04 user05
VPN_ADDL_PASSWORDS=sysadmin sysadmin sysadmin sysadmin sysadmin
```


## 运行docker镜像
```sh
# sudo docker run --name ipsec-vpn-server --env-file /etc/ipsec.env --restart=always -v ikev2-vpn-data:/etc/ipsec.d -v /lib/modules:/lib/modules:ro -p 500:500/udp -p 4500:4500/udp -d --privileged hwdsl2/ipsec-vpn-server:latest

# sudo docker run --name ipsec-vpn-server --env-file /etc/ipsec.env --restart=always -v ikev2-vpn-data:/etc/ipsec.d -v /lib/modules:/lib/modules:ro -p 500:500/udp -p 4500:4500/udp -d --privileged hwdsl2/ipsec-vpn-server:debian

$ docker run -d --privileged -p 500:500/udp -p 4500:4500/udp --name l2tp-vpn --restart=always --env-file /etc/l2tp.env -v /lib/modules:/lib/modules teddysun/l2tp


sudo docker run \
    --name ipsec-vpn-server \
    --env-file /etc/ipsec.env \
    --restart=always \
    -v ikev2-vpn-data:/etc/ipsec.d \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -d --cap-add=NET_ADMIN \
    --sysctl net.ipv4.ip_forward=1 \
    --sysctl net.ipv4.conf.all.accept_redirects=0 \
    --sysctl net.ipv4.conf.all.send_redirects=0 \
    --sysctl net.ipv4.conf.all.rp_filter=0 \
    --sysctl net.ipv4.conf.default.accept_redirects=0 \
    --sysctl net.ipv4.conf.default.send_redirects=0 \
    --sysctl net.ipv4.conf.default.rp_filter=0 \
    --sysctl net.ipv4.conf.eth0.send_redirects=0 \
    --sysctl net.ipv4.conf.eth0.rp_filter=0 \
    hwdsl2/ipsec-vpn-server:latest
```
## 防火墙策略
```sh
# 开放500  1701  4500 三个UDP端口
```

## 从服务器复制IKEv2key到当前目录,并移动到d盘根目录下
```sh
# docker cp ipsec-vpn-server:/etc/ipsec.d/vpnclient.p12 ./
```

## 客户端管理员执行操作
```sh
certutil -f -importpfx "d:\vpnclient.p12" NoExport

powershell -command ^"Add-VpnConnection -ServerAddress '<server ip>' ^
  -Name 'My IKEv2 VPN' -TunnelType IKEv2 -AuthenticationMethod MachineCertificate ^
  -EncryptionLevel Required -PassThru^"

powershell -command ^"Set-VpnConnectionIPsecConfiguration -ConnectionName 'My IKEv2 VPN' ^
  -AuthenticationTransformConstants GCMAES128 -CipherTransformConstants GCMAES128 ^
  -EncryptionMethod AES256 -IntegrityCheckMethod SHA256 -PfsGroup None ^
  -DHGroup Group14 -PassThru -Force^"
```