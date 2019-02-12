perror 1045                            # 查看 MySQL error code

mysqlshow -uroot --count               # 查看 MySQL 每一个 database 的资料数    

mysqlshow -uroot landan --count        # 查看 MySQL database landan 里面 每一个 table 的资料数   

mysqlshow -uroot landan users --count

mysqlshow -uroot landan users --status

mysqlimport -uroot test /tmp/users.csv --fields-terminated-by="," --lines-terminated-by="\r\n"

mysqldbcompare --server1=root:mysql_pass_cli@127.0.0.1:3306 --server2=root:mysql_pass_router@10.0.0.22:3306 landan:landan

mysqldiff --server1=root:mysql_pass_cli@127.0.0.1:3306 --server2=root:mysql_pass_router@10.0.0.22:3306 landan.users:landan.users

mysqldump -uroot -T /tmp/ landan users --fields-terminated-by="," --where

mysqlbinlog --no-defaults mysql-bin.000001 --database=landan --start-datetime='2019/01/01 00:00:00' --stop-datetime='2019/02/01 00:00:00' 
