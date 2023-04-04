# 只允许使用密钥登陆私人服务器
## 在客户端生产密钥对
```sh 
ssh-keygen -t rsa
```

## 上传公钥到服务器，并将公钥写到authorized_keys上
```
cat id_rsa.pub >> /root/.ssh/authorized_keys
```

## 修改sshd配置文件的值 -- /etc/ssh/sshd_config
```sh
# 不允许密码登陆
PasswordAuthentication no
# 开启RSA验证
RSAAuthentication yes
# 是否使用公钥验证
PubkeyAuthentication yes
# 公钥的保存位置
AuthorizedKeysFile /root/.ssh/authorized_keys

```