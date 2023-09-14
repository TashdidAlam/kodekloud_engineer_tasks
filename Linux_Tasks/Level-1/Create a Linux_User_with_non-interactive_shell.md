# Question

Create a Linux User with a non-interactive shell The System Admin Team of XfusionCorp Industries has installed a backup agent tool on all app servers. As per the tool's requirements, they need to create a user with a non-interactive shell. 

**Therefore, create a user named `rose` with a non-interactive shell in the app03 server**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Logging in app03 server

```
ssh banner@stapp03
```

```
sudo su
```
Check if user exist or not

```
id rose
```
If not then add user

```
adduser rose  -s /sbin/nologin
```
Validate user creation

```
id rose
```
```
cat /etc/passwd |grep rose
```
Click on confirm to complete the task