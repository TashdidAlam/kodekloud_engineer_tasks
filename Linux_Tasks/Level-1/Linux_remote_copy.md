# Question

One of the Nautilus developers has copied confidential data on the jump host in Stratos DC. That data must be copied to one of the app servers. Because developers do not have access to app servers, they asked the system admins team to accomplish the task for them.

**Copy /tmp/nautilus.txt.gpg file from jump server to App Server 3 at location /home/web.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Remote file copy command

```
scp /tmp/nautilus.txt.gpg banner@stapp03:/home/web/
```
Click on confirm to complete the task
