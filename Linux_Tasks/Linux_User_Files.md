# Question
There was some users data copied on Nautilus App Server 1 at /home/usersdata location by the Nautilus production support team in Stratos DC. Later they found that they mistakenly mixed up different user data there. Now they want to filter out some user data and copy it to another location. Find the details below:

**On App Server 1 find all files (not directories) owned by user kirsty inside /home/usersdata directory and copy them all while keeping the folder structure (preserve the directories path) to /media directory.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Login to App Server & Switch to root user

```
ssh tony@stapp01
```
```
sudo su
```
List the files and folders in the given folder path in task
```
ls -la /home/usersdata/
```
```
ll /media/
```
```
find /home/usersdata/ -type f -user kirsty |wc -l
```

As per the task find the files name by user & copy with folder structure Command
```
find /home/usersdata/ -type f -user kirsty -exec cp --parents {} /media \;
```
List the files copied in the destination folder given in task
```
ls -la /media/home/usersdata/
```
Click on confirm to complete the task