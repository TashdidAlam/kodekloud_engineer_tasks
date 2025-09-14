# Question
We received a request to copy some of the data from one of the docker containers to the docker host. The container is running on App Server 3 in Stratos Datacenter. Below are more details about the task:


On App Server 3 in Stratos Datacenter copy an encrypted file /tmp/test.txt.gpg from development_3 docker container to the docker host in /tmp location. Please do not try to modify this file in any way.

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into Application Server 3 & changing to root user**
- Connect to Application Server 3 using SSH and switch to root.
  ```
  ssh banner@stapp03
  sudo su -
  ```
  > *Establishes a secure shell session to Application Server 3 as user banner, then switches to root for administrative access.*

**Step 2: Copy the file from the container to the host**
- Use docker cp to copy the file from the development_3 container to the /tmp directory on the host.
  ```
  docker cp development_3:/tmp/test.txt.gpg /tmp/
  ```
  > *Copies the encrypted file from the container to the host's /tmp directory.*

**Step 3: Verify the file exists on the host**
- Check that the file has been successfully copied to the host.
  ```
  ls -l /tmp/test.txt.gpg
  ```
  > *Lists the details of the copied file to verify its existence and permissions.*
