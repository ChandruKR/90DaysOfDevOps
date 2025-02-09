#!/bin/bash
#
#
#
# Check if script is run as root
if ! [ $(id -u) = 0 ]; then
    echo "You're not root! SWITCH to root to run this script"
exit 1
fi
########### User acccount creation #############

users_creation() {
    read -p "Enter the username: " username
    read -p "Enter the UID for given username(1000+) ": userid
    read -p "Enter the GECOS of the username": GECOS
    read -s -p "Enter the password for the given username: " password
echo
###Validating duplicate username || duplicate UID || invalid User id numbe

    existing_user=$(cat /etc/passwd | grep ":$userid:" | cut -d: -f1)

# Validating if the entered username exists
    if id "$username" &>/dev/null; then
        echo "Error: User  $username already exists!" 
id $username
#Validating the entered user ID 
    elif [[ "$userid" -lt 1000 ]]; then
        echo "Reserved for system users. User UID should be above 1001."
        exit 1
    elif [[ -n "$existing_user" ]]; then
	echo "UID $userid already exists and is assigned to user: $existing_user"
	exit
    else
        sudo useradd -u "$userid" -c "$GECOS" -m  "$username" -s /bin/bash
        echo "$username:$password" | sudo chpasswd
        echo "User $username created successfully."
    fi
}

############ User account deletion ##############

delete_user() {
    read -p "Enter username to delete: " username

    # Check if given user name is valid
    if ! id "$username" &>/dev/null; then
        echo "Error: User '$username' does not exist!"
        exit 1
    fi

    # Warn the user about home directory deletion
    echo "Warning: Deleting user '$username' will also remove their home directory."
    read -p "Type 'yes' only if backup is taken else type 'No': " confirmation

    if [[ "$confirmation" == "No" ]]; then
        echo "Operation canceled. User '$username' was not deleted."
        exit 1
    fi

    # Delete the user and their home directory
    sudo userdel -r "$username"

    # Check if the deletion was successful
    if [[ $? -eq 0 ]]; then
        echo -e "\e[32mUser '$username' has been deleted successfully.\e[0m"
    else
        echo "Error: Failed to delete user '$username'."
        exit 1
    fi
}


#################  handling Arguments using if statements ###############
if [[ "$1" == "-c" || "$1" == "--create" ]]; then
    users_creation
elif [[ "$1" == "-d" || "$1" == "--delete" ]]; then
    delete_user
elif [[ "$1" == "-r" || "$1" == "--reset" ]]; then
    reset_password
elif [[ "$1" == "-l" || "$1" == "--list" ]]; then
    list_users
elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
    help_section
    else
    	echo "Usage: $0 {-c|--create | -d|--delete | -r|--reset | -l|--list | -h|--help}"
    	exit 1
fi
