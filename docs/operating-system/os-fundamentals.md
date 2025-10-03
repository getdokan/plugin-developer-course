# Operating System Basics

Understanding operating system fundamentals is crucial for efficient software development. This guide covers essential OS concepts that every developer should know.

## Table of Contents
1. [Command-Line Interface (CLI)](#command-line-interface-cli)
2. [Process Management](#process-management)
3. [File System & Permissions](#file-system--permissions)
4. [System Monitoring](#system-monitoring)
5. [Shell Scripting Basics](#shell-scripting-basics)

---

## Command-Line Interface (CLI)

### Why CLI Matters
- Faster than GUI for many tasks
- Essential for server management
- Automation and scripting capabilities
- Better for remote systems

### Essential Commands

#### Navigation
```bash
# Print working directory
pwd

# List files and directories
ls                    # Basic listing
ls -l                 # Long format with details
ls -la                # Include hidden files
ls -lh                # Human-readable file sizes

# Change directory
cd /path/to/directory # Absolute path
cd ../                # Up one level
cd ~                  # Home directory
cd -                  # Previous directory
```

#### File Operations
```bash
# Create files
touch filename.txt
echo "content" > file.txt

# Create directories
mkdir new-folder
mkdir -p parent/child/grandchild

# Copy files/directories
cp source.txt destination.txt
cp -r source-dir/ destination-dir/

# Move/rename
mv old-name.txt new-name.txt
mv file.txt /new/location/

# Delete
rm file.txt
rm -r directory/      # Recursive delete
rm -rf directory/     # Force recursive delete (use carefully!)
```

#### Viewing Files
```bash
# View entire file
cat file.txt

# View with pagination
less file.txt         # Navigate with arrows, q to quit
more file.txt

# View first/last lines
head file.txt         # First 10 lines
head -n 20 file.txt   # First 20 lines
tail file.txt         # Last 10 lines
tail -f log.txt       # Follow/watch file (great for logs)
```

#### Search & Filter
```bash
# Search within files
grep "search-term" file.txt
grep -r "term" directory/       # Recursive search
grep -i "term" file.txt         # Case-insensitive
grep -n "term" file.txt         # Show line numbers

# Find files
find . -name "*.php"            # Find by name
find . -type f                  # Find files only
find . -type d                  # Find directories only
find . -mtime -7                # Modified in last 7 days
find . -size +100M              # Files larger than 100MB

# Which/whereis
which php                       # Show command location
whereis php                     # Show binary, source, manual locations
```

#### Pipes & Redirection
```bash
# Pipe output to another command
ls -l | grep ".php"
cat file.txt | grep "error" | wc -l

# Redirect output
command > output.txt            # Overwrite file
command >> output.txt           # Append to file
command 2> error.txt            # Redirect errors
command &> all.txt              # Redirect output and errors

# Input redirection
command < input.txt
```

### Practical Examples
```bash
# Count PHP files in current directory
find . -name "*.php" | wc -l

# Find and delete all .log files
find . -name "*.log" -delete

# Search for TODO comments in PHP files
grep -rn "TODO" . --include="*.php"

# Find large files
find . -type f -size +50M -exec ls -lh {} \;

# Monitor real-time logs
tail -f /var/log/apache2/error.log | grep "PHP"
```

---

## Process Management

### Understanding Processes

A **process** is a running instance of a program. Every command you run creates a process.

### Process Information
```bash
# List all processes
ps aux

# Interactive process viewer
top
htop                  # Enhanced version (may need to install)

# Process tree
pstree
ps auxf

# Find specific processes
ps aux | grep php
pgrep -l php         # Process ID and name
pidof php-fpm        # Get PID of process
```

### Process Control
```bash
# Run process in background
command &

# Bring to foreground
fg

# Send to background
bg

# List background jobs
jobs

# Suspend current process
Ctrl + Z

# Kill processes
kill PID                # Graceful termination (SIGTERM)
kill -9 PID            # Force kill (SIGKILL)
killall process-name   # Kill by name
pkill process-name     # Kill by name (pattern)
```

### Common Signals
```bash
kill -l                # List all signals

# Common signals
SIGTERM (15)          # Graceful shutdown (default)
SIGKILL (9)           # Force kill (cannot be caught)
SIGINT (2)            # Interrupt (Ctrl+C)
SIGHUP (1)            # Hangup (reload config)
SIGSTOP (19)          # Pause process
SIGCONT (18)          # Continue paused process
```

### Process Priority
```bash
# Run with different priority
nice -n 10 command     # Lower priority (nice to others)
nice -n -10 command    # Higher priority (requires sudo)

# Change priority of running process
renice 10 -p PID

# View process priority
ps -el | grep process-name
```

### Background & Daemon Processes
```bash
# Run and detach from terminal
nohup command &

# Run in background, ignore hangup
nohup ./script.sh > output.log 2>&1 &

# Disown a job
command &
disown
```

---

## File System & Permissions

### File System Hierarchy
```
/                     Root directory
├── bin              Essential binaries
├── etc              Configuration files
├── home             User home directories
├── var              Variable files (logs, cache)
│   ├── log          Log files
│   └── www          Web files
├── usr              User programs
│   ├── bin          User binaries
│   └── local        Locally installed software
└── tmp              Temporary files
```

### File Permissions

#### Understanding Permission Format
```bash
-rwxrw-r--  1 user group 4096 Jan 1 12:00 file.txt
│└┬┘└┬┘└┬┘
│ │  │  └── Others permissions (read)
│ │  └───── Group permissions (read, write)
│ └──────── Owner permissions (read, write, execute)
└────────── File type (- = file, d = directory, l = link)
```

#### Permission Values
- **r (read)**: 4
- **w (write)**: 2
- **x (execute)**: 1

#### Common Permission Combinations
- **777**: rwxrwxrwx (all permissions for everyone) - AVOID in production!
- **755**: rwxr-xr-x (owner can do anything, others can read/execute)
- **644**: rw-r--r-- (owner can read/write, others can only read)
- **600**: rw------- (only owner can read/write)

### Managing Permissions
```bash
# Change file permissions
chmod 755 script.sh          # Numeric
chmod u+x script.sh          # Add execute for user
chmod go-w file.txt          # Remove write for group and others
chmod -R 755 directory/      # Recursive

# Change ownership
chown user:group file.txt
chown -R user:group directory/
chgrp group file.txt         # Change group only

# View permissions
ls -l file.txt
stat file.txt                # Detailed info
```

### Special Permissions
```bash
# Setuid (SUID) - run as file owner
chmod u+s file
chmod 4755 file

# Setgid (SGID) - run as group owner
chmod g+s file
chmod 2755 file

# Sticky bit - only owner can delete
chmod +t directory
chmod 1777 directory
```

---

## System Monitoring

### Disk Usage
```bash
# Disk space
df -h                        # Human-readable
df -i                        # Inodes

# Directory sizes
du -sh directory/            # Summary
du -sh *                     # All items in current dir
du -h --max-depth=1          # One level deep
ncdu                         # Interactive disk usage (install separately)
```

### Memory Usage
```bash
# Memory information
free -h                      # Human-readable
free -m                      # In megabytes

# Detailed memory info
cat /proc/meminfo
vmstat                       # Virtual memory statistics
vmstat 5                     # Update every 5 seconds
```

### CPU & Load
```bash
# CPU information
lscpu
cat /proc/cpuinfo

# Load average
uptime                       # System uptime and load
w                           # Who's logged in and system load

# Monitor CPU usage
top
htop
mpstat                      # Multiprocessor statistics
```

### Network
```bash
# Network interfaces
ifconfig                    # Show network interfaces
ip addr                     # Modern alternative
ip link                     # Network devices

# Network statistics
netstat -tuln              # Listening ports
ss -tuln                   # Modern alternative
lsof -i :80                # What's using port 80

# Test connectivity
ping example.com
curl -I https://example.com
wget https://example.com
traceroute example.com
```

### System Information
```bash
# OS information
uname -a                   # All system info
cat /etc/os-release        # Distribution info
hostnamectl               # System hostname and info

# Hardware information
lshw                      # Detailed hardware
lsblk                     # Block devices
lsusb                     # USB devices
lspci                     # PCI devices
```

---

## Shell Scripting Basics

### Creating a Script
```bash
#!/bin/bash
# This is a comment

echo "Hello, World!"
```

### Making Script Executable
```bash
chmod +x script.sh
./script.sh
```

### Variables
```bash
#!/bin/bash

# Variable assignment (no spaces around =)
NAME="John"
AGE=30

# Using variables
echo "Name: $NAME"
echo "Age: ${AGE}"

# Command output
CURRENT_DIR=$(pwd)
DATE=`date +%Y-%m-%d`

# Read user input
read -p "Enter your name: " USERNAME
echo "Hello, $USERNAME"
```

### Conditionals
```bash
#!/bin/bash

if [ "$1" = "start" ]; then
    echo "Starting..."
elif [ "$1" = "stop" ]; then
    echo "Stopping..."
else
    echo "Unknown command"
fi

# File tests
if [ -f "file.txt" ]; then
    echo "File exists"
fi

if [ -d "directory" ]; then
    echo "Directory exists"
fi
```

### Loops
```bash
#!/bin/bash

# For loop
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# For loop with range
for i in {1..5}; do
    echo "Count: $i"
done

# For loop with files
for file in *.txt; do
    echo "Processing: $file"
done

# While loop
COUNT=0
while [ $COUNT -lt 5 ]; do
    echo "Count: $COUNT"
    COUNT=$((COUNT + 1))
done
```

### Functions
```bash
#!/bin/bash

# Define function
greet() {
    echo "Hello, $1!"
}

# Call function
greet "World"
greet "Developer"

# Function with return
add() {
    return $(($1 + $2))
}

add 5 3
result=$?
echo "Result: $result"
```

### Practical Script Examples

#### Backup Script
```bash
#!/bin/bash

# Backup directory script
SOURCE="/var/www/html"
DEST="/backup"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_$DATE.tar.gz"

echo "Starting backup..."
tar -czf "$DEST/$BACKUP_NAME" "$SOURCE"

if [ $? -eq 0 ]; then
    echo "Backup completed: $BACKUP_NAME"
else
    echo "Backup failed!"
    exit 1
fi
```

#### Log Monitor
```bash
#!/bin/bash

# Monitor log file for errors
LOG_FILE="/var/log/app.log"
ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")

echo "Found $ERROR_COUNT errors in log"

if [ $ERROR_COUNT -gt 0 ]; then
    echo "Recent errors:"
    grep "ERROR" "$LOG_FILE" | tail -5
fi
```

---

## Scheduled Tasks (Cron Jobs)

### Crontab Format
```
* * * * * command
│ │ │ │ │
│ │ │ │ └─── Day of week (0-7, Sunday = 0 or 7)
│ │ │ └───── Month (1-12)
│ │ └─────── Day of month (1-31)
│ └───────── Hour (0-23)
└─────────── Minute (0-59)
```

### Crontab Examples
```bash
# Every minute
* * * * * /path/to/script.sh

# Every hour
0 * * * * /path/to/script.sh

# Every day at 2:30 AM
30 2 * * * /path/to/script.sh

# Every Monday at 5 PM
0 17 * * 1 /path/to/script.sh

# First day of month at midnight
0 0 1 * * /path/to/script.sh
```

### Managing Cron Jobs
```bash
# Edit crontab
crontab -e

# List cron jobs
crontab -l

# Remove all cron jobs
crontab -r

# Edit cron for specific user (requires sudo)
sudo crontab -u username -e
```

---

## Learning Resources

### Documentation
- [Linux Command Line Basics](https://ubuntu.com/tutorials/command-line-for-beginners)
- [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)

### Practice
- [OverTheWire: Bandit](https://overthewire.org/wargames/bandit/) - Learn Linux commands through challenges
- [Terminus](http://web.mit.edu/mprat/Public/web/Terminus/Web/main.html) - Terminal game

### Cheat Sheets
- [Linux Command Cheat Sheet](https://www.guru99.com/linux-commands-cheat-sheet.html)
- [Bash Scripting Cheat Sheet](https://devhints.io/bash)

---

## Quiz Questions

Test your knowledge:

1. What is the difference between `rm` and `rm -rf`?
2. How do you find all files modified in the last 24 hours?
3. What signal does `kill` send by default?
4. What does the permission `644` mean?
5. How do you run a process in the background?
6. What's the difference between `ps aux` and `top`?
7. How do you schedule a script to run every day at midnight?
8. What does the `|` (pipe) operator do?

---

## Best Practices

1. **Always test destructive commands first** (especially rm -rf)
2. **Use tab completion** to avoid typos
3. **Read man pages**: `man command-name`
4. **Use `--help` flag**: `command --help`
5. **Be careful with sudo** - understand what you're doing
6. **Regular backups** before system changes
7. **Log important operations** for audit trail
8. **Use version control** for scripts and configs

---

## Common Pitfalls to Avoid

❌ **Don't**: `sudo rm -rf /`  
✅ **Do**: Double-check paths before deleting

❌ **Don't**: Run untrusted scripts with sudo  
✅ **Do**: Review scripts before executing

❌ **Don't**: Store sensitive data in plain text  
✅ **Do**: Use proper encryption and permissions

❌ **Don't**: Ignore error messages  
✅ **Do**: Read and understand errors

---

**Next Step**: [Web Fundamentals](../Web%20Fundamentals/web-basics.md)

