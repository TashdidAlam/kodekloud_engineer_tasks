# Question
The devops team of xFusionCorp Industries is working on to setup centralised logging management system to maintain and analyse server logs easily. Since it will take some time to implement, they wanted to gather some server logs on a regular basis. At least one of the app servers is having issues with the Apache server. The team needs Apache logs so that they can identify and troubleshoot the issues easily if they arise. So they decided to create a Jenkins job to collect logs from the server. Please create/configure a Jenkins job as per details mentioned below:



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321

1. Create a Jenkins jobs named copy-logs.

2. Configure it to periodically build every 10 minutes to copy the Apache logs (both access_log and error_logs) from App Server 1 (from default logs location) to location /usr/src/finance on Storage Server.

Note:

1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case please make sure to refresh the UI page.

2. Please make sure to define you cron expression like this */10 * * * * (this is just an example to run job every 10 minutes).

3. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

The video and associated task description outline the necessary steps to configure a scheduled Jenkins job to collect Apache logs from an application server and copy them to a storage server.

Here are the detailed steps to complete the task, drawing upon the requirements specified in the sources:

### Phase 1: Access and SSH Preparation

1.  **Access Jenkins UI and Log In:** Access the Jenkins UI and log in using the username `admin` and the password `Adm!n321`.
2.  **Identify Log Paths:** Confirm the location of the Apache logs on App Server 1. Apache logs (both `access_log` and `error_logs`) are typically stored under the default logs location, which is shown in the video to be `/var/log/httpd/`.
3.  **Establish Passwordless SSH (App Server 1 to Storage Server):** Since the job will execute a copy command (SCP) from App Server 1 to the Storage Server, **passwordless authentication** must be set up between these two machines.
    *   Generate a key pair on the source server (App Server 1) by running `ssh-keygen`.
    *   Copy the generated public key (`id_rsa.pub`) to the Storage Server using the `ssh-copy-id` command or copying it manually, so that subsequent SSH/SCP commands do not require a password.

### Phase 2: Jenkins Configuration (Plugins, Credentials, and System Settings)

4.  **Install Necessary Plugins:** Navigate to the "Available plugins" section and install the required SSH plugin (e.g., SSH plugin or an equivalent that allows executing shell scripts on remote machines).
5.  **Restart Jenkins:** If prompted, restart the Jenkins service after plugin installation is complete. If the UI gets stuck during restart, manually refresh the page.
6.  **Configure Global Credentials:**
    *   Go to **Manage Jenkins** and then **Credentials** (System -> Global credentials).
    *   Add credentials for accessing **App Server 1** (e.g., using the username `Tony` and the corresponding password).
7.  **Configure SSH Server Settings:**
    *   Go to **Manage Jenkins** and **Configure System**.
    *   Configure the SSH settings for **App Server 1** (or the server where the copy command will originate). Specify the hostname (e.g., `stapp01`), port number (e.g., `22`), and use the configured credentials. Click "Check Connection" to ensure the connection is successful.

### Phase 3: Creating and Configuring the Jenkins Job

8.  **Create a New Jenkins Job:** Create a new Jenkins job and name it **`copy-logs`**.
9.  **Configure Periodic Building:**
    *   In the job configuration, check the **Build periodically** option.
    *   Define the cron expression to run the job **every 10 minutes**. The required cron expression format is `*/10 * * * *`.
10. **Add Build Step:** Add a build step to execute a command on the remote machine (App Server 1).
    *   Select **Execute shell script on remote machine**.
    *   Specify the remote host (e.g., App Server 1).
11. **Define the Log Copy Command (SCP):** Write the shell command to copy the Apache logs from App Server 1 to the Storage Server. The command uses SCP and should target the required log files (`access_log` and `error_log`).

    *   The source path for the logs is specified as `/var/log/httpd/*` (or similar location containing `access_log` and `error_log`).
    *   The destination path is required to be the location **/usr/src/finance** on the Storage Server.

    *Example SCP command structure:*
    ```bash
    scp /var/log/httpd/access_log /var/log/httpd/error_log username@StorageServer_Hostname:/usr/src/finance
    ```
    (Note: The specific username and Storage Server hostname would depend on the environment, but the destination path must be `/usr/src/finance`).

12. **Save and Execute:** Save the job configuration. The job will now execute periodically every 10 minutes, copying the Apache logs to the Storage Server. You may run the job manually once to verify that the files appear in the destination directory.