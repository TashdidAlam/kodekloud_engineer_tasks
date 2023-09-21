# Question
As per new application requirements shared by the Nautilus project development team, serveral new packages need to be installed on all app servers in Stratos Datacenter. Most of them are completed except for `wget`.

**Therefore, install the `wget` package on all app-servers.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**Only App server 1 will be shown and the same commands are for other app servers**

Sign into app server 1 and switch to root
```
ssh tony@stapp01
```
```
sudo su
```

Using this command can instal wget

```
yum install -y wget
```
Click on confirm to complete the task