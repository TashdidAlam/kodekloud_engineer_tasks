# Question
On our Storage server in Stratos Datacenter we are having some issues where nfsuser user is holding hundred of processes, which is degrading the performance of the server. Therefore, we have a requirement to limit its maximum processes. Please set its maximum process limits as below:

**a. soft limit = 1024**

**b. hard_limit = 2027**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Login to the Data Server & Switch to root

```
ssh natasha@ststor01
```
```
sudo su -
```
Edit limit.conf file as below (Follow task limits)
```
sudo vim /etc/security/limits.conf
```
```
nfsuser soft nproc 1024
nfsuser hard nproc 2027
```
Check Edit Result
```
cat /etc/security/limits.conf | grep nproc | grep -v ^#
```
Click on confirm to complete the task