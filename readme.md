
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

4. install nginx of feature environtment via ansible
```
ansible-playbook playbooks/nginx.yml --extra-vars "branch=fea"

or 

ansible-playbook playbooks/nginx.yml
```

5. install nginx of all environtment via ansible
```
ansible-playbook playbooks/nginx.yml --extra-vars "branch=all"
```

5. install nginx, php of any environtment via ansible
```
ansible-playbook playbooks/main.yml --tags "nginx, php"
```