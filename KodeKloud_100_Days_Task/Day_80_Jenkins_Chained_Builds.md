# Question
The DevOps team was looking for a solution where they want to restart Apache service on all app servers if the deployment goes fine on these servers in Stratos Datacenter. After having a discussion, they came up with a solution to use Jenkins chained builds so that they can use a downstream job for services which should only be triggered by the deployment job. So as per the requirements mentioned below configure the required Jenkins jobs.



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and Adm!n321 password.


Similarly you can access Gitea UI on port 8090 and username and password for Git is sarah and Sarah_pass123 respectively. Under user sarah you will find a repository named web.


Apache is already installed and configured on all app server so no changes are needed there. The doc root /var/www/html on all these app servers is shared among the Storage server under /var/www/html directory.


1. Create a Jenkins job named nautilus-app-deployment and configure it to pull change from the master branch of web repository on Storage server under /var/www/html directory, which is already a local git repository tracking the origin web repository. Since /var/www/html on Storage server is a shared volume so changes should auto reflect on all apps.


2. Create another Jenkins job named manage-services and make it a downstream job for nautilus-app-deployment job. Things to take care about this job are:


a. This job should restart httpd service on all app servers.

b. Trigger this job only if the upstream job i.e nautilus-app-deployment is stable.


LB server is already configured. Click on the App button on the top bar to access the app. You should be able to see the latest changes you made. Please make sure the required content is loading on the main URL https://<LBR-URL> i.e there should not be a sub-directory like https://<LBR-URL>/web etc.


Note:


1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also some times Jenkins UI gets stuck when Jenkins service restarts in the back end so in such case please make sure to refresh the UI page.


2. Make sure Jenkins job passes even on repetitive runs as validation may try to build the job multiple times.


3. Deployment related tasks should be done by sudo user on the destination server to avoid any permission issues so make sure to configure your Jenkins job accordingly.


4. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

### The step-by-step procedure for configuring the Jenkins chained builds

### Prerequisites: Server Access and Jenkins Credentials

1.  **Configure User Access (e.g., `natasha`):** Access was established for various servers (Storage Server, Server 3, Steel, Ban). The user logged into servers and set up SSH access by copying public keys. The user `natasha` was configured to be able to run commands (implying `sudo` capabilities, which is necessary for deployment tasks).
2.  **Add SSH Credentials to Jenkins:**
    *   In Jenkins, the user navigated to Manage Jenkins and created new credentials.
    *   The credential type chosen was **SSH Username with Private Key**.
    *   The **Username** was set as `natasha`.
    *   The **Private Key** associated with `natasha` was added.

### Step 1: Creating the Upstream Deployment Job (`nautilus-app-deployment`)

A Jenkins job was created (referred to as `cho` in the source fragments). This job corresponds to the required `nautilus-app-deployment`.

1.  **Configure Job Details:** The job was configured to use the newly created SSH access credential (the `natasha` account).
2.  **Configure Deployment Script:** The job included a build step to execute shell commands to pull changes from the Git repository (the `web` repository).
    *   The script involved entering the document root directory (e.g., `CD Wလုံးထဲက HM`).
    *   The Git commands included checking out the master branch (`checkout master`) and pulling from the origin (`origin`). The goal was to pull changes onto the Storage server under `/var/www/html`.
    *   Since permissions issues were encountered during testing, the commands were prefixed with **`su do`** (sudo) to ensure proper execution by the designated user.

### Step 2: Creating the Downstream Service Job (`manage-services`)

A second Jenkins item was created, named `manage-services` (referred to as `man-di-bey` in the source fragments).

1.  **Configure Job Details:** This job was also configured to use the SSH private key credential.
2.  **Configure Service Restart Script:** The job's shell execution commands were configured to restart the `httpd` service on the application servers [10a]. The source mentions running the command on app servers (like Server 3).
    *   The command structure was generally: run `systemctl restart httpd` using `sudo` on the application servers [6, 10a].

### Step 3: Chaining the Builds

The two jobs were linked to create a chained build process.

1.  **Configure Upstream Job Trigger:** In the configuration of the upstream job (`nautilus-app-deployment`), a post-build action was added.
2.  **Set Downstream Project:** This action was set to trigger the downstream project, which was the `manage-services` job.
3.  **Define Trigger Condition:** Crucially, the downstream job was configured to **only run if the upstream job is stable** [6, 10b].

### Step 4: Execution and Verification

1.  **Trigger Deployment:** The primary job (`nautilus-app-deployment`) was run/built.
2.  **Confirm Chaining:** After the deployment job finished successfully, the downstream job (`manage-services`) was triggered automatically.
3.  **Verify Service Restart:** The console output of the `manage-services` job confirmed that the service restart command (`system httb`) was executed successfully.
4.  **Final Verification:** The user verified the outcome by checking the application URL, confirming that the deployed content ("Welcome to Cloud") was loading correctly.