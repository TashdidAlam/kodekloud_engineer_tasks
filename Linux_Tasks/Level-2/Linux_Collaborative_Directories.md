# Question
The Nautilus team doesn't want its data to be accessed by any of the other groups/teams due to security reasons and want their data to be strictly accessed by the dbadmin group of the team.

**Setup a collaborative directory `/dbadmin/data` on `app server 2` in Stratos Datacenter.**

**The directory should be group owned by the group `dbadmin` and the group should own the files inside the directory. The directory should be `read/write/execute` to the user and group owners, and others should not have any access.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Ssh into the app server 2 and switch to root
```
ssh steve@stapp02
```
```
sudo su
```

Create the directory
```
sudo mkdir -p /dbadmin/data
```
Set the ownership & permission
```
sudo chown :dbadmin /dbadmin/data
```
```
sudo chmod 770 /dbadmin/data
```

Verify the permission
```
ls -ld /dbadmin/data
```
Click on confirm to complete the task
