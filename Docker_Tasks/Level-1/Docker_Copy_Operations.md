# Question
The Nautilus DevOps team has some conditional data present on App Server 2 in Stratos Datacenter. There is a container `ubuntu_latest` running on the same server. We received a request to copy some of the data from the docker host to the container. Below are more details about the task:

**On App Server 2 in Stratos Datacenter, copy an encrypted file `/tmp/nautilus.txt.gpg` from the docker host to the `ubuntu_latest` container (running on the same server) in `/opt/` location. Please do not try to modify this file in any way.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Sign in to App Server 2 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh steve@stapp02
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 2 as user steve, then switches to root for administrative access.*

**Step 2: Copy the file from host to container**
- Use the docker cp command to copy the file into the running container.
  ```
  docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
  ```
  > *Copies the encrypted file from the host to the `/opt/` directory inside the `ubuntu_latest` container without modifying it.*

**Step 3: Verify the file inside the container**
- Access the container shell and list the files in `/opt` to confirm the copy.
  ```
  docker exec -it ubuntu_latest bash
  ls -la /opt
  ```
  > *Opens an interactive shell in the container and lists the contents of `/opt` to verify the file is present.*

**Step 4: Complete the task**
- Click on confirm to complete the task
