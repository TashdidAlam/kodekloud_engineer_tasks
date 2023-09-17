# Question
The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. To make these scripts work properly we need to make sure thor user on `jump host` has password-less SSH access to all app servers through their respective `sudo users`. Based on the requirements, perform the following:

**Set up a password-less authentication from user `thor` on `jump host` to all app servers through their respective `sudo users`.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Check if your login as thor user  on the server  & create a key by below command

```
whoami
```
```
ssh-keygen -t rsa
```
Copy public key by below command on all the APP servers

```
ssh-copy-id  tony@stapp01
```
```
ssh-copy-id  steve@stapp02
```
```
ssh-copy-id  banner@stapp03
```
Click on confirm to complete the task