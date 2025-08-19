# Question
The Nautilus application development team is planning to deploy a new application on Nautilus infra in Stratos DC, which requires a PostgreSQL database. Set up the PostgreSQL database server as per the requirements below:

**a. Create a database user `kodekloud_gem` and set its password to `8FmzjvFU6S`.**
**b. Create a database `kodekloud_db8` and grant full permissions to user `kodekloud_gem` on this database.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: SSH into the Database Server**
- Connect to the database server using SSH.
  ```
  ssh peter@stdb01
  ```
  > *Establishes a secure shell session to the database server as user peter.*

**Step 2: Switch to the postgres system user**
- Change to the postgres user to manage the database.
  ```
  sudo su - postgres
  ```
  > *Switches to the postgres system user, which is required for database administration.*

**Step 3: Access the PostgreSQL interactive shell**
- Open the PostgreSQL command-line interface.
  ```
  psql
  ```
  > *Starts the PostgreSQL shell to run SQL statements.*

**Step 4: Create the database user and set password**
- Create the user and assign the required password.
  ```
  CREATE USER kodekloud_gem WITH PASSWORD '8FmzjvFU6S';
  ```
  > *Creates a new PostgreSQL user with the specified password.*

**Step 5: Create the database**
- Create the required database.
  ```
  CREATE DATABASE kodekloud_db8;
  ```
  > *Creates a new database for the application.*

**Step 6: Grant privileges to the user on the database**
- Give full access to the user on the new database.
  ```
  GRANT ALL PRIVILEGES ON DATABASE kodekloud_db8 TO kodekloud_gem;
  ```
  > *Grants all privileges on the database to the user, allowing full control.*

**Step 7: Exit PostgreSQL and the postgres user**
- Exit the shell and return to your normal user.
  ```
  \q
  exit
  ```
  > *Leaves the PostgreSQL shell and logs out from the postgres user.*

**Step 8: Complete the task**
- The PostgreSQL environment is now set up as required. No need to restart the PostgreSQL service.
