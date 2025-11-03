# Question
The development team of xFusionCorp Industries is working on to develop a new static website and they are planning to deploy the same on Nautilus App Servers using Jenkins pipeline. They have shared their requirements with the DevOps team and accordingly we need to create a Jenkins pipeline job. Please find below more details about the task:



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123. There under user sarah you will find a repository named web_app that is already cloned on Storage server under /var/www/html. sarah is a developer who is working on this repository.


Add a slave node named Storage Server. It should be labeled as ststor01 and its remote root directory should be /var/www/html.


We have already cloned repository on Storage Server under /var/www/html.


Apache is already installed on all app Servers its running on port 8080.


Create a Jenkins pipeline job named nautilus-webapp-job (it must not be a Multibranch pipeline) and configure it to:


Add a string parameter named BRANCH.

It should conditionally deploy the code from web_app repository under /var/www/html on Storage Server, as this location is already mounted to the document root /var/www/html of app servers. The pipeline should have a single stage named Deploy ( which is case sensitive ) to accomplish the deployment.

The pipeline should be conditional, if the value master is passed to the BRANCH parameter then it must deploy the master branch, on the other hand if the value feature is passed to the BRANCH parameter then it must deploy the feature branch.

LB server is already configured. You should be able to see the latest changes you made by clicking on the App button. Please make sure the required content is loading on the main URL https://<LBR-URL> i.e there should not be a sub-directory like https://<LBR-URL>/web_app etc.


Note:


You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.


For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

Based on the task requirements, the provided Jenkins pipeline script, and the procedure outlined in the video transcript, here is a step-by-step guide to complete the work for deploying the web application using a conditional Jenkins pipeline.

---

### Step-by-Step Guide: Conditional Web App Deployment via Jenkins

The overall goal is to configure a slave node named **Storage Server**, define necessary credentials, and create a conditional Pipeline job named `nautilus-webapp-job` that deploys either the `master` or `feature` branch of the `web_app` repository based on a parameter input.

#### Phase 1: Access and Initial Plugin Setup

1.  **Access UIs:**
    *   Access the **Jenkins UI** and log in using the username `admin` and password `Adm!n321`.
    *   Access the **Gitea UI** and log in using the username `sarah` and password `Sarah_pass123`. Note that the repository `web_app` is under the user `sarah`.

2.  **Install Required Plugins:**
    *   Navigate to **Manage Jenkins** and then to **Plugins**.
    *   Install necessary plugins, including **SSH build agents**, **credentials plugin**, and **pipeline**.
    *   **Restart Jenkins** after installation is complete.

#### Phase 2: Configure the Storage Server Slave Node

The Storage Server must be configured as a slave node and needs Java installed to function as an agent.

1.  **Prepare Storage Server (Install Java and Set Permissions):**
    *   Connect to the Storage Server (e.g., via SSH as `str01` using the `student` user, as shown in the video).
    *   Install Java: Run the command to install Java, such as `install Java 17 openjdk`.
    *   Set Remote Root Directory Ownership: The required remote root directory is `/var/www/html`. The directory must be owned by the user Jenkins will use for connection (e.g., `Natasha`).
        *   Change the ownership of the `/var/www/html` directory recursively to the required user/group (e.g., `Natasha` user and group): `chmod -r natasha /var/www/html`.

2.  **Store Credentials in Jenkins:**
    *   In Jenkins, navigate to **Manage Jenkins** and store the credentials for the Storage Server connection.
    *   Use the username `Natasha` and the corresponding password. Identify this credential as `Natasha`.

3.  **Create and Configure the New Node:**
    *   Go to **Manage Jenkins** -> **Manage Nodes and Clouds** -> **New Node**.
    *   **Node Name:** `storage server` (or `Storage Server`).
    *   **Label:** Use the required label **`ststor01`**.
    *   **Remote Root Directory:** Set the directory to **/var/www/html**.
    *   **Launch Method:** Select **Launch agent via SSH**.
    *   **Host:** Enter the hostname or IP address of the Storage Server (`str01` is mentioned in the video).
    *   **Credentials:** Select the stored `Natasha` credentials.
    *   Set the **Host Key Verification Strategy** (e.g., **Manually trusted key verification**).
    *   **Launch Agent:** Click **Launch agent** and ensure the node connects successfully. Even if an error pops up initially, check the logs or status (free space) to confirm it is up.

#### Phase 3: Create and Configure the Conditional Pipeline Job

1.  **Create New Job:**
    *   Navigate back to the Jenkins dashboard and click **New Job** (or New Item).
    *   **Job Name:** Name the job **`nautilus-webapp-job`**.
    *   **Job Type:** Select **Pipeline**. It must **not** be a **Multibranch pipeline**.

2.  **Configure Pipeline Settings:**
    *   **Add Parameter:** In the configuration, add a **String parameter** named **`BRANCH`**.
    *   **Pipeline Script:** Select "Pipeline script" and paste the provided code.

The provided Jenkins pipeline script is as follows:

```groovy
pipeline {
    agent {
        label 'ststor01'
    }
    parameters {
        string(name: 'BRANCH', defaultValue: 'master', description: 'Branch to deploy (master or feature)')
    }
    stages {
        stage('Deploy') { // This stage name is case sensitive
            when {
                expression {
                    params.BRANCH == 'master' || params.BRANCH == 'feature'
                }
            }
            steps {
                script {
                    def repositoryPath = '/var/www/html/'
                    if (params.BRANCH == 'master') {
                        git branch: 'master',
                        url: 'http://git.stratos.xfusioncorp.com/sarah/web_app.git'
                    } else if (params.BRANCH == 'feature') {
                        git branch: 'feature',
                        url: 'http://git.stratos.xfusioncorp.com/sarah/web_app.git'
                    }
                    sh "cp -r /var/www/html/workspace/nautilus-webapp-job/* /var/www/html/"
                }
            }
        }
    }
}
```

**Key features of the script:**

*   **Agent:** The job runs on the slave node labeled `ststor01`.
*   **Parameter:** Defines the `BRANCH` parameter with `master` as the default value.
*   **Stage:** It uses a single stage named **`Deploy`**.
*   **Conditional Logic (`when`):** The stage only executes if the `BRANCH` parameter is set to either `master` or `feature`.
*   **Deployment Steps:**
    *   The `git` command clones the specified branch (`master` or `feature`) from the repository (`http://git.stratos.xfusioncorp.com/sarah/web_app.git`).
    *   The `sh` step copies the deployed content from the job's workspace directory (`/var/www/html/workspace/nautilus-webapp-job/`) into the remote root directory (`/var/www/html/`). This ensures the content loads directly on the main URL and not in a sub-directory.

3.  **Save the Job Configuration.**

#### Phase 4: Running and Verification

1.  **Initial Run (Optional but recommended):** Run the job once initially (e.g., using **Build Now**). This ensures the script is processed and the parameter structure is correctly established.
2.  **Build with Parameters:** Click **Build with Parameters**.
3.  **Conditional Deployment:**
    *   To deploy the Master branch, set the **BRANCH** parameter to **`master`**.
    *   To deploy the Feature branch, set the **BRANCH** parameter to **`feature`**.
4.  **Verification:** After the build is successful, verify the deployment by checking the changes on the main URL provided by the **App button**. If `master` was deployed, the site should show "Welcome to XVision Corp Industries". If `feature` was deployed, the site should show "Updated".