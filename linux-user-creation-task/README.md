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

Whitespaces around usernames and groups wil be ignored.

- Usernames and group names are sepearted by a semicolon (;).
- Groups can be comma-separated (,) within the same line.

## Usage

1. Save the scripts as `create_users.sh`.
2. Modify permissions: `chmod +x create_users.sh`
3. Update the `USER_FILE` variable in the script to point to your user information file path.
4. Run the script: `./create_users.sh`

## Important Notes

- This script leverages the chpasswwd command with the `--stdin` option to set passwords. Ensure this functionality is available on your ssytem.
- You might need to adjust file permissions for `/var/secure/user_passords.txt` based on your security requirements.

## Additional Information

- The script utilizes error handling to gracefully handle situations like existing users.
- Comments are included throughout the script to enhance readability and understanding.
