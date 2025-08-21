# Question
xFusionCorp Industries is planning to host a WordPress website on their infra in Stratos Datacenter. The infrastructure is configured with a shared directory mounted on each app host. Complete the following steps to set up the LAMP stack and database:

**a. Install httpd, php, and dependencies on all app hosts.**
**b. Configure Apache to serve on port 5000.**
**c. Install and configure MariaDB server on the DB Server.**
**d. Create a database named `kodekloud_db7` and a user `kodekloud_pop` with password `YchZHRcLkL`, granting full permissions.**
**e. Verify the website can connect to the database using the created user.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Install Apache and PHP on all app servers**
- SSH into each app server and install required packages.
  ```
  ssh tony@stapp01
  sudo yum install httpd -y
  sudo yum install php php-mysqlnd php-pdo php-gd php-mbstring -y
  ```
  > *Installs Apache web server and PHP with necessary extensions for WordPress.*

**Step 2: Configure Apache to listen on port 5000**
- Edit the Apache configuration to change the listening port.
  ```
  sudo vi /etc/httpd/conf/httpd.conf
  ```
  > *Change `Listen 80` to `Listen 5000`. Also update any `<VirtualHost>` sections to `*:5000` if present.*

**Step 3: Enable and start Apache**
- Make sure Apache starts on boot and is running.
  ```
  sudo systemctl enable httpd
  sudo systemctl start httpd
  sudo ss -tulpn | grep httpd
  ```
  > *Enables and starts Apache, then verifies it is listening on port 5000.*

**Note:** Steps 1-3 should be performed on all app servers (e.g., stapp01, stapp02, stapp03) to ensure the LAMP stack is properly configured across the infrastructure.

**Step 4: Install and start MariaDB on the DB Server**
- SSH into the DB server and install MariaDB.
  ```
  ssh peter@stdb01
  sudo yum install -y mariadb-server
  sudo systemctl enable mariadb
  sudo systemctl start mariadb
  ```
  > *Installs and starts the MariaDB database server.*

**Step 5: Create the database and user, and grant permissions**
- Access MariaDB and set up the database and user.
  ```
  mysql -u root
  CREATE DATABASE kodekloud_db7;
  CREATE USER 'kodekloud_pop'@'%' IDENTIFIED BY 'YchZHRcLkL';
  GRANT ALL PRIVILEGES ON kodekloud_db7.* TO 'kodekloud_pop'@'%';
  FLUSH PRIVILEGES;
  ```
  > *Creates the database and user, grants all privileges, and allows remote connections from app servers.*

**Step 6: Verify connectivity from the website**
- Access the website via the LBR link or App button and check for the message:
  > *App is able to connect to the database using user kodekloud_pop.*

**Step 7: Complete the task**
- Click on confirm to complete the task