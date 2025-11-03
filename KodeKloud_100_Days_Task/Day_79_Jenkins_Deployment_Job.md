# Question
The Nautilus development team had a meeting with the DevOps team where they discussed automating the deployment of one of their apps using Jenkins (the one in Stratos Datacenter). They want to auto deploy the new changes in case any developer pushes to the repository. As per the requirements mentioned below configure the required Jenkins job.



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and Adm!n321 password.


Similarly, you can access the Gitea UI using Gitea button, username and password for Git is sarah and Sarah_pass123 respectively. Under user sarah you will find a repository named web that is already cloned on the Storage server under sarah's home. sarah is a developer who is working on this repository.


1. Install httpd (whatever version is available in the yum repo by default) and configure it to serve on port 8080 on All app servers. You can make it part of your Jenkins job or you can do this step manually on all app servers.


2. Create a Jenkins job named nautilus-app-deployment and configure it in a way so that if anyone pushes any new change to the origin repository in master branch, the job should auto build and deploy the latest code on the Storage server under /var/www/html directory. Since /var/www/html on Storage server is shared among all apps.
Before deployment, ensure that the ownership of the /var/www/html directory is set to user sarah, so that Jenkins can successfully deploy files to that directory.


3. SSH into Storage Server using sarah user credentials mentioned above. Under sarah user's home you will find a cloned Git repository named web. Under this repository there is an index.html file, update its content to Welcome to the xFusionCorp Industries, then push the changes to the origin into master branch. This push must trigger your Jenkins job and the latest changes must be deployed on the servers, also make sure it deploys the entire repository content not only index.html file.


Click on the App button on the top bar to access the app, you should be able to see the latest changes you deployed. Please make sure the required content is loading on the main URL https://<LBR-URL> i.e there should not be any sub-directory like https://<LBR-URL>/web etc.


Note:
1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also some times Jenkins UI gets stuck when Jenkins service restarts in the back end so in such case please make sure to refresh the UI page.


2. Make sure Jenkins job passes even on repetitive runs as validation may try to build the job multiple times.


3. Deployment related tasks should be done by sudo user on the destination server to avoid any permission issues so make sure to configure your Jenkins job accordingly.


4. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

This is a step-by-step guide for completing the application deployment task, drawing on the requirements specified in the excerpts and the operational methods demonstrated in the video transcript.


---

## Step-by-Step Deployment Guide

### Phase 1: Initial Setup and Application Server Configuration

1.  **Access UIs:** Access the Jenkins UI using username `admin` and password `Adm!n321`. Access the Gitea UI using username `sarah` and password `Sarah_pass123`.
2.  **Install HTTPD on App Servers:** Install the default version of `httpd` available via `yum` repository on **All app servers**.
3.  **Configure HTTPD Port:** Change the default listening port for `httpd` from 80 to **8080** on all app servers.
    *   This can be done by using a command like `sed` to replace `Listen 80` with `Listen 8080` in the `httpd` configuration file.
4.  **Restart HTTPD:** Restart the `httpd` service on all app servers to apply the port change.

### Phase 2: Configuring SSH Access for Jenkins (Passwordless Deployment)

The deployment requires Jenkins to copy files to the remote Storage server, which is best achieved using passwordless SSH/SCP.

5.  **Generate SSH Keys on Jenkins:** Log into the Jenkins server and generate an SSH key pair (e.g., `ssh-keygen -t rsa`).
6.  **Copy Public Key:** Retrieve the generated public key (`id_rsa.pub`).
7.  **Configure Storage Server for Passwordless Access:**
    *   SSH into the Storage server using the intended deployment user (The video uses `Natasha`, but for the deployment to function smoothly with ownership changes mentioned later, ensure this user has the necessary permissions, potentially via `sudo` rights, as suggested in the sources).
    *   Create the `.ssh` directory if it does not exist.
    *   Create or edit the `authorized_keys` file inside the `.ssh` directory.
    *   Paste the public key copied from the Jenkins server into the `authorized_keys` file. This establishes key-based authentication, allowing Jenkins to connect without a password.

8.  **Adjust Deployment Directory Ownership:** On the Storage server, ensure the destination directory, **/var/www/html**, has its ownership set to user **`natasha`**.
    *   The command would typically be similar to `chown -R natasha /var/www/html`. .

### Phase 3: Creating and Configuring the Jenkins Job

9.  **Create Jenkins Job:** In the Jenkins UI, create a new item (job) and name it **`nautilus-app-deployment`**.
10. **Configure Source Code Management (SCM):**
    *   Select Git as the SCM.
    *   Enter the URL for the `web` repository from Gitea.
    *   Set the branch specifier to `master`.
11. **Configure Build Trigger:**
    *   Select **Poll SCM** as the build trigger.
    *   Configure a schedule (e.g., `* * * * *` for polling every minute) so that the job detects any new push to the `master` branch and triggers an auto-build.

12. **Configure Build Step (Deployment):**
    *   Add a build step (e.g., "Execute shell") to perform the deployment.
    *   Use the **SCP command** to copy the repository content from the Jenkins workspace to the Storage server's deployment location. Ensure the entire repository content is copied, not just `index.html`.
    *   The command should copy the contents of the current workspace directory (`*`) to the target location `/var/www/html`.
    *   *Example SCP Command:* `scp -r * natasha@ststor01:/var/www/html`. (Ensure the `natasha` is the one configured for passwordless SSH in Step 7).
13. **Save Configuration:** Save the Jenkins job. Ensure the job is configured to pass even on repetitive runs.

### Phase 4: Testing the Auto-Deployment

14. **Access Repository:** SSH into the Storage server using the user **`sarah`**. The cloned Git repository named `web` should be available under `sarah`'s home directory.
15. **Update Content:** Navigate to the `web` repository and modify the content of the `index.html` file.
    *   Update the content to: **`Welcome to the xFusionCorp Industries`**.
16. **Commit and Push Changes:**
    *   Commit the updated file (`git commit -am "message"`).
    *   Push the changes to the `origin master` branch (`git push origin master`), using `sarah` and `Sarah_pass123` credentials if prompted.
17. **Verify Auto-Trigger:** Wait for the Jenkins job (`nautilus-app-deployment`) to detect the push via Poll SCM and automatically trigger a new build.
18. **Verify Deployment:** Once the Jenkins job completes successfully, click on the App button to access the application. You should see the latest updated content (**`Welcome to the xFusionCorp Industries`**) loading directly from the main URL (without any sub-directory like `/web`).

***
