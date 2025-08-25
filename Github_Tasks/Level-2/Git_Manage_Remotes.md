# Question
The xFusionCorp development team added updates to the project maintained under `/opt/news.git` repo and cloned under `/usr/src/kodekloudrepos/news`. Recently, some changes were made on the Git server hosted on the Storage server in Stratos DC. The DevOps team added new Git remotes, so we need to update the remote on `/usr/src/kodekloudrepos/news` repository as per the details below:

**a. In `/usr/src/kodekloudrepos/news` repo, add a new remote `dev_news` and point it to `/opt/xfusioncorp_news.git` repository.**
**b. Copy `/tmp/index.html` to the repo and add/commit to the `master` branch.**
**c. Finally, push the `master` branch to this new remote origin.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH to the storage server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the storage server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the news repository**
- Change to the directory containing the cloned git repository.
  ```
  cd /usr/src/kodekloudrepos/news
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: Add a new remote**
- Add the new remote named `dev_news` pointing to `/opt/xfusioncorp_news.git`.
  ```
  git remote add dev_news /opt/xfusioncorp_news.git
  ```
  > *Configures an additional remote for the repository, allowing you to push or fetch from another location.*

**Step 4: Copy the index.html file into the repo**
- Copy the required file from `/tmp` to the repository directory.
  ```
  cp /tmp/index.html .
  ```
  > *Adds the requested file to the repository for tracking and version control.*

**Step 5: Add and commit the index.html file**
- Stage and commit the new file to the master branch.
  ```
  git add index.html
  git commit -m "Add index.html to master branch"
  ```
  > *Stages and commits the new file to the master branch with a descriptive message.*

**Step 6: Push the master branch to the new remote**
- Push the updated master branch to the new remote `dev_news`.
  ```
  git push dev_news master
  ```
  > *Uploads the master branch and its commits to the new remote for collaboration or backup.*

**Step 7: Complete the task**
- Click on confirm to complete the task
