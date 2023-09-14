# Question
The system admin team of xFusionCorp Industries has noticed an issue with some servers in Stratos Datacenter where some of the servers are not in sync w.r.t time. Because of this, several application functionalities have been impacted. To fix this issue the team has started using common/standard NTP servers. They are finished with most of the servers except App Server 1. Therefore, perform the following tasks on this server:

**Install and configure NTP server on `App Server 1`.**

**Add NTP `server 1.sg.pool.ntp.org` in NTP configuration on App Server 1.**

**Please do not try to `start/restart/stop` ntp service, as we already have a restart for this service scheduled for tonight and we don't want these changes to be applied right now.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to App Server 1 & Switch to root
```
ssh tony@stapp01
```
```
sudo su -
```

Check NTP is installed , if not then install on the server 
```
rpm -qa |grep ntp
```
```
yum install -y ntp
```
Confirm package install successfully
```
rpm -qa |grep ntp
```
Add NTP server in configuration file 
```
vi /etc/ntp.conf
```
```
cat /etc/ntp.conf |grep sg.pool
```
Click on confirm to complete the task
