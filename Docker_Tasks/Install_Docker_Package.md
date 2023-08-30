# Question
Last week the Nautilus DevOps team met with the application development team and decided to containerize several of their applications. The DevOps team wants to do some testing per the following:

**Install `docker-ce` and `docker-compose` packages on `App Server 3`**

**Start docker service.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to App Server 3 & Switch to root
```
ssh banner@stapp03
```
```
sudo su -
```
Install docker-ce & docker.io
```
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
```
```
dnf install docker-ce docker-ce-cli containerd.io
```
Enable Docker and start Service
```
systemctl enable --now docker
```
```
systemctl start docker
```
Install Docker-compose
```
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
```
chmod +x /usr/local/bin/docker-compose
```
If docker needs to run for specific user (optional)
```
usermod -aG docker username
```
Check Docker installation
```
docker --version
```
```
docker images
```
```
docker ps
```
```
docker compose --version
```

Click on confirm to complete the task
