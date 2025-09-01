# Question
The Nautilus application development team was working on a git repository `/opt/blog.git` which is cloned under `/usr/src/kodekloudrepos` directory present on the Storage server in Stratos DC. The team wants to set up a hook on this repository. Please find below more details:

**Merge the feature branch into the master branch, but before pushing your changes complete the following point:**

**Create a post-update hook in this git repository so that whenever any changes are pushed to the master branch, it creates a release tag with the name release-YYYY-MM-DD, where YYYY-MM-DD is the current date. Make sure you test the hook at least once and create a release tag for today's release.**

**Finally, remember to push your changes.**

<span style="color: red;">The below commands and actions are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into the Storage Server and navigate to the bare repository**
- Connect to the server and go to the bare repository directory.
  ```
  ssh natasha@ststor01
  cd /opt/blog.git
  ```
  > *Establishes a secure shell session and navigates to the bare repository where hooks are managed.*

**Step 2: Create the post-update hook**
- Create a post-update hook script in `/opt/blog.git/hooks/` to automatically tag releases on master.
  ```
  vi hooks/post-update
  ```
  Add the following script:
  ```bash
  #!/bin/bash
  current_branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)
  if [ "$current_branch" = "master" ]; then
      current_date=$(date +'%Y-%m-%d')
      tag_name="release-$current_date"
      git tag $tag_name
      git push origin $tag_name
  fi
  ```
  Make the hook executable:
  ```
  chmod +x hooks/post-update
  ```
  > *This hook checks if the push is to master, creates a release tag with today's date, and pushes the tag to the remote repository.*

**Step 3: Go to the cloned repository**
- Navigate to the working clone to merge and push changes.
  ```
  cd /usr/src/kodekloudrepos/blog
  ```
  > *Prepares to merge feature branch and trigger the hook.*

**Step 4: Merge feature into master and push**
- Ensure master is up to date, merge feature, and push changes.
  ```
  git checkout master
  git pull origin master
  git merge feature
  git push origin master
  ```
  > *Merges the feature branch into master and pushes changes, which triggers the post-update hook to create and push the release tag.*

**Step 5: Verify the release tag**
- Fetch tags and confirm the release tag was created.
  ```
  git fetch --tags
  git tag
  ```
  > *Ensures the release tag (e.g., release-2025-09-01) exists in the repository.*

**Step 6: Complete the task**
- Click confirm to finish the task.

**Note:** For scenarios requiring changes in a web UI, take screenshots or record your screen for review in case your task is marked incomplete.

