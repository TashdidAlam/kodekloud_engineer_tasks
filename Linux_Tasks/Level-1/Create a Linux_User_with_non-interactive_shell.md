# Question

Create a Linux User with a non-interactive shell The System Admin Team of XfusionCorp Industries has installed a backup agent tool on all app servers. As per the tool's requirements, they need to create a user with a non-interactive shell. 

**Therefore, create a user named `rose` with a non-interactive shell in the app03 server**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

1. **Log in to app03 server**
    ```
    ssh banner@stapp03
    ```
2. **Switch to root user**
    ```
    sudo su
    ```
3. **Check if user exists**
    ```
    id rose
    ```
4. **Add user with non-interactive shell (if not exists)**
    ```
    adduser rose  -s /sbin/nologin
    ```
    > **Why use `-s /sbin/nologin`?**  
    > This option sets the user's shell to `/sbin/nologin`, which prevents interactive logins. It is a security best practice for service accounts or users that do not require shell access, such as those used by system tools or background processes.
5. **Validate user creation**
    ```
    id rose
    ```
    ```
    cat /etc/passwd |grep rose
    ```
6. **Click on confirm to complete the task**