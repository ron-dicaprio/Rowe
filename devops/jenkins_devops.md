# Jenkins Devops
## pull jenkins image
```sh
# docker pull jenkins/jenkins:lts
# docker run CMD
docker run \
  --user root \
  -dit \
  --name docker-jenkins \
  --restart=always \
  --privileged=true \
  -p 80:8080 \
  -p 50000:50000 \
  -v /var/jenkins-data:/var/jenkins_home \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e TZ="Asia/Shanghai" \
  jenkins/jenkins:lts
```
# login Jenkins by password  
```sh
# docker logs docker-jenkins
```
