# Question
There is a requirement to create a Jenkins job to automate the database backup. Below you can find more details to accomplish this task:



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


Create a Jenkins job named database-backup.


Configure it to take a database dump of the kodekloud_db01 database present on the Database server in Stratos Datacenter, the database user is kodekloud_roy and password is asdfgdsd.


The dump should be named in db_$(date +%F).sql format, where date +%F is the current date.

Copy the db_$(date +%F).sql dump to the Backup Server under location /home/clint/db_backups.


Further, schedule this job to run periodically at */10 * * * * (please use this exact schedule format).


Note:


You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case please make sure to refresh the UI page.


Please make sure to define you cron expression like this */10 * * * * (this is just an example to run job every 10 minutes).


For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.


### Automated Database Backup Task Steps

#### I. Jenkins Preparation and Configuration

1.  **Access Jenkins UI and Log In:** Access the Jenkins UI and log in using the username `admin` and password `Adm!n321`.
2.  **Install SSH Plugin:** Go to **Manage Jenkins**, then **Manage Plugins**. Search for and install the **SSH plugin** (under available plugins).
3.  **Restart Jenkins:** If prompted after plugin installation, restart Jenkins. Note that you may need to refresh the UI page if it gets stuck during the restart.
4.  **Store DB Server Credentials (for Jenkins connection):** Go to **Manage Jenkins** -> **Credentials** -> **System** -> **Global credentials** -> **Add Credentials**. Store the credentials required for Jenkins to establish an SSH connection to the DB server. (In the video setup, the username used was 'Peter').
5.  **Configure SSH Site (Jenkins to DB Server):** Go to **Manage Jenkins** -> **Configure System**. Scroll down and add an SSH site.
    *   Provide the host name (`stdb01`).
    *   Set the port to `22`.
    *   Select the credential previously saved for the DB server connection.
    *   Check the connection successfully, and then save the configuration.

#### II. SSH Passwordless Authentication Setup (DB Server to Backup Server)

This step ensures the DB server can copy the dump file to the Backup Server (`stbkp01`) without requiring a password during job execution.

1.  **Connect to DB Server:** Connect to the DB server (`stdb01`) using the appropriate user (e.g., Peter, or the user that Jenkins connects as).
2.  **Generate SSH Keys:** Run the following command on the DB server console to generate public and private keys under the `.ssh` directory:
    `ssh-keygen -t rsa`
3.  **Copy SSH ID to Backup Server:** Run the following command on the DB server to copy the public key to the Backup Server (`stbkp01`) for the user `clint`. You will need to provide the password for `clint` on the Backup Server during this process:
    `ssh-copy-id clint@stbkp01`

#### III. Jenkins Job Creation and Configuration

1.  **Create Jenkins Job:** Click on **Create Job** and name the job `database-backup`. Select "Freestyle project".
2.  **Configure Build Environment:** Under the job configuration, use the "Execute shell script on remote host using SSH" build step.

3.  **Step 1: Execute Database Dump (Shell Command)**
    The first shell script command takes the dump of the `kodekloud_db01` database, using user `kodekloud_roy` and password `asdfgdsd`, and saves it with the current date in the filename format `db_YYYY-MM-DD.sql`.

    **Shell Script Command 1 (Database Dump):**
    ```sh
    mysqldump -u kodekloud_roy -pasdfgdsd kodekloud_db01 > db_$(date +%F).sql
    ```
    *Note: When entering the password after the `-p` option, there should be no space.*

4.  **Step 2: Copy Dump to Backup Server (Shell Command)**
    The second shell script command copies the newly created dump file to the Backup Server (`stbkp01`) under the specified directory `/home/clint/db_backups/`. The option `-o StrictHostKeyChecking=no` is used to skip the verification prompt for fingerprints during the first connection.

    **Shell Script Command 2 (Secure Copy):**
    ```sh
    scp -o StrictHostKeyChecking=no db_$(date +%F).sql clint@stbkp01:/home/clint/db_backups/
    ```

5.  **Schedule the Job:** Configure the job to run periodically. Under the **Build Periodically** section, paste the exact cron expression:
    `*/10 * * * *` (This schedules the job to run every 10 minutes).

6.  **Apply and Save:** Click **Apply** and then **Save** to finalize the job configuration.

7.  **Run the Job:** Run the job manually once to verify that the backup file is created successfully on the DB server and then successfully copied to the Backup Server location `/home/clint/db_backups`.

