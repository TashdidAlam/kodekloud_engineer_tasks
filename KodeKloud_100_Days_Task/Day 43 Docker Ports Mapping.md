# Question
The Nautilus DevOps team is planning to host an application on a nginx-based container. There are a number of tickets already created for similar tasks. One of the tickets has been assigned to set up a nginx container on Application Server 2 in Stratos Datacenter. Please perform the task as per details mentioned below:

**a. Pull `nginx:stable` docker image on Application Server 2.**
**b. Create a container named `news` using the image you pulled.**
**c. Map host port 5000 to container port 80. Please keep the container in running state.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Pull the nginx:stable image**
- Download the required nginx image from Docker Hub.
  ```
  sudo docker pull nginx:stable
  ```
  > *Ensures the specific `nginx:stable` image is available locally for container creation.*

**Step 2: Run a container named news with port mapping**
- Start a new container named `news` using the pulled image and map host port 5000 to container port 80.
  ```
  sudo docker run -d --name news -p 5000:80 nginx:stable
  ```
  > *Creates and runs the container in detached mode, names it `news`, and maps host port 5000 to container port 80 for web access.*

**Step 3: Verify the container is running**
- List running containers to confirm `news` is active and port mapping is correct.
  ```
  docker ps
  ```
  > *Shows all running containers and verifies that `news` is up and running with the correct port mapping.*

**Step 4: (Optional) Health check for nginx**
- Confirm nginx is serving content on the mapped port.
  ```
  curl -I http://localhost:5000
  ```
  > *Checks the HTTP response headers to ensure nginx is accessible on port 5000.*

**Step 5: Complete the task**
- Click on confirm to complete the task.