# Question
The Nautilus security team performed an audit of all servers present in Stratos DC. During the audit some critical data/files were identified as having the wrong permissions as per standards. Once the report was shared with the production support team, they started working to fix the issue. It has been identified that one of the files `/etc/hostname` on Nautilus `App 1 server` has the wrong permissions, so that needs to be fixed and the correct ACLs need to be set.

**The owner and group owner of the file should be `root` user.**

**Others must have read only permissions on the file.**

**User `anita` must not have any permission on the the file.**

**User `eric` should have read only permission on the file.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Login on   App server as per the task

```
ssh tony@stapp01
```
```
sudo su -
```
Check the existing file permission 
```
getfacl /etc/hostname
```
As per the task check users are already existing  or not

```
id anita
```

```
 id eric
```
Set the ACL permissoin as per the task 

```
setfacl -m u:anita:-,eric:r /etc/hostname
```

Validate the task check all user have correct ACL permission set
```
getfacl /etc/hostname
```
Click on confirm to complete the task
