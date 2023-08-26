# Question
After doing some security audits of servers, xFusionCorp Industries security team has implemented some new security policies. One of them is to disable direct root login through SSH.

**Disable direct SSH root login on all app servers in Stratos Datacenter.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Here Only shown on App Server 1

Login to App Server on & switch to root
```
ssh tony@stapp01
```
```
sudo su -
```
Edit the  /etc/ssh/sshd_config  file and correct the changes as per below
```
cat /etc/ssh/sshd_config  | grep PermitRoot
```
Replace the    #PermitRootLogin yes  to    PermitRootLogin no

```
vi /etc/ssh/sshd_config
```
Check after edit

```
cat /etc/ssh/sshd_config  | grep PermitRoot
```
Restart service: systemctl restart sshd && systemctl status sshd

```
systemctl restart sshd && systemctl status sshd
```

Click on confirm to complete the task