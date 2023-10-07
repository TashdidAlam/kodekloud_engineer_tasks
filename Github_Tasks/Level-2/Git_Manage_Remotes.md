# Question
The xFusionCorp development team added updates to the project that is maintained under `/opt/news.git` repo and cloned under `/usr/src/kodekloudrepos/news`. Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, so we need to update remote on `/usr/src/kodekloudrepos/news` repository as per details mentioned below:

**a. In `/usr/src/kodekloudrepos/news` repo add a new remote `dev_news` and point it to `/opt/xfusioncorp_news.git` repository.**

**b. There is a file `/tmp/index.html` on same server; copy this file to the repo and add/commit to `master` branch.**

**c. Finally push `master` branch to this new remote origin.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**SSH to storage server and switch to root:**

```
ssh natasha@ststor01
```
```
sudo su -
```

**Navigate to the Repository**:

   ```bash
   cd /usr/src/kodekloudrepos/news
   ```

**Add a New Remote**:

   ```bash
   git remote add dev_news /opt/xfusioncorp_news.git
   ```

**Copy the `index.html` File**:

   ```bash
   cp /tmp/index.html .
   ```

**Add and Commit the `index.html` File**:


   ```bash
   git add index.html
   git commit -m "Add index.html to master branch"
   ```

**Push the `master` Branch to the New Remote (`origin`)**:


   ```bash
   git push dev_news master
   ```

Click on confirm to complete the task
