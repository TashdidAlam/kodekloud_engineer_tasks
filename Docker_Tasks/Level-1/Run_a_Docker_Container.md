# Question
Nautilus DevOps team is testing some application deployments on the application servers. They need to deploy an nginx container on Application Server 1. Please complete the task as per details given below:

**On Application Server 1, create a container named `nginx_2` using image `nginx` with `alpine` tag and make sure the container is in running state.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Sign in to App Server 2 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh steve@stapp02
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 2 as user steve, then switches to root for administrative access.*

**Step 2: Pull the nginx image with alpine tag**
- Download the required nginx image from Docker Hub.
  ```
  docker pull nginx:alpine
  ```
  > *Ensures the specific nginx:alpine image is available locally for container creation.*

**Step 3: Run the nginx container with specific name and port mapping**
- Start a new container named `nginx_2` using the pulled image and map port 80.
  ```
  docker run -d --name nginx_2 -p 80:80 nginx:alpine
  ```
  > *Creates and runs the container in detached mode, names it `nginx_2`, and maps host port 80 to container port 80 for web access.*

**Step 4: Verify the container is running**
- List running containers to confirm nginx_2 is active.
  ```
  docker ps
  ```
  > *Shows all running containers and verifies that nginx_2 is up and running.*

**Step 5: Complete the task**
- Click on confirm to complete the task
