# 开启 supervisord
sudo supervisord -c /etc/supervisor/supervisor.conf



# 进入 supervisord CLI 控制界面
sudo supervisorctl -c /etc/supervisor/supervisor.conf

# 进入 supervisord CLI 控制界面
sudo supervisorctl -c /etc/supervisor/supervisor.conf status

# 进入 supervisord CLI 控制界面
sudo supervisorctl -c /etc/supervisor/supervisor.conf read

# 进入 supervisord CLI 控制界面
sudo supervisorctl -c /etc/supervisor/supervisor.conf update


# 重启 lottery-service_resource_backend-lumen php73_artisan_swoole_http_start
sudo supervisorctl -c /etc/supervisor/supervisor.conf restart lottery-service_resource_backend-lumen:php73_artisan_swoole_http_start

# 重启 lottery-crawler_all_backend-sracpy python3_src_runner_lottery_issue_index
sudo supervisorctl -c /etc/supervisor/supervisor.conf restart lottery-crawler_all_backend-sracpy:python3_src_runner_lottery_issue_index