# Question
There is data on jump host that needs to be copied on all application servers in Stratos DC. Nautilus DevOps team want to perform this task using Ansible. Perform the task as per details mentioned below:

**a. On jump host create an inventory file `/home/thor/ansible/inventory` and add all application servers as managed nodes.**

**b. On jump host create a playbook `/home/thor/ansible/playbook.yml` to copy `/usr/src/sysops/index.html` file to all application servers at location `/opt/sysops`.**

**Note: Validation will try to run the playbook using command `ansible-playbook -i inventory playbook.yml` so please make sure the playbook works this way without passing any extra arguments.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Go through the folder mentioned in the task and create inventory & playbook file
```
 cd  /home/thor/ansible/
```
Create an inventory file and add the app servers
```
vi inventory
```
```
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n  ansible_user=tony

stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@  ansible_user=steve

stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n  ansible_user=banner
```

Check the inventory file is working correctly by listing folder on all the app servers
```
ansible all -a "ls -ltr /opt/sysops" -i inventory
```
Create a playbook
```
vi playbook.yml
```
Add this in the playbook.yml
```
- name: Ansible copy

  hosts: all

  become: yes

  tasks:

    - name: copy index.html to sysops folder

      copy: src=/usr/src/sysops/index.html dest=/opt/sysops
```
Run below command to execute the playbook
```
ansible-playbook -i inventory playbook.yml
```

Validate the task by running the below command

```
ansible all -a "ls -ltr /opt/sysops" -i inventory
```
Click on confirm to complete the task