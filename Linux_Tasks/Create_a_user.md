# Question

For security reasons the xFusionCorp Industries security team has decided to use custom Apache users for each web application hosted, rather than its default user. This will be theApache user, so it shouldn't use the default home directory. Create the user as per requirements given below:

**a. Create a user named yousuf on the App server 1 in Stratos Datacenter.**

**b. Set UID to 1128 and its home directory to /var/www/yousuf.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. All the Best</span>

`ssh tony@stapp01`

`sudo su -`

Command to create new user with uid

`useradd -u 1128 yousuf`

`id yousuf`

`cat /etc/passwd | grep yousuf`

Command to change user home directory

`usermod -d /var/www/yousuf -m yousuf`

`cat /etc/passwd |grep yousuf`

Click on confirm to complete the task
