# Question
As per details shared by the development team, the new application release has some dependencies on the back end. There are some packages/services that need to be installed on all app servers under Stratos Datacenter. As per requirements please perform the following steps:

**a. Install `postfix` package on all the application servers.**

**b. Once installed, make sure it is enabled to start during boot.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Here only one Application server is shown

First sign into Appserver 1 & switch to root

```
ssh tony@staapp01
```
```
sudo su
```

Now Install postfix

```
yum install -y postfix
```

After completing the installation edit main.cf file

```
vi /etc/postfix/main.cf
```
 Find & Edit these 
```
inet_interfaces = all
inet_interfaces = 127.0.0.1
```

Now stat the service and enable 

```
sudo systemctl start postfix
systemctl enable postfix
```

Click on confirm to complete the task

