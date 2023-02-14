# HOW TO USE HOME-ASSISTANT VIA IPV6
home-assistant智能家居环境搭建
随着生产力水平的提高和人民对居住环境的不断提升，大量智能家居有意无意的涌入人们的生活，为了实现统一的管理和随时随地的控制，我们需要一个物联网中枢来打造我们的智能家居环境，以便更好的享受生活。
### Linux基础环境
```
ENV : 
Ubuntu 20.04.5 LTS + Docker version 20.10.12
```

### 拉取home-assistant镜像并重命名
```sh
# sudo docker pull ghcr.io/home-assistant/home-assistant:stable
如果镜像下载速度过慢，可以直接从网盘下载。
aliyundirvel download link, 阿里网盘暂不支持分享.
# sudo docker load -i home-assistant.tar
# sudo docker tag ghcr.io/home-assistant/home-assistant:stable home-assistant:stable 
```

### 运行home-assistant容器.  /data/homeassistant/为本地挂载路径
```sh
# sudo docker run -d --name homeassistant --privileged --restart=unless-stopped -e TZ=MY_TIME_ZONE -v /data/homeassistant/:/config --network=host home-assistant:stable
```

### 初始化home-assistant
http://IPV6:8123  

[访问路径](http://localhost:8123/)
