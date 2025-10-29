# Question
The development team of xFusionCorp Industries is working on to develop a new static website and they are planning to deploy the same on Nautilus App Servers using Jenkins pipeline. They have shared their requirements with the DevOps team and accordingly we need to create a Jenkins pipeline job. Please find below more details about the task:



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123. There under user sarah you will find a repository named web_app that is already cloned on Storage server under /var/www/html. sarah is a developer who is working on this repository.


Add a slave node named Storage Server. It should be labeled as ststor01 and its remote root directory should be /var/www/html.


We have already cloned repository on Storage Server under /var/www/html.


Apache is already installed on all app Servers its running on port 8080.


Create a Jenkins pipeline job named nautilus-webapp-job (it must not be a Multibranch pipeline) and configure it to:


Deploy the code from web_app repository under /var/www/html on Storage Server, as this location is already mounted to the document root /var/www/html of app servers. The pipeline should have a single stage named Deploy ( which is case sensitive ) to accomplish the deployment.

LB server is already configured. You should be able to see the latest changes you made by clicking on the App button. Please make sure the required content is loading on the main URL https://<LBR-URL> i.e there should not be a sub-directory like https://<LBR-URL>/web_app etc.


Note:


You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.


For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

Based on your query, the sources provided, and the task requirements, here is the comprehensive step-by-step guide (note) to configure Jenkins and complete the web application deployment task.

***

## Step-by-Step Guide: Jenkins Pipeline for Web App Deployment

This guide details the process of configuring the Jenkins environment, setting up the slave node, and creating the `nautilus-webapp-job` pipeline using the provided script for xFusionCorp Industries.

### I. Initial Setup and Plugin Installation

1.  **Access Jenkins:** Access the Jenkins UI using the provided credentials (**username `admin`** and **password `Adm!n321`**).
2.  **Install Plugins:** Navigate to Manage Jenkins > Plugins and install the necessary components, which typically include the **SSH build agents** plugin, **credentials plugin**, and **pipeline plugin**.
3.  **Restart Jenkins:** After plugin installation, ensure you restart Jenkins (if required by the prompt).

### II. Configure the Slave Node (Storage Server)

The Storage Server must be configured as a slave node to handle the job execution and deployment.

1.  **Storage Server Preparation (External Steps):**
    *   Ensure Java is installed on the Storage Server (e.g., installing `Java 17 OpenJDK`).
    *   The remote root directory is specified as **`/var/www/html`**.
    *   Change the ownership of the remote root directory (`/var/www/html`) recursively (e.g., using `chown -R natasha:group /var/www/html/`) so that the user used for the SSH connection owns it. The repository (`web_app`) is already cloned on the Storage Server in this location.

2.  **Create Jenkins Credentials:**
    *   Navigate to Manage Jenkins > Manage Credentials.
    *   Add credentials for connecting to the Storage Server (e.g., using **username `natasha`** and the corresponding password/key if following the procedure outlined in the video).

3.  **Create New Node:**
    *   Go to Manage Jenkins > Manage Nodes and Clouds.
    *   Click **New Node** and name it **`Storage Server`**.
    *   Configure the node settings:
        *   **Remote root directory:** **`/var/www/html`**.
        *   **Labels:** Use the label **`ststor01`**. (Note: This label is case sensitive and is required for the `agent` section of the pipeline script).
        *   **Launch method:** Select "Launch agent via SSH".
        *   Provide the Hostname (e.g., `str01` or the specific IP/hostname) and select the credentials created earlier.
        *   Select "Manually trusted key" if necessary, and launch the agent.
    *   Verify that the Storage Server node is successfully connected and online.

### III. Create the Jenkins Pipeline Job

The pipeline job must be named `nautilus-webapp-job` and configured as a standard pipeline.

1.  **Create Job:**
    *   Navigate back to the Jenkins dashboard.
    *   Click **New Item**.
    *   Name the job: **`nautilus-webapp-job`**.
    *   Select the **Pipeline** type (it must **not** be a Multibranch pipeline).

2.  **Configure Pipeline Script:**
    *   In the job configuration, scroll down to the Pipeline section.
    *   Select "Pipeline script" and paste the required deployment script.

**The required pipeline script for this task is:**

```groovy
pipeline {

agent {

label 'ststor01' // Uses the configured slave node

}

stages {

stage('Deploy') { // Stage name must be exactly 'Deploy' (case sensitive)

steps {

git branch: "master", // Checkout the master branch

url: "http://git.stratos.xfusioncorp.com/sarah/web_app.git"

sh "cp -r /var/www/html/workspace/nautilus-webapp-job/* /var/www/html/" // Copies files to the document root

}

}

}

}
```
*Key configuration points of the script:*
*   The `agent` section explicitly targets the node using the label **`ststor01`**.
*   There is a single stage named **`Deploy`**.
*   The `git` step checks out the code from the `web_app` repository.
*   The `sh` command copies the repository contents from the job's workspace (e.g., `/var/www/html/workspace/nautilus-webapp-job/`) to the actual deployment location on the Storage Server (`/var/www/html/`), ensuring the content loads directly on the main URL (without a sub-directory like `/web_app`).

### IV. Execute and Verify

1.  **Run the Job:** Save the configuration and run the `nautilus-webapp-job`.
2.  **Monitor:** Check the console output to ensure the connection to the `ststor01` agent is successful, the `master` branch is checked out, and the `cp` command executes correctly.
3.  **Verification:** After a successful build, verify that the required content is loading correctly on the main URL by clicking the **App button**. The content deployed should reflect the code in the repository (e.g., showing "Welcome to xFusionCorp Industries" or "Updated" depending on the branch content, though the script targets `master`).