# Question
The Nautilus application development team shared static website content that needs to be hosted on the httpd web server using a containerized platform. The team has shared details with the DevOps team, and we need to set up an environment according to those guidelines. Below are the details:

**a. On App Server 1 in Stratos DC, create a container named `httpd` using a docker compose file `/opt/docker/docker-compose.yml` (please use the exact name for the file).**
**b. Use `httpd` (preferably latest tag) image for the container and make sure the container is named as `httpd`; you can use any name for the service.**
**c. Map port 80 of the container with port 8082 of the docker host.**
**d. Map container's `/usr/local/apache2/htdocs` volume with `/opt/dba` volume of the docker host which is already there. (Please do not modify any data within these locations).**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into App Server 1 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh tony@stapp01
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 1 as user tony, then switches to root for administrative access.*

**Step 2: Ensure the target directory exists**
- Create the directory for the Docker Compose file if it doesn't already exist.
  ```
  sudo mkdir -p /opt/docker
  ```
  > *Ensures the directory structure is in place for storing the Compose file.*

**Step 3: Create the Docker Compose file**
- Create and edit the Compose file with the required configuration.
  ```
  sudo vi /opt/docker/docker-compose.yml
  ```
  Add the following content:
  ```yaml
  version: "3.9"
  services:
    webapp:
      image: httpd:latest
      container_name: httpd
      ports:
        - "8082:80"
      volumes:
        - /opt/dba:/usr/local/apache2/htdocs
  ```
  > *Defines a service using the latest httpd image, names the container `httpd`, maps host port 8082 to container port 80, and mounts the required volume.*

**Step 4: Start the container using Docker Compose**
- Change to the directory and bring up the service in detached mode.
  ```
  cd /opt/docker
  sudo docker compose up -d
  ```
  > *Starts the container as defined in the Compose file, running in the background.*

**Step 5: Verify the setup**
- Check that the container is running and the port mapping is correct.
  ```
  docker ps
  ```
  > *Lists running containers and confirms the `httpd` container is up with the correct port mapping.*

- (Optional) Check logs if needed:
  ```
  docker logs httpd
  ```
  > *Displays the logs for the `httpd` container for troubleshooting.*

**Step 6: Test access to the web server**
- Use curl or a browser to access the static content.
  ```
  curl http://localhost:8082
  ```
  > *Confirms that the static content from `/opt/dba` is being served by the httpd container on port 8082.*

**Step 7: Complete the task**
- Click on confirm to complete the task.