# Question
One of the Nautilus developers was working to test new changes on a container. He wants to keep a backup of his changes to the container. A new request has been raised for the DevOps team to create a new image from this container. Below are more details about it:

**a. Create an image `official:devops` on Application Server 3 from a container `ubuntu_latest` that is running on the same server.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into App Server 3 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh banner@stapp03
  sudo su
  ```
  > *Establishes a secure shell session to App Server 3 as user banner, then switches to root for administrative access.*

**Step 2: Identify the running container**
- List running containers to confirm the container name or ID.
  ```
  docker ps
  ```
  > *Displays all running containers and helps you identify the `ubuntu_latest` container.*

**Step 3: Create a new image from the running container**
- Use the docker commit command to create a new image from the container.
  ```
  docker commit ubuntu_latest official:devops
  ```
  > *Creates a new image named `official:devops` from the current state of the `ubuntu_latest` container, preserving all changes made inside the container.*

**Step 4: Verify the new image**
- List all Docker images to confirm the new image exists.
  ```
  docker images
  ```
  > *Displays all available images and confirms that `official:devops` is present.*

**Step 5: Complete the task**
- Click on confirm to complete the task
