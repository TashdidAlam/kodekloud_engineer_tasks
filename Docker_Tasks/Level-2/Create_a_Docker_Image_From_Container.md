# Question
One of the Nautilus developer was working to test new changes on a container. He wants to keep a backup of his changes to the container. A new request has been raised for the DevOps team to create a new image from this container. Below are more details about it:

**a. Create an image `official:devops` on Application Server 3 from a container `ubuntu_latest` that is running on same server.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**SSH into App Server 1 & switch to root**:

```bash
ssh banner@stapp03
```
```
sudo su
```

Find the container ID or name of the running container (`ubuntu_latest`). You can use the `docker ps` command to list running containers:

```bash
docker ps
```

Once you have identified the container, use the `docker commit` command to create a new image from it and specify the desired image name (`official:devops`):

```bash
docker commit <container_id_or_name> official:devops
```

Docker will create a new image with the name `official:devops`. You can verify this by running:

```bash
docker images
```
Click on confirm to complete the task
