# Question
The Nautilus development team shared with the DevOps team requirements for new application development, setting up a Git repository for that project. Create a Git repository on Storage server in Stratos DC as per details given below:

**Install `git`0 package using `yum` on Storage server.**

**After that, `create/init` a git repository named `/opt/games.git` (use the exact name as asked and make sure not to create a bare repository).**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

SSH to storage server and switch to root

```
ssh natasha@ststor01
```
```
sudo su -
```
Install Git
```
sudo yum install git
```
Create the repo
```
cd /opt/
```
```
git init games.git
```
Check if the repo is created or not
```
ls -la
```
Click on confirm to complete the task