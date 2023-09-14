# Question
To stick with the security compliances, the Nautilus project team has decided to apply some restrictions on crontab access so that only allowed users can create/update the cron jobs. Limit crontab access to below specified users on App Server 1.

**Allow crontab access to `anita` user and deny the same to `rod` user.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Logging in to App Server 1

```
ssh tony@stapp01
```

```
sudo su
```

Command to allow cron access to user `anita` in App Server 1

```
echo "anita" | sudo tee -a /etc/cron.allow
```
Command to deny cron access to user `rod` in App Server 1

```
echo "rod" | sudo tee -a /etc/cron.deny
```

Click on confirm to complete the task