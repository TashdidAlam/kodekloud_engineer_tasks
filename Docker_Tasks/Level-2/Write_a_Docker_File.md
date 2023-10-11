# Question
As per recent requirements shared by the Nautilus application development team, they need custom images created for one of their projects. Several of the initial testing requirements are already been shared with DevOps team. Therefore, create a docker file /opt/docker/Dockerfile (please keep D capital of Dockerfile) on App server 1 in Stratos DC and configure to build an image with the following requirements:

**a. Use `ubuntu` as the base image.**

**b. Install `apache2` and configure it to work on `5000` port. (do not update any other Apache configuration settings like document root etc).**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**SSH into App Server 1 & switch to root**:

```bash
ssh tony@stapp01
```
```
sudo su -
```
**Write a Dockerfile  in folder /opt/docker**
```bash
vi /opt/docker/Dockerfile
```
**Add this into that file**
```bash
FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install apache2 -y

RUN sed -i "s/80/5000/g" /etc/apache2/ports.conf

EXPOSE 5000
```
**Run Build command to  create an image**
```bash
cd /opt/docker/
```
```bash
docker build  -t apache2 .
```
**Run the Below command to  run the docker container on the server**
```bash
docker run --name http -p 5000:5000 -d apache2
```
**Validate the task**
```
docker ps
curl -Ik http://localhost:5000
```

Click on confirm to complete the task