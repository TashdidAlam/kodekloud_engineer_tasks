# Question
The Nautilus Application development team recently finished development of one of the apps that they want to deploy on a containerized platform. The Nautilus Application development and DevOps teams met to discuss some of the basic pre-requisites and requirements to complete the deployment. The team wants to test the deployment on one of the app servers before going live and set up a complete containerized stack using a docker compose file. Below are the details of the task:

**On App Server 1 in Stratos Datacenter, create a docker compose file `/opt/finance/docker-compose.yml` (should be named exactly).**

**The compose should deploy two services (web and DB), and each service should deploy a container as per details below:**

**For web service:**
- Container name must be `php_web`.
- Use image `php` with any `apache` tag.
- Map `php_web` container's port 80 with host port 3001.
- Map `php_web` container's `/var/www/html` volume with host volume `/var/www/html`.

**For DB service:**
- Container name must be `mysql_web`.
- Use image `mariadb` with any tag (preferably latest).
- Map `mysql_web` container's port 3306 with host port 3306.
- Map `mysql_web` container's `/var/lib/mysql` volume with host volume `/var/lib/mysql`.
- Set `MYSQL_DATABASE=database_web` and use any custom user (except root) with some complex password for DB connections.

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into App Server 1 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh tony@stapp01
  sudo su
  ```
  > *Establishes a secure shell session to App Server 1 as user tony, then switches to root for administrative access.*

**Step 2: Create the target directory for the compose file**
- Ensure the directory exists for storing the docker compose file.
  ```
  mkdir -p /opt/finance
  cd /opt/finance
  ```
  > *Creates and navigates to the directory where the compose file will be placed.*

**Step 3: Create and edit the docker compose file**
- Create and open the compose file for editing.
  ```
  sudo vi /opt/finance/docker-compose.yml
  ```
  Add the following content:
  ```yaml
  version: "3.9"
  services:
    web:
      image: php:apache
      container_name: php_web
      ports:
        - "3001:80"
      volumes:
        - /var/www/html:/var/www/html
      depends_on:
        - db

    db:
      image: mariadb:latest
      container_name: mysql_web
      ports:
        - "3306:3306"
      volumes:
        - /var/lib/mysql:/var/lib/mysql
      environment:
        MYSQL_DATABASE: database_web
        MYSQL_USER: app_user
        MYSQL_PASSWORD: ComplexP@ssw0rd!
        MYSQL_ROOT_PASSWORD: RootTempPass123
  ```
  > *Defines the web and db services, sets up images, container names, port and volume mappings, and environment variables for the database.*

**Step 4: Bring the stack up using Docker Compose**
- Start the containers as defined in the compose file.
  ```
  cd /opt/finance
  sudo docker compose up -d
  ```
  > *Brings up the stack in detached mode, running both containers in the background.*

**Step 5: Verify running containers**
- List running containers to confirm both are up and mapped to the correct ports.
  ```
  docker ps
  ```
  > *Shows that `php_web` is running on port 3001 and `mysql_web` is running on port 3306.*

**Step 6: Test the app**
- Use curl to access the web service and confirm it is running.
  ```
  curl http://localhost:3001/
  ```
  > *Confirms that the PHP Apache container is serving content on port 3001.*

**Step 7: Complete the task**
- Click on confirm to complete the task.