# Week 3 Challenge 1: User Account Management

## Overview
In this challenge, I've created a shell script to manage user accounts on a Linux system. The script will include functionalities to create, delete, reset passwords, and list user accounts while ensuring proper validation and error handling.

## Features
### 1. Create a User (`-c` or `--create`)
- Prompts the user to enter a new username and password.
- Checks if the username already exists before creating the account.
- Displays a success or error message accordingly.
- validte if duplicate UIDs are entered
- Reject if entered UIDs are matching with reservered system level users

### 2. Delete a User (`-d` or `--delete`)
- Prompts for the username to delete.
- Checks if the user exists before attempting deletion.
- Displays a warning that the home directory will be removed and asks for confirmation (`yes` to proceed).
- Displays a confirmation message in **green** after successful deletion.

### 3. Reset a User Password (`-r` or `--reset`)
- Prompts for the username.
- Checks if the user exists before resetting the password.
- Prompts for a new password and applies the change.
- Displays a success or error message.

### 4. List All Users (`-l` or `--list`)
- Displays all system users along with their **User IDs (UIDs)**.
- Extracts information from `/etc/passwd`.

## Additional Requirements
- Ensure the script is run as root (`EUID` check).
- Proper error handling for missing or incorrect inputs.
- Implement timestamped **backup folders** and retain only the last 3 backups, removing older ones automatically.

## Sample Script Execution
### Creating a User
```bash
root@ip-#-#-#-#:~# /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh -c
Enter the username: test1
Enter the UID for given username(1000+) :1007
Enter the GECOS of the username:This is a test user
Enter the password for the given username:
User test1 created successfully.
.
```

### Validate UID
```bash
root@ip-#-#-#-#:~# /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh -c
Enter the username: testuser1
Enter the UID for given username(1000+) :1002
Enter the GECOS of the username:THis is a test user
Enter the password for the given username:
UID 1002 already exists and is assigned to user: chandru
```

### Valid reserved UID
```bash
root@ip-172-31-19-2:~# /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh -c
Enter the username: test23
Enter the UID for given username(1000+) :12
Enter the GECOS of the username:testing
Enter the password for the given username:
Reserved for system users. User UID should be above 1001.
```


### Deleting a User
```bash
root@ip-#-#-#-#:~# /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh -d
Enter username to delete: test1
Warning: Deleting user 'test1' will also remove their home directory.
Type 'yes' only if backup is taken else type 'No': yes
User 'test1' has been deleted successfully.

```

### Listing Users
```bash
root@ip-#-#-#-#:~# /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh -l
Username        UID
----------------------
root    0
daemon  1
bin     2
sys     3
sync    4
games   5
man     6
lp      7
mail    8

```
### Help_sections:
```bash
root@ip-#-#-#-#:~# /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh
Usage: /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh {-c|--create | -d|--delete | -r|--reset | -l|--list | -h|--help}

root@ip-#-#-#-#:~# /opt/Devops/90DaysOfDevOps/Week3_challenge_1/Managing_OS_Users.sh -h
############# Use the below options ###############
-c, --create              Create new user account
-d, --delete              Delete existing user account
-r, --reset               Reset user password
-l, --list                List all user accounts
-h, --help                Show this help message
```


## Conclusion
By completing this challenge, gained hands-on experience in **user account management** using shell scripting.

Happy scripting! 🚀

