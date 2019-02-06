-- 基本 权限

SHOW GRANTS;

SHOW GRANTS FOR root@'127.0.0.1';

SHOW GRANTS FOR backend@'10.0.0.41';

REVOKE ALL PRIVILEGES, GRANT OPTION ON *.* FROM backend@'10.0.0.41';


-- 基本 系统相关

SELECT VERSION();

SELECT @@tx_isolation;

SHOW VARIABLES;

SHOW GLOBAL STATUS;

SHOW GLOBAL STATUS LIKE 'Com_%';        # 查詢全 session 服務器 Com 結果

SHOW SESSION STATUS LIKE 'Com_%';       # 查詢 當下 session 服務器 Com 結果
SHOW STATUS LIKE 'Com_%';

SHOW STATUS LIKE 'innodb_row_lock%';

SHOW STATUS LIKE '%semi_sync%';

SHOW INNODB STATUS;

-- 基本 表相关

SHOW FULL COLUMNS FROM landan.users;

SHOW INDEX FROM landan.users;

SHOW TABLE STATUS FROM landan LIKE 'users';

-- BIN 

SHOW BINARY LOGS;                       # 查看所有 binary log files 与 档案大小

SHOW BINLOG EVENTS;

SHOW MASTER LOGS;

SHOW BINLOG EVENTS in 'mysql-bin-00001' FROM 101;

PURGE MASTER LOGS BEFORE DATE_SUB(NOW(), INTERVAL 14 day);

PURGE MASTER LOGS BEFORE '2019-01-01 00:00:00';

PURGE MASTER LOGS TO 'mysql-bin-00001';

RESET MASTER;                           # 清除所有 MASTER binlog

SHOW ENGINES;

SHOW VARIABLES LIKE 'long%';

SHOW PROCESSLIST;


SHOW PROFILES;                         # 查看 此 session query 记录 与执行时间

SHOW PROFILE BLOCK IO, CPU, SOURCE;

SHOW PROFILE FOR QUERY 3;

-- 读取 csv 

LOAD DATA INFILE '/tmp/users.csv' INTO TABLE users;

SELECT * FROM users INTO '/tmp/users.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"';

-- 表格优化

ANALYZE TABLE users;

CHECK TABLE users;

OPTIMIZE TABLE users;
 

SELECT * FROM users PROCEDURE ANALYZE();

EXPLAIN SELECT * FROM users;

SHOW STATUS LIKE 'Handler_read%';

-- 主从配置

CHANGE MASTER TO MASTER_HOST='10.0.0.61', MASTER_USER='replicator', MASTER_PASSWORD='mysql_pass_replicator', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=5577;

START SLAVE;

SHOW SLAVE STATUS;

INSTALL PLUGIN rpl_semi_sync_master SONAME 'semisync_master.so';
INSTALL PLUGIN rpl_semi_sync_slave SONAME 'semisync_slave.so';

STOP SLAVE IO_THREAD;

START SLAVE IO_THREAD;
