# Question
The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:

**a. Install `cronie` package on all `Nautilus app servers` and start `crond` service.**

**b. Add a cron `*/5 * * * * echo hello > /tmp/cron_text` for root user.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**At first login to all App server  & Switch to  root user**
```
ssh tony@stapp01
sudo su
```

**Install cronie package on server start & enable**
```
yum install cronie -y
```
```
systemctl start crond.service
systemctl status crond.service
```
**Create a cronjob  as per the task for root user**
```
crontab -e
```
**Add this inside**
```
*/5 * * * * echo hello > /tmp/cron_text` for root user.**
```
**Check cron job for user root**
```
crontab -l
```
**Validate  cron_text file is created successfully, before that done finish the task**
```
ls -la /tmp/
```
Here Only shown for App Server 1, Do the same on other servers

Click on confirm to complete the task
