## xtrabackup 8.0 版本 innobackupex 开始弃用
## xtrabackup 2.3 版本 innobackupex 是 Perl 脚本
## xtrabackup 2.4 版本 innobackupex 是 C 程序
## xtrabackup 8.0 版本 适应 MySQL Server 8.0 与 Percona Server 8.0

######################################## xtrabackup 2.4 版本 ########################################
sudo innobackupex --user=backup --passwd=mysql_pass_backup --socket=/var/lib/mysql/mysql.sock --defaults- file=/etc/my.cnf /tmp/xtrabackup/full --no-timestamp


######################################## xtrabackup 8.0 版本 ########################################
## 热备份需要连 sys mysql imformation_schema performance_schema 一起备份
sudo xtrabackup --backup --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=/home/vagrant/www/xtrabackup --parallel=2

## 回复需 
## sudo rm -R /var/lib/mysql/*
## sudo chmod -R 777 /var/lib/mysql
sudo xtrabackup --defaults-file=/etc/my.cnf --copy-back --rsync --target-dir=/home/vagrant/www/xtrabackup

sudo xtrabackup --prepare --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=./xtrabackup --parallel=2

sudo xtrabackup --apply-log --use-memory=4G --host=localhost --user=backup --password=mysql_pass_backup --parallel=2 ./xtrabackup