#!/bin/bash

GREEN='\033[0;32m'
if [[ -z "$1" ]]; then
	echo -e "${GREEN} Please enter the source & dest  path"
	echo "Usage: $0 <source_direcotry> <destination_directory>"
    exit 1
elif [[ -z "$2" ]];then
	echo "Please enter the destinatation path"
	echo "Usage: $0 <source_direcotry> <target_directory>"
    exit 1
fi

# Source folder to backup
SOURCE_FOLDER=$1

# Backup destination directory
BACKUP_DIR=$2

# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d_%H_%M_%S")

# Backup folder name with timestamp
BACKUP_FOLDER_NAME="backup_${TIMESTAMP}.tar.gz"

# Full path for the backup folder
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_FOLDER_NAME}"

tar -czf "$BACKUP_PATH" "$SOURCE_FOLDER"


# Check if the backup was successful
if [ $? -eq 0 ]; then
#  echo "`date`Backup completed successfully! Backup saved to: $BACKUP_PATH" >> /opt/backups/log
  echo -e "\e[32muser `date` Backup completed successfully! Backup saved to: $BACKUP_PATH\e[0m" >> /tmp/log
else
  echo "Backup failed!" `date` >> /tmp/log
fi


####### Retain only the last 3 backups ########

cd "$BACKUP_DIR" || exit 1
BACKUP_COUNT=$(ls -dt backup_* | wc -l)

if [[ "$BACKUP_COUNT" -gt 3 ]]; then
    # Find and remove older backups, keeping only the last 3
    ls -dt backup_* | tail -n +4 | xargs rm -rf
    echo "Removed older backups, retaining only the last 3." >> /tmp/Log_rotate
fi
