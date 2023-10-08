# Question
During the monthly compliance meeting, it was pointed out that several servers in the Stratos DC do not have a valid banner. The security team has provided serveral approved templates which should be applied to the servers to maintain compliance. These will be displayed to the user upon a successful login.

**Update the message of the day on all application and db servers for Nautilus. Make use of the approved template located at `/tmp/nautilus_banner` on `jump host`**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**Copy the /tmp/nautilus_banner using scp command from jumpserver to all Apps & DB servers.**

```
scp -r  /tmp/nautilus_banner  tony@stapp01:/tmp
```
**Login to all the App server  & switch to root user Now move copied file banner  /tmp to /etc/motd** 
```
ssh tony@stapp01
```
```
sudo su
```
```bash
mv /tmp/nautilus_banner  /etc/motd
```
Validate the open new terminal and login with user 
```
ssh tony@stapp01
```
For DB server we need to log into the db server first As OpenSSH is not installed there
```
ssh peter@stdb01
```
```
sudo su -
```
**Copy the /tmp/nautilus_banner using scp command from jumpserver**
```
scp -r  /tmp/nautilus_banner  peter@stdb01:/tmp
```
**Now move copied file banner  /tmp to /etc/motd**

```
 mv /tmp/nautilus_banner  /etc/motd
```

Here Only shown for App Server 1 & Db server, Do the same on other App servers 

Click on confirm to complete the task
