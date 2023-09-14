# Question
On Nautilus storage server in Stratos DC there is a storage location /data which is used by different developers to keep their data (no confidential data). One of the developers mariyam has raised a ticket and asked for a copy of his/her data present in /data/mariyam directory on storage server. /home is an FTP location on storage server where developers can download their data. Below are the instructions shared by the system admin team to accomplish the task:

**a. Make a mariyam.tar.gz compressed archive of /data/mariyam directory and move the archive to /home directory on Storage Server.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>    

Login on storage server  & Switch to  root user 
```
ssh natasha@ststor01
```

```
sudo su -
```
Run Below command to archive the folder ( check folder name in your task)

```
ls -la /data
```
```
tar -czvf mariyam.tar.gz  /data/mariyam/
```

Moving the  tar file to /home
```
ls -la
```

```
 mv mariyam.tar.gz  /home/
```

Validate the task by listing the file exist in  Home directory 

```
ls -la /home/
```

Click on confirm to complete the task