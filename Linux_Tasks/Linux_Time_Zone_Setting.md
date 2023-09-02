# Question
During the daily standup, it was pointed out that the timezone across Nautilus Application Servers in Stratos Datacenter doesn't match with that of the local datacenter's timezone, which is `America/Blanc-Sablon`.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

At first login on App server & Switch to  root user 

```
ssh tony@stapp01
```
```
sudo su -
```
Run Below command to check existing Time Zone set for server

```
timedatectl
```

Run Below command to set the time zone & verify it
```
timedatectl set-timezone America/Blanc-Sablon
```
```
timedatectl
```

We have to do this in all app servers stapp01,stapp02, stapp03. Here Shown only for Stapp01