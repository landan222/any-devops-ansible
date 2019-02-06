## xtrabackup 8.0 版本 innobackupex 开始弃用
## xtrabackup 2.3 版本 innobackupex 是 Perl 脚本
## xtrabackup 2.4 版本 innobackupex 是 C 程序
## xtrabackup 8.0 版本 适应 MySQL Server 8.0 与 Percona Server 8.0

######################################## xtrabackup 2.4 版本 ########################################
innobackupex --user=backup --passwd=mysql_pass_backup --socket=/var/lib/mysql/mysql.sock --defaults- file=/etc/my.cnf /tmp/xtrabackup/full --no-timestamp


######################################## xtrabackup 8.0 版本 ########################################
xtrabackup --backup --host=localhost --user=backup --password=mysql_pass_backup