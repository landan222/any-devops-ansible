######################################## MHA-Manager工具 ########################################
sudo masterha_check_ssh --conf=/etc/masterha/app.cnf           # 查看所有 SSH 配置
sudo masterha_check_repl --conf=/etc/masterha/app.cnf          # 查看所有 SSH 配置
sudo masterha_manager                                          # 启动MHA。
sudo masterha_check_status                                     # 检测当前MHA运行状态。
sudo masterha_master_monitor                                   # 监测master是否宕机。
sudo masterha_master_switch                                    # 控制故障转移(自动或手动)。
sudo masterha_conf_host                                        # 添加或删除配置的server信息。

######################################## MHA-Node工具 ########################################
sudo save_binary_logs                                          # 保存和复制master的二进制日志。
sudo apply_diff_relay_logs                                     # 识别差异的中继日志事件并应用于其它slave。
sudo filter_mysqlbinlog                                        # 去除不必要的ROLLBACK事件(MHA已不再使用这个工具)。
sudo purge_relay_logs                                          # 清除中继日志(不会阻塞SQL线程)。