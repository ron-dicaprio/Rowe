# How-To-Use-Ansible-In-Linux
## Install ansible
```sh
# yum update && yum install ansible -y
```
## close sshpass
```sh
# vim /etc/ansible/ansible.cfg
# host_key_checking = False
```
## useage
```sh
# ansible -i hosts CVM -m shell -a 'ip a'
```