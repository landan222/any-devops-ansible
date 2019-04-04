
# CLI

1. use playbook
```
ansible-playbook playbooks/nginx.yml
```

2. use verbose
```
ansible-playbook playbooks/nginx.yml -vvv
```

3. command line in remote server via ansible
```
ansible fea_nginx -a "/sbin/nginx -v"
```

4. install nginx of feature environtment via ansible
```
ansible-playbook playbooks/nginx.yml --extra-vars "branch=fea"

or 

ansible-playbook playbooks/nginx.yml --extra-vars "branch=feature"

or

ansible-playbook playbooks/nginx.yml

or

ansible-playbook playbooks/main.yml --tags "nginx" --extra-vars "branch=feature"

or

ansible-playbook playbooks/php.yml -e '{ "branch": "feature" }'
```

5. install nginx of all environtment via ansible
```
ansible-playbook playbooks/nginx.yml --extra-vars "branch=all"
```

6. install nginx, php of any environtment via ansible
```
ansible-playbook playbooks/main.yml --tags "nginx, php"
```

7. install any of any environtment via ansible with debug mode
```
ansible-playbook playbooks/main.yml --tags "nginx, php, node, mysql, mongodb" --extra-vars "debug=true"

or 

ansible-playbook playbooks/main.yml --extra-vars "debug=true"

```

8. ansilbe host 是有 cache 机制 如果换了 ssh key 还是 无法连， 试试改个 host 名

# Database Schema
1.  menus
    - name
    - route
1.  organizations, 组织 
    - name
    - domain
1.  departments, 部门
    - department_id
    - organization_id
    - name
    - roles ( 可考虑 BSON)
    - 技术部,产品部,市场部,运营部,财务部,超级部,人事部,总理部
2.  department_permissions, 部门权限
    - department_permission_id
    - department_id
    - menu_ids
1.  department_roles, 员工分类
    - department_id
    - department_role_id
    - name
    - 总监 GET, POST, PUT, DELETE
    - 经理 GET, POST, PUT
    - 组长 GET, POST
    - 职员 GET
1.  employees, 员工
    - employee_id
    - user_id
    - name
    - organization_ids
    - department_ids
    - department_role_id
   
1. organization_employee
   - organzation_id
   - employee_id
    
3.  administrators, 后台用户
    - name
    - email
4.  administrator_logins, 后台用户登入记录
    - user_login_id
    - user_id
    - ip
    - 分表

4.  users, 前台用户
4.  user_signins, 前台用户登入记录
    - member_sigin_id
    - member_id
    - ip
    - 分表
5.  user_transactions, 用户账变
    - type (支付宝,微信,银行卡,活动, 客服充值, 系统回馈, 现金领取，系统理赔，客服扣款)

5.  payment_categories, 支付类型
    - 支付宝
    - 微信
    - 银行卡
6. payment_category_types,
    - name
    - description
    
6.  payment_ways, 支付实际渠道
    - name （八戒, 闪云）
    - path (32 hash)
    - method (GET, POST, PUT, DELETE)
    
7.  payment_accounts, 支付账号

8.  events, 事件
    - event_id
    - activity_type_id
8.  activity_types, 活动类型
    - 注册
    - 首充
9.  activities, 活动
    - name
    - type (签到, 首储，注册，邀请，盈亏)
    - conditions (用 BSON)
[{ "from": 180, "to": 280, "max": "108", "rate": 0, "bonus": 18}, {  "from": 280, "to": 580, "max": "108", "rate": 0, "bonus": 28}, {"from": 580, "to": 880, "max": "108", "rate": 0, "bonus": 68}, {"from": 880, "to": 1080, "max": "108", "rate": 0, "bonus": 88}, {"from": 1080, "to": 2147483647, "max": "108", "rate": 0, "bonus": 108}]
10. activity_rewards, 活动奖励
    - activity_id
    - activity_reward_id
    - activity_reward_condition_id
    - relative_id
    - relative_table (user_transaction_times, user_cards, user_transaction_days, user_transaction_months, member_transaction_years)
11. activity_reward_conditions, 奖励条件
    - from
    - to
    - rate
    - amount
    - max
    - bounus = (money * rate + amout >= max ? max : money * rate + amout)
11. activity_awarders, 获奖人记录 # 活动授奖部分可以 做成 事件方式，耦合性低

12. banners, 广告
    - name
    - src
    - url
13. verifications, 验证
    - code
    - phone
    - ip
    - user_id
    
14. platforms

15. platform_types
   - name (AG, BBIN, NOUYA_1, NOUYA_2)
   
15. transactions
   - transaction_id
   - created_time
16. transaction_details 考虑交易可能会有 先买 但是 过几天后才开奖的情形
   - transaction_detail_id
   - transaction_detail_type_id
   - created_time
17. transaction_detail_types
16. tables
   - id
   - name
   - type (SYSTEM 系统变异资料, CONFIG 程序设定表,USER 变异资料, ADMINISTRATOR 后台管理者变异表)

