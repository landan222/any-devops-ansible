## 此 Perl CLI 还蛮多坑的，一般书上也没解答，出问题请 GOOGLE

######################################## MHA-Manager工具 ########################################
sudo masterha_check_ssh --conf=/etc/masterha/app.cnf           # 查看所有 SSH 配置
sudo masterha_check_repl --conf=/etc/masterha/app.cnf          # 查看所有 从库 配置
sudo nohup masterha_manager --conf=/etc/masterha/app.cnf --remove_dead_master_conf --ignore_last_failover < /dev/null > /var/log/masterha/masterha.log 2>&1 &                                        # 启动MHA。
sudo masterha_check_status --conf=/etc/masterha/app.cnf        # 检测当前MHA运行状态。
sudo masterha_stop --conf=/etc/masterha/app.cnf                # 关闭当前MHA运行状态。
sudo masterha_master_monitor --conf=/etc/masterha/app.cnf      # 监测master是否宕机。


sudo masterha_master_switch --conf=/etc/masterha/app.cnf --master_state=dead --dead_master_host=10.0.0.81 --dead_master_port=3306 --new_master_host=10.0.0.82 --new_master_port=3306 --ignore_last_failover                # 控制故障转移(自动或手动)。

## 这里有坑， --master_state=alive alive 切换时，请先关闭 master monitor
##           执行 masterha_master_switch ， 请先执行 masterha_stop
sudo masterha_master_switch --conf=/etc/masterha/app.cnf --master_state=alive --new_master_host=10.0.0.82 --new_master_port=3306 --orig_master_is_new_slave --running_updates_limit=10000 
sudo masterha_conf_host                                        # 添加或删除配置的server信息。

sudo tail -f /var/log/masterha/masterha.log 

######################################## MHA-Node工具 ########################################
sudo save_binary_logs                                          # 保存和复制master的二进制日志。
sudo apply_diff_relay_logs                                     # 识别差异的中继日志事件并应用于其它slave。
sudo filter_mysqlbinlog                                        # 去除不必要的ROLLBACK事件(MHA已不再使用这个工具)。
sudo purge_relay_logs                                          # 清除中继日志(不会阻塞SQL线程)。


