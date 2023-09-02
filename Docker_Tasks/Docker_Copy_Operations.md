# Question
The Nautilus DevOps team has some conditional data present on `App Server 2` in Stratos Datacenter. There is a container `ubuntu_latest` running on the same server. We received a request to copy some of the data from the docker host to the container. Below are more details about the task:

**On `App Server 2` in Stratos Datacenter copy an encrypted file `/tmp/nautilus.txt.gpg` from docker host to `ubuntu_latest` container (running on same server) in `/usr/src/` location. Please do not try to modify this file in any way.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to App Server 2 & Switch to root
```
ssh steve@stapp02
```
```
sudo su -
```
Now Run this command to copy the file
```
docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
```

Check if the file is copied or not
```
docker exec -it ubuntu_latest bash
```
```
ls -la /opt
```
Click on confirm to complete the task
