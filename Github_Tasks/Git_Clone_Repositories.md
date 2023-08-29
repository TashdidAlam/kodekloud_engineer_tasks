# Question
DevOps team created a new Git repository last week; however, as of now no team is using it. The Nautilus application development team recently asked for a copy of that repo on Storage server in Stratos DC. Please clone the repo as per details shared below:

**The repo that needs to be cloned is `/opt/ecommerce.git`**

**Clone this git repository under `/usr/src/kodekloudrepos` directory. Please do not try to make any changes in repo.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First login on to the storage server &  Switch to the root user
```
ssh natasha@ststor01
```
```
sudo su
```

Clone git repository under directory mentioned in the task
```
cd /usr/src/kodekloudrepos
```

Command to clone
```
git clone /opt/ecommerce.git
```

Validate the task successfully by list the folder
```
ls -la ecommerce/
```
Click on confirm to complete the task