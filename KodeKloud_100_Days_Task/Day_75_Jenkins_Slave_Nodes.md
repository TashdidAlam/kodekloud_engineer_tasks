# Question
 The Nautilus DevOps team has installed and configured new Jenkins server in Stratos DC which they will use for CI/CD and for some automation tasks. There is a requirement to add all app servers as slave nodes in Jenkins so that they can perform tasks on these servers using Jenkins. Find below more details and accomplish the task accordingly.

Click on the + button in the top left corner and select option Select port to view on Host 1, enter port 8081 and click on Display Port. You should be able to access the Jenkins login page. Login using username theadmin and Adm!n321 password.

Add all app servers as SSH build agent/slave nodes in Jenkins. Slave node name for app server 1, app server 2 and app server 3 must be App_server_1, App_server_2, App_server_3 respectively.

Add labels as below

App_server_1 : stapp01

App_server_2 : stapp02

App_server_3 : stapp03

Remote root directory for App_server_1 must be /home/tony/jenkins, for App_server_2 must be /home/steve/jenkins and for App_server_3 must be /home/banner/jenkins.

Make sure slave nodes are online and working properly.

Note:

You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.

For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

This comprehensive, step-by-step guide draws directly from the provided task requirements and the instructional video sources detailing the process of configuring the three application servers as SSH build agents (slave nodes) in Jenkins.

***

## Step-by-Step Guide: Configuring Jenkins Slave Nodes

### Phase 1: Access, Plugins, and Credentials

#### Step 1: Access the Jenkins Server

1.  Access the Jenkins login page by clicking the `+` button, selecting **Select port to view on Host 1**, and entering port **8081**.
2.  Log in using the provided credentials:
    *   Username: `admin`
    *   Password: `Adm!n321`

#### Step 2: Install the SSH Build Agents Plugin

Jenkins needs the SSH plugin to connect to the Linux app servers.

1.  Click on **Manage Jenkins**.
2.  Click on **Manage Plugins**.
3.  Click on **Available Plugins**.
4.  Search for **SSH** and locate the **SSH build agents** plugin.
5.  Click **Download now and install**.
6.  Check the box to restart Jenkins after installation is complete.
    *   *Note:* If the Jenkins UI gets stuck during the restart, refresh the page.

#### Step 3: Configure User Credentials

You need to configure the credentials for the users on the three app servers (Tony, Steve, and Banner).

1.  Click on **Manage Jenkins**.
2.  Click on **Credentials**.
3.  Click **Add credentials**. Ensure the kind is set to **Username with password**.
4.  Configure Credentials for **App Server 1**:
    *   Username: `Tony`.
    *   Password: (Paste the password).
    *   ID/Description: Identify it (e.g., `app server one`).
5.  Configure Credentials for **App Server 2**:
    *   Username: `Steve`.
    *   Password: (Paste the password).
    *   ID/Description: Identify it (e.g., `app server two`).
6.  Configure Credentials for **App Server 3**:
    *   Username: `Banner`.
    *   Password: (Paste the password).
    *   ID/Description: Identify it (e.g., `app server three`).

### Phase 2: Configuring and Launching Nodes

#### Step 4: Configure Node 1 (`App_server_1`)

1.  Go back to **Manage Jenkins**.
2.  Click on **Manage Nodes and Clouds**.
3.  Click **New Node**.
4.  Set the Node Name exactly as required: **`App_server_1`**.
5.  Select **Permanent Agent** and click **Create**.
6.  Configure the node settings based on requirements:
    *   **Label:** `stapp01`. (These labels are used when configuring Jenkins jobs to specify where they run).
    *   **Remote root directory:** `/home/tony/jenkins`.
    *   **Launch method:** Select **Launch agent by connecting it to the controller** (or **Launch via agents yssh**).
    *   **Host:** `stapp01`.
    *   **Credentials:** Select the Tony credentials.
    *   **Host Key Verification Strategy:** Select **Non-verifying verification strategy**. (This avoids the need to manually enter 'yes' when connecting for the first time).
7.  Click **Save**.

#### Step 5: Configure Node 2 (`App_server_2`)

1.  Click **New Node**.
2.  Set the Node Name: **`App_server_2`**.
3.  Select **Permanent Agent** and click **Create**.
4.  Configure the node settings:
    *   **Label:** `stapp02`.
    *   **Remote root directory:** `/home/steve/jenkins`.
    *   **Launch method:** Launch via SSH.
    *   **Host:** `stapp02`.
    *   **Credentials:** Select the Steve credentials.
    *   **Host Key Verification Strategy:** Non-verifying verification strategy.
5.  Click **Save**.

#### Step 6: Configure Node 3 (`App_server_3`)

1.  Click **New Node**.
2.  Set the Node Name: **`App_server_3`**.
3.  Select **Permanent Agent** and click **Create**.
4.  Configure the node settings:
    *   **Label:** `stapp03`.
    *   **Remote root directory:** `/home/banner/jenkins`.
    *   **Launch method:** Launch via SSH.
    *   **Host:** `stapp03` (or `str03` as mentioned in source, but matching pattern `stapp03` is intended based on prior steps).
    *   **Credentials:** Select the Banner credentials.
    *   **Host Key Verification Strategy:** Non-verifying verification strategy.
5.  Click **Save**.

### Phase 3: Installing Java and Bringing Nodes Online

If you try to launch the agent without Java installed, it will fail due to a "Java version issue" or "command not function" error. Java must be installed on the Linux app servers for them to function as Jenkins nodes.

#### Step 7: Install Java on App Server 1

1.  Connect to **App Server 1** via SSH (using the Tony user).
2.  Check for Java: Use `java -version` to confirm if Java is missing.
3.  Install Java (e.g., by searching for and installing OpenJDK development environment via `yum install` commands).
4.  Once Java is installed, return to the Jenkins UI, click on **App_server_1**, and click **Launch Agent**.
5.  Verify that the agent successfully connected and is **online**.

#### Step 8: Install Java on App Server 2

1.  Connect to **App Server 2** via SSH (using the Steve user).
2.  Install Java on this server using the appropriate package manager command (e.g., `yum install java` or similar).
3.  Return to the Jenkins UI, click on **App_server_2**, and click **Launch Agent**.
4.  Verify that the agent successfully connected and is **online**.

#### Step 9: Install Java on App Server 3

1.  Connect to **App Server 3** via SSH (using the Banner user).
2.  Install Java on this server.
3.  Return to the Jenkins UI, click on **App_server_3**, and click **Launch Agent**.
4.  Verify that the agent successfully connected and is **online**.

Once all three slave nodes are connected and online, the task is complete. If a node is down, a cross symbol will appear on its icon.