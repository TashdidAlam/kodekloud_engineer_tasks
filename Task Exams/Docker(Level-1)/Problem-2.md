# Question
The Nautilus DevOps team is testing some applications deployment on some of the application servers. They need to deploy a nginx container on Application Server 3. Please complete the task as per details given below:

**On Application Server 3 create a container named `nginx_3` using image `nginx` with `alpine` tag and make sure container is in running state.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into Application Server 3 & change to root user**
- Connect to Application Server 3 using SSH and switch to root.
  ```
  ssh banner@stapp03
  sudo su -
  ```
  > *Establishes a secure shell session to Application Server 3 as user banner, then switches to root for administrative access.*

**Step 2: Run the nginx container**
- Start the container in detached mode, set the name, and use the required image.
  ```
  docker run -d --name nginx_3 nginx:alpine
  ```
  > *Runs the container in the background (`-d`), names it `nginx_3`, and uses the lightweight Alpine-based nginx image.*

**Step 3: Verify the container is running**
- Check that the container is up and running with the correct image.
  ```
  docker ps | grep nginx_3
  ```
  > *Lists running containers and confirms that `nginx_3` is running with the `nginx:alpine` image and is in the Up state.*

**Step 4: Complete the task**
- Click on confirm to complete the task.