# Question
During the weekly meeting, the Nautilus DevOps team discussed about the automation and configuration management solutions that they want to implement. While considering several options, the team has decided to go with Ansible for now due to its simple setup and minimal pre-requisites. The team wanted to start testing using Ansible, so they have decided to use jump host as an Ansible controller to test different kind of tasks on rest of the servers.

**Install `ansible` version `4.10.0` on `Jump host` using `pip3` only. Make sure Ansible binary is available globally on this system, i.e all users on this system are able to run Ansible commands.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First install epel-release on jump host
```
sudo yum install epel-release
```

Then install pip3
```
sudo yum install python3-pip
```

Now install the required ansible
```
sudo pip3 install ansible==4.10.0
```
Now check the version of ansible
```
ansible --version
```
Click on confirm to complete the task
