Here's my submission of my HNG 11 Stage one task

## Linux User Creation Bash Script

This document provides an overview of the `create_users.sh` script, designed to automate user and group creation on a Linux system with security best practices in mind.

## Features

- Creates users and gorupos based on infroamtion provied in a text file.
- Generates random, secure passowrds for each user.
- Sets ownership and permissions on user home directories.
- Logs all actions for auditing purposes.
- Handles potential errors during user creation.

## Requirements

- User: Must have `sudo` prvileges to run the script.
- Text File: User information formatted as username; groups (one entry per line).
- Ubuntu virtual machine to run bash scripts `create_users.sh`


## Input file type

``` light; sudo,dev,www-data
    idimma; sudo
    mayowa; dev,www-data
```

- Usernames and group names are sepearted by a semicolon (;).
- Groups can be comma-separated (,) within the same line.

## Usage

1. Save the scripts as `create_users.sh`.
2. Modify permissions: `sudo chmod +x create_users.sh`
3. Run the script: `sudo ./create_users.sh /path/to/your/USER_FILE`

## Important Notes

- Adjust file permissions for `chmod 600 /var/secure/user_passords.txt` based on your security requirements.

## Additional Information

- The script utilizes error handling to gracefully handle situations like existing users.
- Comments are included throughout the script to enhance readability and understanding.
