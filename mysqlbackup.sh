#!/bin/bash
## Date     : 2022-11-08
## Author   : caitao <caitao@css.com.cn>

# 环境变量
source /etc/profile

# 定义备份路径
backup_path="/mysqlbackup"

# 定义需要备份的数据库,如pydev和test两个库
db_list="pydev test"
# 用户
MYSQL_USER="root"
# 密码
MYSQL_PASSWORD="@password"
# sockpath. docker下的路径
MySQL_Socket="/var/lib/mysql/mysql.sock"

# sql和log备份文件保留时长
reserve_day=14

# 检查备份目录是否存在,不存在就创建
if [[ ! -d ${backup_path} ]];then
	mkdir -p ${backup_path} 
fi

# 开始循环事件
for db in $db_list;do
# 备份日志文件路径
dumplog="${backup_path}/${db}_$(date +"%Y%m%d%H%M%S").log"
# /mysqlbackup/pydev_20221108220739.log

# 记录备份开始时间,写入$dumplog文件
echo '------------------' >>  ${dumplog}
date +"%Y-%m-%d %H:%M:%S" >>  ${dumplog}

# 开始执行备份
/usr/bin/mysqldump -u${MYSQL_USER} -p${MYSQL_PASSWORD} -S ${MySQL_Socket} ${db} --log-error=${dumplog} > ${backup_path}/${db}_$(date +"%Y%m%d%H%M%S").sql

# 记录备份结束时间
date +"%Y-%m-%d %H:%M:%S" >>  ${dumplog}
echo '------------------' >>  ${dumplog}
# 结束循环
done

# 定期删除sql备份文件及log日志,生产慎用
if [[ -d ${backup_path} ]];then
	find ${backup_path} -type f -mtime +${reserve_day} -name "*.sql" -exec rm -rf {} \;
    find ${backup_path} -type f -mtime +${reserve_day} -name "*.log" -exec rm -rf {} \;
fi
