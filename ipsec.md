# 搭建IPSEC VPN服务器
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

## 从服务器复制IKEv2key到当前目录
```sh
docker cp ipsec-vpn-server:/etc/ipsec.d/vpnclient.p12 ./
```

## 客户端执行操作
```sh 
certutil -f -importpfx "d:\vpnclient.p12" NoExport

powershell -command ^"Add-VpnConnection -ServerAddress '147.161.32.37' ^
  -Name 'My IKEv2 VPN' -TunnelType IKEv2 -AuthenticationMethod MachineCertificate ^
  -EncryptionLevel Required -PassThru^"

powershell -command ^"Set-VpnConnectionIPsecConfiguration -ConnectionName 'My IKEv2 VPN' ^
  -AuthenticationTransformConstants GCMAES128 -CipherTransformConstants GCMAES128 ^
  -EncryptionMethod AES256 -IntegrityCheckMethod SHA256 -PfsGroup None ^
  -DHGroup Group14 -PassThru -Force^"
```
