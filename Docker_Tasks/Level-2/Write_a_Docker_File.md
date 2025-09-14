# Question
As per recent requirements shared by the Nautilus application development team, they need custom images created for one of their projects. Several of the initial testing requirements have already been shared with the DevOps team. Therefore, create a Dockerfile `/opt/docker/Dockerfile` (please keep D capital of Dockerfile) on App Server 1 in Stratos DC and configure it to build an image with the following requirements:

**a. Use `ubuntu` as the base image.**
**b. Install `apache2` and configure it to work on port `5000`. (Do not update any other Apache configuration settings like document root etc).**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into App Server 1 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh tony@stapp01
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 1 as user tony, then switches to root for administrative access.*

**Step 2: Write a Dockerfile in /opt/docker**
- Create and edit the Dockerfile with the required instructions.
  ```
  vi /opt/docker/Dockerfile
  ```
  Add the following content:
  ```Dockerfile
  FROM ubuntu
  ARG DEBIAN_FRONTEND=noninteractive
  RUN apt-get update
  RUN apt-get install apache2 -y
  RUN sed -i "s/80/5000/g" /etc/apache2/ports.conf
  EXPOSE 5000
  ```
  > *Defines the base image, installs Apache2, changes the listening port to 5000, and exposes port 5000 for the container.*

**Step 3: Build the Docker image**
- Change to the Dockerfile directory and build the image.
  ```
  cd /opt/docker/
  docker build -t apache2 .
  ```
  > *Builds a new Docker image named `apache2` using the Dockerfile in the current directory.*

**Step 4: Run the Docker container**
- Start a new container from the built image, mapping port 5000.
  ```
  docker run --name http -p 5000:5000 -d apache2
  ```
  > *Runs the container in detached mode, names it `http`, and maps host port 5000 to container port 5000.*

**Step 5: Validate the container and Apache service**
- Check that the container is running and Apache is serving on port 5000.
  ```
  docker ps
  curl -Ik http://localhost:5000
  ```
  > *Verifies the container is running and Apache is accessible on the specified port.*

**Step 6: Complete the task**
- Click on confirm to complete the task