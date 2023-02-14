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
VPN_PUBLIC_IP=147.161.32.37
VPN_ENABLE_MODP1024=yes
VPN_ADDL_USERS=user01 user02 user03 user04 user05
VPN_ADDL_PASSWORDS=sysadmin sysadmin sysadmin sysadmin sysadmin
```


## 运行docker镜像
```sh
docker run --name ipsec-vpn-server --env-file /etc/ipsec.env --restart=always -v ikev2-vpn-data:/etc/ipsec.d -v /lib/modules:/lib/modules:ro -p 500:500/udp -p 4500:4500/udp -d --privileged hwdsl2/ipsec-vpn-server
```


## 防火墙策略
```sh
# 开放500  1701  4500 三个UDP端口
```