#!/bin/bash
#
#
#
# Check if script is run as root
if ! [ $(id -u) = 0 ]; then
    echo "You're not root! SWITCH to root to run this script"
exit 1

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
        read -p "Enter a new UID to update user $existing_user: " userid
	sudo useradd -u "$userid" -c "$GECOS" -m  "$username" -s /bin/bash
        echo "$username:$password" | sudo chpasswd
        echo "User $username created successfully."
    else
        sudo useradd -u "$userid" -c "$GECOS" -m  "$username" -s /bin/bash
        echo "$username:$password" | sudo chpasswd
        echo "User $username created successfully."
    fi
}

############ User account deletion ##############



if [[ "$1" == "-c" || "$1" == "--create" ]]; then
    users_creation
    else
    	echo "Usage: $0 {-c|--create | -d|--delete | -r|--reset | -l|--list}"
    	exit 1
fi
