# Question
To manage all servers within the stack using Ansible, the Nautilus DevOps team is planning to use a common sudo user among all servers. Ansible will be able to use this to perform different tasks on each server. This is not finalized yet, but the team has decided to first perform testing. The DevOps team has already installed Ansible on jump host using yum, and they now have the following requirement:


**On jump host make appropriate changes so that Ansible can use `jim` as a default ssh user for all hosts. Make changes in Ansible's default configuration only —please do not try to create a new config.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First change to root in jump server
```
sudo su -
```
Now change the ansible root user in `ansible.cfg`

```
vi /etc/ansible/ansible.cfg
```
Add this line
```
remote_user = jim
```
Click on confirm to complete the task