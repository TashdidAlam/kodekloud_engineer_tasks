# Question
The development team of xFusionCorp Industries is working on to develop a new static website and they are planning to deploy the same on Nautilus App Servers using Jenkins pipeline. They have shared their requirements with the DevOps team and accordingly we need to create a Jenkins pipeline job. Please find below more details about the task:



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123.


There is a repository named sarah/web in Gitea that is already cloned on Storage server under /var/www/html directory.


Update the content of the file index.html under the same repository to Welcome to xFusionCorp Industries and push the changes to the origin into the master branch.


Apache is already installed on all app Servers its running on port 8080.


Create a Jenkins pipeline job named deploy-job (it must not be a Multibranch pipeline job) and pipeline should have two stages Deploy and Test ( names are case sensitive ). Configure these stages as per details mentioned below.


a. The Deploy stage should deploy the code from web repository under /var/www/html on the Storage Server, as this location is already mounted to the document root /var/www/html of all app servers.


b. The Test stage should just test if the app is working fine and website is accessible. Its up to you how you design this stage to test it out, you can simply add a curl command as well to run a curl against the LBR URL (http://stlb01:8091) to see if the website is working or not. Make sure this stage fails in case the website/app is not working or if the Deploy stage fails.


Click on the App button on the top bar to see the latest changes you deployed. Please make sure the required content is loading on the main URL http://stlb01:8091 i.e there should not be a sub-directory like http://stlb01:8091/web etc.


Note:


You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.


For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.


### Step-by-Step Procedure for Creating the Jenkins Multistage Pipeline

#### 1. Accessing Systems and Initial Setup

1.  **Access Jenkins and Gitea:** Access the Jenkins UI using the Jenkins button and log in with the username **admin** and password **Adm!n321**. Access the Gitea UI using the Gitea button and log in with the username **sarah** and password **Sarah\_pass123**.
2.  **Verify Repository Status:** Confirm that the repository named `sarah/web` exists in Gitea. This repository is already cloned on the Storage server under the `/var/www/html` directory.

#### 2. Updating Repository Content

1.  **Modify `index.html`:** The content of the file `index.html` within the `sarah/web` repository must be updated.
2.  **Set Required Content:** Change the content of `index.html` to **"Welcome to xFusionCorp Industries"**.
3.  **Push Changes:** Push the updated changes to the `master` branch in the origin repository.

#### 3. Creating the Jenkins Pipeline Job

1.  **Create New Item:** In Jenkins, create a new job item.
2.  **Name the Job:** Name the job **deploy-job**.
3.  **Select Pipeline Type:** Choose the **Pipeline** project type (ensuring it is not a Multibranch pipeline job).
4.  **Configure Pipeline:** Navigate to the pipeline configuration section.
    *   The video notes the necessity of using credentials/password when connecting, recommending storing credentials as secrets rather than writing them directly in the script for security.

#### 4. Implementing the Pipeline Script

The pipeline script defines two mandated stages: **Deploy** and **Test**. The full script provided is detailed below and was inserted into the Jenkins job configuration.

***

### Jenkins Pipeline Script (`deploy-job`)

The following Groovy script was used to define the job, including the `Deploy` and `Test` stages:

```groovy
pipeline {

    agent any

    stages {

        stage('Deploy') {
            steps {
                script {
                    // Pulls the latest changes from the master branch onto the Storage Server (ststor01) 
                    // where the code is located at /var/www/html. 
                    // This location is mounted to the document root of all app servers [8a].
                    sh 'sshpass -p "Bl@kW" ssh -o StrictHostKeyChecking=no natasha@ststor01 "cd /var/www/html && git pull origin master"'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Uses curl to hit the Load Balancer URL (http://stlb01:8091) [8b] 
                    // and captures only the HTTP status code.
                    def response_code = sh (script: "curl -s -o /dev/null -w '%{http_code}' http://stlb01:8091", returnStdout: true).trim()

                    // Checks if the status code is NOT 200.
                    if (response_code !='200' ){
                        // If not 200, the stage fails, ensuring the website is working correctly [8b].
                        error("App not working after deployment. HttpCode: ${response_code}")
                    }else{
                        echo "App is working"
                    }
                    
                    // Note: This git pull command is repeated in the Test stage in the source script.
                    sh 'sshpass -p "Bl@kW" ssh -o StrictHostKeyChecking=no natasha@ststor01 "cd /var/www/html && git pull origin master"'
                }
            }
        }
    }
}
```

***

#### 5. Executing and Verifying the Task

1.  **Save and Run:** The pipeline configuration was saved. The job was then run.
2.  **Verify Deploy Stage:** The **Deploy** stage executed, successfully pulling the updated code onto the storage server (`/var/www/html`).
3.  **Verify Test Stage:** The **Test** stage executed by running a `curl` command against the Load Balancer URL (`http://stlb01:8091`) [8b, 4]. The stage checked if the response code was **200**, indicating success.
4.  **Confirmation:** Since the video shows the stages succeeding, the website was deemed accessible and working correctly with the deployed content ("Welcome to xFusionCorp Industries") [8b, 9].
5.  **Final Verification:** The user can click the App button to confirm that the required content is loading directly on the main URL (`http://stlb01:8091`) without a subdirectory path.

***
The overall process ensures that the updated website content is deployed to the correct location and validates its accessibility using an external status check (response code 200), fulfilling all requirements of the task.