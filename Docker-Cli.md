# How-To-Run-Containers-Without-Docker-Desktop
## Install containers and Microsoft-Hyper-V
```sh
# Enable-WindowsOptionalFeature -Online -FeatureName containers –All
# Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All
```
## Download Docker
> docker-exe-download-url :  
> https://download.docker.com/win/static/stable/x86_64/  
```sh
# curl.exe -o docker.zip -LO https://download.docker.com/win/static/stable/x86_64/docker-23.0.1.zip 
# Expand-Archive docker.zip -DestinationPath C:\
# [Environment]::SetEnvironmentVariable("Path", "$($env:path);C:\docker", 
# [System.EnvironmentVariableTarget]::Machine)
# $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
```

## register dockerd as service 
```sh
# dockerd --register-service
# Start-Service docker
```

##  unregister dockerd
```sh
# dockerd --unregister-service
```

## modify service 
> 打开注册表：计算机\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\docker  
> 修改ImagePath的值，例如C:\docker\dockerd.exe --run-service --experimental=true