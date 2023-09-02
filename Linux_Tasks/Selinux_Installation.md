# Question
The xFusionCorp Industries security team recently did a security audit of their infrastructure and came up with ideas to improve the application and server security. They decided to use SElinux for an additional security layer. They are still planning how they will implement it; however, they have decided to start testing with app servers, so based on the recommendations they have the following requirements:

**Install the required packages of SElinux on `App server 3` in Stratos Datacenter and disable it permanently for now; it will be enabled after making some required configuration changes on this host. Don't worry about rebooting the server as there is already a reboot scheduled for tonight's maintenance window. Also ignore the status of SElinux command line right now; the final status after reboot should be disabled.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Logging in app03 server

```
ssh banner@stapp03
```

```
sudo su
```
Install the SElinux 

```
yum -y install selinux*
```

Check the existing SElinux status
```
sestatus
```
```
cat /etc/selinux/config | grep SELINUX
```
Edit the /etc/selinux/config  file and correct the changes as per below

```
vi /etc/selinux/config
```
```
cat /etc/selinux/config | grep SELINUX
```
Click on confirm to complete the task
