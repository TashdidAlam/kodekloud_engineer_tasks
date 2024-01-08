# Question
The Nautilus DevOps team wants to install and set up a simple httpd web server on all app servers in Stratos DC. Additionally, they want to deploy a sample web page for now using Ansible only. Therefore, prepare the required playbook to complete this task. Find more details about the task below.

We already have an inventory file under /home/thor/ansible on jump host. Create a playbook.yml under /home/thor/ansible on jump host itself.

Using the playbook, install httpd web server on all app servers. Additionally, make sure its service should up and running.

Using blockinfile Ansible module add some content in /var/www/html/index.html file. Below is the content:

Welcome to XfusionCorp!

This is Nautilus sample file, created using Ansible!

Please do not modify this file manually!

The /var/www/html/index.html file's user and group owner should be apache on all app servers.

The /var/www/html/index.html file's permissions should be 0644 on all app servers.

Note:

i. Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

ii. Do not use any custom or empty marker for blockinfile module.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Go through the folder mentioned in task and create inventory & playbook files
```
cd /home/thor/ansible/
```
inventory file
```
[app_servers]
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```
Create a playbook file   as per the task
```
vi playbook.yml
```
```
- name: Install httpd and setup index.html

  hosts: stapp01, stapp02, stapp03

  become: yes

  tasks:

     - name: Install httpd

       package:

         name: httpd

         state: present

     - name: Start service httpd, if not started

       service:

         name: httpd

         state: started

     - name: Add content block in index.html and set permissions

       blockinfile:

         path: /var/www/html/index.html

         create: yes

         block: |

           Welcome to XfusionCorp!

           This is Nautilus sample file, created using Ansible!

           Please do not modify this file manually!

         owner: apache

         group: apache

         mode: "0644"
```

 Post file saved , run below command to execute the playbook
 ```
 ansible-playbook -i inventory playbook.yml
 ```
validate the task by curl on app server and check 

```
ansible all -a 'ls -l /var/www/html/' -i inventory
curl http://stapp01
curl http://stapp02
curl http://stapp03
```
Click on confirm to complete the task
