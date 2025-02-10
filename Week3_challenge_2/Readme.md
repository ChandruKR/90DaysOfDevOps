# Week 3 Challenge 2: Automated Backup & Recovery

## Objective
The goal of this challenge is to create a Bash script that automates the backup process for a specified directory. The script will:
- Take a directory path as a command-line argument.
- Create a timestamped backup of the specified directory.
- Archive the backup using TAR to save space.
- Implement a rotation mechanism to retain only the last **three** backups, deleting older ones automatically.

## Features
- **Timestamped Backups**: Each backup folder is named with a timestamp to keep track of versions.
- **Compression**: The backups are compressed using `tar` to save space.
- **Rotation Mechanism**: The script ensures that only the latest three backups are kept.

## Usage
Run the script using:
```bash
./backup_script.sh /Source_directory_path  /desination_saving_path_directory 
```


## Bash Script
Below is the Bash script run test and outputs

```bash


```





## Conclusion
This Bash script provides a simple and effective way to automate directory backups while ensuring efficient storage management through backup rotation. 🚀