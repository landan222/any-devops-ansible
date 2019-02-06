## xtrabackup 8.0 版本 innobackupex 开始弃用
## xtrabackup 2.3 版本 innobackupex 是 Perl 脚本
## xtrabackup 2.4 版本 innobackupex 是 C 程序
## xtrabackup 8.0 版本 适应 MySQL Server 8.0 与 Percona Server 8.0

######################################## xtrabackup 2.4 版本 ########################################
sudo innobackupex --user=backup --passwd=mysql_pass_backup --socket=/var/lib/mysql/mysql.sock --defaults- file=/etc/my.cnf /tmp/xtrabackup/full --no-timestamp


######################################## xtrabackup 8.0 版本 ########################################
## 热备份需要连 sys mysql imformation_schema performance_schema 一起备份
sudo xtrabackup --backup --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=/home/vagrant/www/xtrabackup --parallel=2

sudo xtrabackup --backup --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=/home/vagrant/www/xtrabackup --parallel=2


## 回复需 
## sudo rm -R /var/lib/mysql/*
## sudo chown -R mysql:mysql /var/lib/mysql
sudo xtrabackup --defaults-file=/etc/my.cnf --copy-back --rsync --target-dir=/home/vagrant/www/xtrabackup

sudo xtrabackup --prepare --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=./xtrabackup --parallel=2

## --apply-log 该选项表示同xtrabackup的--prepare参数,
## 一般情况下,在备份完成后，数据尚且不能用于恢复操作，因为备份的数据中可能会包含尚未提交的事务或已经提交但尚未同步至数据文件中的事务。
## 因此，此时数据 文件仍处理不一致状态。--apply-log的作用是通过回滚未提交的事务及同步已经提交的事务至数据文件使数据文件处于一致性状态。 
sudo xtrabackup --prepare --apply-log-only  --use-memory=4G --user=backup --password=mysql_pass_backup --target-dir=/home/vagrant/www/xtrabackup


########################################## 备份 并还原 单一表的方法 ########################################## 

sudo xtrabackup --defaults-file=/etc/my.cnf --copy-back --rsync --target-dir=/home/vagrant/www/xtrabackup

mysql -e "DROP TABLE landan.users;"
mysql -e "USE landan;
          CREATE TABLE `users` (
            `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
            `name` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NOT NULL,
            `password` CHAR(96) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' NULL, # md5(users.name . KEY). md5(md5(users.password) . strrev(md5(users.password . KEY)))
            `expired_time` DATETIME NOT NULL DEFAULT '2100-01-01 00:00:00',
            `created_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
            `updated_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
            `deleted_time` DATETIME NULL DEFAULT NULL,
            PRIMARY KEY (`user_id`))
          -- ENGINE = InnoDB
          DEFAULT CHARACTER SET = utf8mb4 PARTITION BY LINEAR HASH(user_id) PARTITIONS 8 ;";
          
mysql -e "ALTER TABLE landan.users DISCARD TABLESPACE;"

sudo cp /home/vagrant/www/xtrabackup/landan/users*.ibd /var/lib/mysql/landan

sudo chown -R mysql:mysql /var/lib/mysql/landan

mysql -e "ALTER TABLE landan.users IMPORT TABLESPACE;"

########################################## 备份 并还原 单一表的方法 ########################################## 


