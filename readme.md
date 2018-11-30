
# CLI

1. use playbook
```
ansible-playbook -i hosts playbooks/nginx.yml
```

2. use verbose
```
ansible-playbook -i hosts playbooks/nginx.yml -vvv
```

3. command line in remote server via ansible
```
ansible -i hosts fea_nginx -a "/sbin/nginx -v"
```
