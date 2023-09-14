# Question
New tools have been installed on the app server in Stratos Datacenter. Some of these tools can only be managed from the graphical user interface. Therefore, there are requirements for these app servers.

On all App servers in Stratos Datacenter change the default runlevel so that they can boot in GUI (graphical user interface) by default.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Login to App server 01 and switch to root

```
ssh tony@stapp01
```
```
sudo su
```

Run Below command to check the default run level

```
systemctl get-default
```
Run Below command to change the run level to graphical.target
```
systemctl set-default graphical.target
```
Post set default start graphical service & validate  the status
```
systemctl status graphical.traget
```
```
systemctl start graphical.target
systemctl status graphical.target
```
```
systemctl get-default
```
Click on confirm to complete the task
