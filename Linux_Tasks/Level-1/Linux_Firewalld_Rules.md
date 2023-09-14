# Question
The Nautilus system admins team recently deployed a web UI application for their backup utility running on the Nautilus backup server in Stratos Datacenter. The application is running on port 6000. They have firewalld installed on that server. The requirements that have come up include the following:

**Open all incoming connection on 6000/tcp port. Zone should be public.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Login  to respective mentioned Backup server in task & switch to root

```
 ssh clint@stbkp01
```
```
sudo su
```

Check Firewall status and existing Zone rules

```
firewall-cmd --zone=public --list-all
```
According to your task check the application port and add the below rule.
```
sudo firewall-cmd --zone=public --add-port=6000/tcp --permanent
```

Reload the firewall rules & restart the firewall services.     
```
firewall-cmd --reload
```
```
systemctl restart firewalld
```
Validate firewall rule implemented
```
firewall-cmd --zone=public --list-all
```

Click on confirm to complete the task