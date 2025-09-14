# Question
The Nautilus DevOps team is working to create new images per requirements shared by the development team. One of the team members is working to create a Dockerfile on App Server 2 in Stratos DC. While working on it, she ran into issues where the docker build is failing and displaying errors. Look into the issue and fix it to build an image as per details mentioned below:

**a. The Dockerfile is placed on App Server 2 under /opt/docker directory.**
**b. Fix the issues with this file and make sure it is able to build the image.**
**c. Do not change base image, any other valid configuration within Dockerfile, or any of the data being used — for example, index.html.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into App Server 2 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh steve@stapp02
  sudo su
  ```
  > *Establishes a secure shell session to App Server 2 as user steve, then switches to root for administrative access.*

**Step 2: Navigate to the Dockerfile directory**
- Change to the directory containing the Dockerfile.
  ```
  cd /opt/docker
  ```
  > *Ensures you are in the correct location to view and edit the Dockerfile.*

**Step 3: Review and edit the Dockerfile to fix issues**
- Open the Dockerfile and update the file paths in the sed commands as needed.
  ```
  vi Dockerfile
  ```
  Update the file so it looks like this:
  ```Dockerfile
  FROM httpd:2.4.43
  RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf
  RUN sed -i '/LoadModule\\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf
  RUN sed -i '/LoadModule\\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf
  RUN sed -i '/Include\\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf
  COPY certs/server.crt /usr/local/apache2/conf/server.crt
  COPY certs/server.key /usr/local/apache2/conf/server.key
  COPY html/index.html /usr/local/apache2/htdocs/
  ```
  > *Corrects the file paths in the sed commands to reference the correct configuration file, ensuring the Docker build will succeed.*

**Step 4: Build the Docker image**
- Run the docker build command to create the image.
  ```
  docker build -t image .
  ```
  > *Builds a new Docker image named `image` using the corrected Dockerfile in the current directory.*

**Step 5: Complete the task**
- Click confirm to finish the task