# Question
The Nautilus development team shared requirements with the DevOps team regarding new application development.—specifically, they want to set up a Git repository for that project. Create a Git repository on Storage server in Stratos DC as per details given below:

**Install git package using yum on Storage server.**

**After that create a bare repository `/opt/media.git` (make sure to use exact name).**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to storage server and switch to root user
```
ssh natasha@ststor01
```
```
sudo su -
```
Install git
```
yum install -y git
```
Initiate git repo in the designated folder
```
cd /opt/
```
```
git init  --bare media.git
```
```
git status
```
Click on confirm to complete the task
