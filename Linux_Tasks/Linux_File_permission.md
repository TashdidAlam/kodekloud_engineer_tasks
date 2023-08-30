# Question
There are new requirements to automate a backup process that was performed manually by the xFusionCorp Industries system admins team earlier. To automate this task, the team has developed a new bash script `xfusioncorp.sh`. They have already copied the script on all required servers, however they did not make it executable on one the app server i.e `App Server 1` in Stratos Datacenter.

**Please give executable permissions to `/tmp/xfusioncorp.sh` script on `App Server 1`. Also make sure every user can execute it.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Logging in to App Server 1

```
ssh tony@stapp01
```

```
sudo su
```
List the file existing file permission
```
ls -ltr /tmp/xfusioncorp.sh
```
As per the task all other users need to have execute permission
```
chmod o+rx /tmp/xfusioncorp.sh
```
Verify the file permissions and execute the script form user 

```
ls -lrt /tmp/xfusioncorp.sh
```
```
sh /tmp/xfusioncorp.sh
```
Click on confirm to complete the task
