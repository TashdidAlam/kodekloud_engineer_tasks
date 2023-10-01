# Question
To secure our Nautilus infrastructure in Stratos Datacenter we have decided to install and configure firewalld on all app servers. We have `Apache` and `Nginx` services running on these apps. Nginx is running as a reverse proxy server for Apache. We might have more robust firewall settings in the future, but for now we have decided to go with the given requirements listed below:

**a. Allow all incoming connections on `Nginx` port, i.e `80`.**

**b. Block all incoming connections on `Apache` port, i.e `8080`.**

**c. All rules must be `permanent`.**

**d. Zone should be `public`.**
<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Only App Server 1 is shown

SSH into app server 1 and switch to root
```
ssh tony@stapp01
```
```
sudo su -
```
Install Firewalld
```
yum install -y firewalld
```
Add firewall rules

```
# Allow incoming connections on Nginx port (HTTP)
sudo firewall-cmd --permanent --zone=public --add-service=http
```
```
# Block incoming connections on Apache port (8080)
sudo firewall-cmd --permanent --zone=public --remove-port=8080/tcp
```

```
# Reload the firewall to apply the changes
sudo firewall-cmd --reload
```
Click on confirm to complete the task