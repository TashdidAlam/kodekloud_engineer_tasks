# Question
xFusionCorp Industries uses some monitoring tools to check the status of every service, application, etc running on the systems. Recently, the monitoring system identified that Apache service is not running on some of the Nautilus Application Servers in Stratos Datacenter.

**1. Identify the faulty Nautilus Application Server and fix the issue. Also, make sure Apache service is up and running on all Nautilus Application Servers. Do not try to stop any kind of firewall that is already running.**


**2. Apache is running on 8086 port on all Nautilus Application Servers and its document root must be `/var/www/html` on all app servers.**

**3. Finally you can test from jump host using curl command to access Apache on all app servers and it should be reachable and you should get some static page. E.g. curl `http://172.16.238.10:8086/.`*

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**At first login on App server  & Switch to  root user**
```bash
ssh tony@stapp01
sudo su -
```
**First Start the apache server then from the log check what's wrong**
```
systemctl start httpd
systemctl status httpd
```
**From our error we see**
```bash
Oct 13 11:38:27 stapp01.stratos.xfusioncorp.com httpd[701]: httpd: Syntax error on line 31 of /etc/httpd/conf/...ory
```
**Edit the  conf  file and correct the changes as per below**
```bash
vi /etc/httpd/conf/httpd.conf
```
```bash
cat -n  /etc/httpd/conf/httpd.conf  |grep 31
```
```
31  ServerRoot "/etc/httpd"

131  <Directory "/var/www/html">

231      # Example:
```

```bash
cat /etc/httpd/conf/httpd.conf |grep DocumentRoot
```
**Output

```
# DocumentRoot: The directory out of which you will serve your

DocumentRoot "/var/www/html"

# access content that does not live under the DocumentRoot.
```
**Save the file and start the httpd service & check the status.**
```
systemctl start httpd  &&  systemctl  status httpd
```

**Now sign into the App Server 2 & App Server 3**

When i was solving the problem the Apache server was stop on those server so i only started them

Then Click on confirm to complete the task

