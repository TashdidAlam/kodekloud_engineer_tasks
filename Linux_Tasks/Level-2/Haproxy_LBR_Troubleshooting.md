# Question
xFusionCorp Industries has an application running on Nautlitus infrastructure in Stratos Datacenter. The monitoring tool recognised that there is an issue with the haproxy service on LBR server. That needs to fixed to make the application work properly.

**Troubleshoot and fix the issue, and make sure `haproxy` service is running on `Nautilus LBR server`. Once fixed, make sure you are able to access the website using `StaticApp` button on the top bar.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**Log into the LBR server & switch to root**
```
ssh loki@stlb01
```
```
sudo su
```
**Check if haproxy is running or not if not running start the service**
```
systemctl status haproxy
systemctl start haproxy
```
**Check the issue in the config file**
```
haproxy -c -f /etc/haproxy/haproxy.cfg
```
**For my self the output is**
```
[ALERT] 280/052534 (391) : parsing [/etc/haproxy/haproxy.cfg:7] : cannot find user id for 'haprox' (0:Success)
[ALERT] 280/052534 (391) : Error(s) found in configuration file : /etc/haproxy/haproxy.cfg
[ALERT] 280/052534 (391) : Fatal errors found in configuration.
```
**So checking the No.7 line on the config file** 
```
global
    log         127.0.0.1 local2

    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000
    user        haprox
    group       haproxy
    daemon
```
We can see the user name `haproxy` is spelled incorrectly.

**So change the haproxy config & check config**
```
vi /etc/haproxy/haproxy.cfg
haproxy -c -f /etc/haproxy/haproxy.cfg
```

**If all ok then restart and enable haproxy**
```
systemctl restart haproxy
systemctl enable haproxy
```
Click on confirm to complete the task
