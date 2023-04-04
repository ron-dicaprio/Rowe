# docker搭建openvpn服务器
## 拉取docker镜像并初始化数据
```sh
# docker run -v /etc/openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://52.69.93.175:1194
# docker run -v /etc/openvpn:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
```

## 运行docker镜像并配置相关文件
```sh
# 启动OpenVPN服务器进程
# docker run --name=openvpn -v /etc/openvpn:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
docker run  --name openvpn -v /etc/openvpn:/etc/openvpn -d -p 1194:1194/udp --restart=always --cap-add=NET_ADMIN kylemanna/openvpn:latest

# 生成不带密码的客户端证书
# docker run -v /etc/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full sysadmin nopass

# 使用嵌入式证书检索客户端配置
# docker run -v /etc/openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient sysadmin > sysadmin.ovpn


# 查看卷地址
# docker volume inspect ovpn-data-file
```
