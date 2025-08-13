# Question
There is a critical issue with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After investigation, it was found that the MariaDB service is down on the database server.

**Troubleshoot and resolve the MariaDB service issue on the database server so the application can connect successfully.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to the database server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh peter@stdb01
  sudo su -
  ```
  > *Establishes a secure shell session to the database server as user peter, then switches to root for administrative access.*

**Step 2: Check the status of the MariaDB service**
- View the current status and attempt to start the service.
  ```
  systemctl status mariadb
  systemctl start mariadb
  ```
  > *Checks if MariaDB is running and tries to start it. If it fails, proceed to the next step for troubleshooting.*

**Step 3: Get detailed error information**
- Use the `-l` flag to see full error logs.
  ```
  systemctl status mariadb -l
  ```
  > *Displays detailed logs to help identify the root cause of the failure. Look for errors related to the database directory.*

**Step 4: Check the MySQL directory and its ownership**
- List the contents and check ownership/group of the relevant directories.
  ```
  ls -ltr /var/lib/
  ```
  > *Verifies the existence and ownership of the MySQL data directory. The correct directory should be `/var/lib/mysql` owned by `mysql:mysql`.*

**Step 5: Rename the directory if needed**
- If you find `/var/lib/mysqld` instead of `/var/lib/mysql`, rename it.
  ```
  mv /var/lib/mysqld/ /var/lib/mysql
  ls -ltr /var/lib/
  ```
  > *Renames the directory to the expected name so MariaDB can start properly. Re-list to confirm the change.*

**Step 6: Start and verify the MariaDB service**
- Start the service and check its status.
  ```
  systemctl start mariadb
  systemctl status mariadb
  ```
  > *Starts MariaDB and verifies that it is running without errors.*

**Step 7: Complete the task**
- Confirm that the application can now connect to the database and the service is running.