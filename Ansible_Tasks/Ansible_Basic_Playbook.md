# Question
One of the Nautilus DevOps team members was working on to test an Ansible playbook on jump host. However, he was only able to create the inventory, and due to other priorities that came in he has to work on other tasks. Please pick up this task from where he left off and complete it. Below are more details about the task:

**The inventory file `/home/thor/ansible/inventory` seems to be having some issues, please fix them. The playbook needs to be run on `App Server 3` in Stratos DC, so inventory file needs to be updated accordingly.**

**Create a playbook `/home/thor/ansible/playbook.yml` and add a task to create an empty file `/tmp/file.txt` on `App Server 3`.**

**Note: Validation will try to run the playbook using command `ansible-playbook -i inventory playbook.yml` so please make sure the playbook works this way without passing any extra arguments.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Edit the Inventory file
```
vi /ansible/inventory
```

```
stapp03 ansible_host=172.16.238.12 ansible_user=banner ansible_ssh_pass=BigGr33n ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```
Make a playbook
```
vi /ansible/playbook.yml
```
Edit the playbook with this 

```
---
- name: Create an empty file on App Server 3
  hosts: stapp03  # This should match the host name in your inventory file
  become: yes

  tasks:
    - name: Create an empty file
      file:
        path: /tmp/file.txt
        state: touch
```

Now run this command to check if the ansible playbook runs or not
```
ansible-playbook -i inventory playbook.yml
```
If the playbook runs successfully then click on confirm to complete the task
