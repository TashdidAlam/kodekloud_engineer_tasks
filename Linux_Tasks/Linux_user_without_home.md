# Question
The system admins team of xFusionCorp Industries has set up a new tool on all app servers, as they have a requirement to create a service user account that will be used by that tool. They are finished with all apps except for App Server 1 in Stratos Datacenter.

**Create a user named `javed` in `App Server 1` without a home directory**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to App Server 1 & Switch to root
```
ssh tony@stapp01
```
```
sudo su -
```
Check user javed is existed , if not then proceed with creation
```
id javed
```
```
cat /etc/passwd |grep javed
```
Create the user as per task suggested
```
useradd -M javed
```
Validate the task by listing the file exist in  Home directory

```
id javed
```
```
cat /etc/passwd |grep javed
```
```
ll /home
```

Click on confirm to complete the task