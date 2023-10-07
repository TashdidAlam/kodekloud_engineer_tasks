# Question
Nautilus project developers are planning to start testing on a new project. As per their meeting with the DevOps team, they want to test containerized environment application features. As per details shared with DevOps team, we need to accomplish the following task:

**a. Pull `busybox:musl`0 image on `App Server 2` in Stratos DC and `re-tag` (create new tag) this image as `busybox:media`.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**Log into the App Server 2 & swith to root:**

```
ssh seteve@stapp02
```
```
sudo su
```

**Pull the `busybox:musl` Image**:

```bash
docker pull busybox:musl
```

**Re-Tag the Image**:

```bash
docker tag busybox:musl busybox:media
```


**Verify the New Tag**:

```bash
docker images
```

Click on confirm to complete the task
