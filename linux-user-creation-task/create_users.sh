#!/bin/bash

# Script configuration
USER_FILE="/path/to/your/user_info.txt"
LOG_FILE="/var/log/user_management.log"
PASSWORD_FILE="/var/secure/user_passwords.txt"

# Function to generate random password
function generate_password() {
  length=16
  cat /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*' | fold -w $length | head -n 1
}

# Main script body
echo "$(date) - Starting user creation script" >> $LOG_FILE

# Check for text file existence
if [ ! -f "$USER_FILE" ]; then
  echo "Error: User information file '$USER_FILE' not found!" >> $LOG_FILE
  exit 1
fi

# Loop through each user entry in the text file
while IFS=';' read -r username groups; do

  # Remove leading/trailing whitespace
  username="${username%%}"
  username="${username##}"
  groups="${groups%%}"
  groups="${groups##}"

  # Create user group (same name as username)
  if ! groupadd "$username" >> $LOG_FILE 2>&1; then
    echo "Warning: Group '$username' already exists." >> $LOG_FILE
  fi

  # Create user with primary group set to user group
  if ! useradd -m -g "$username" "$username" >> $LOG_FILE 2>&1; then
    echo "Error: Failed to create user '$username'." >> $LOG_FILE
    continue
  fi

  # Generate random password
  password=$(generate_password)

  # Set user password
  echo "$username:$password" | chpasswd --stdin >> $LOG_FILE 2>&1

  # Store password securely (modify permissions as needed)
  echo "$username:$password" >> $PASSWORD_FILE

  # Set ownership and permissions on home directory
  chown -R "$username:$username" "/home/$username" >> $LOG_FILE 2>&1
  chmod 700 "/home/$username" >> $LOG_FILE 2>&1

  # Add user to additional groups (comma-separated)
  for group in $(echo "$groups" | tr ',' ' '); do
    if ! usermod -a -G "$group" "$username" >> $LOG_FILE 2>&1; then
      echo "Warning: Failed to add user '$username' to group '$group'." >> $LOG_FILE
    fi
  done

  echo "User '$username' created successfully." >> $LOG_FILE

done < "$USER_FILE"

echo "$(date) - User creation script completed." >> $LOG_FILE

exit 0
