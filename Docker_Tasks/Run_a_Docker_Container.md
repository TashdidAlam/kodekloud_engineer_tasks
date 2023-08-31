# Question
Nautilus DevOps team is testing some applications deployment on some of the application servers. They need to deploy a nginx container on `Application Server 1`. Please complete the task as per details given below:

**On Application Server 1 create a container named `nginx_2` using image `nginx` with `alpine` tag and make sure container is in running state.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to App Server 2 & Switch to root
```
ssh steve@stapp02
```
```
sudo su -
```
Pull the image with tag
```
docker pull nginx:alpine
```
Run the image with specific tag and container name & port

```
docker run -d --name nginx_2 -p 80:80 nginx:alpine
```

Check the container is it running or not
```
docker ps
```

Click on confirm to complete the task
