# Questions
The Nautilus production support team and security team had a meeting last month in which they decided to use local yum repositories for maintaing packages needed for their servers. For now they have decided to configure a local `yum repo` on `Nautilus Backup Server`. This is one of the pending items from last month, so please configure a local yum repository on Nautilus Backup Server as per details given below.

**a. We have some packages already present at location `/packages/downloaded_rpms/` on `Nautilus Backup Server`.**

**b. Create a yum repo named `yum_local` and make sure to set Repository ID to `yum_local`. Configure it to use package's location `/packages/downloaded_rpms/`.**

**c. Install package `samba` from this newly created repo.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First Sign into backup server and switch to root
```
ssh clint@stbkp01
```
```
sudo su -
```
Now create a file named `yum_local.repo` to `/etc/yum.repos.d/` Path
```
sudo vim /etc/yum.repos.d/yum_local.repo
```
Add these into that file
```
[yum_local]
name=yum_local
baseurl=file:///packages/downloaded_rpms/
enabled=1
gpgcheck=0
```
[Optional] Clean the yum repo cache
```
sudo yum clean all
```
Now install samba from package
```
sudo yum install samba -y
```
Click on confirm to complete the task
