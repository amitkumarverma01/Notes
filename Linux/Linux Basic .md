## What is Linux?
Linux is an open-source operating system kernel that serves as the core part of many operating systems. Distributions (distros) like Ubuntu, CentOS, Debian, and Fedora package Linux with additional software to provide a complete OS.

### The Linux Command Line (Terminal)
The Linux command line is a powerful interface that allows you to interact with the system by typing text commands. It's essential for performing administrative tasks and automating processes.

### Basic Commands-
Here are some of the most common and useful Linux commands:

 `pwd`	Print working directory — Shows the current directory you're in.
 `ls`	List — Lists files and directories in the current directory.
cd <directory>	Change directory — Navigates to a specified directory. Example: cd /home/user
cp <source> <dest>	Copy — Copies files or directories. Example: cp file1.txt file2.txt
mv <source> <dest>	Move — Moves files or renames them. Example: mv oldname.txt newname.txt
rm <file>	Remove — Deletes files. Example: rm file1.txt
rmdir <dir>	Remove directory — Deletes an empty directory.
mkdir <dir>	Make directory — Creates a new directory. Example: mkdir myfolder
touch <file>	Create an empty file — Creates an empty file. Example: touch newfile.txt
cat <file>	Concatenate — Displays the contents of a file. Example: cat file1.txt
man <command>	Manual — Shows the manual for a command. Example: man ls
echo <text>	Print text — Prints the given text to the terminal. Example: echo "Hello, Linux!"
clear	Clear terminal — Clears the terminal screen.
3. File and Directory Structure in Linux
Linux uses a hierarchical file system with a tree-like structure. The root directory (/) is at the top, and all other directories branch out from it.

Some important directories:

Directory	Description
/	Root directory, the top level of the file system.
/home	Contains user directories (e.g., /home/user).
/bin	Essential command binaries (e.g., ls, cp).
/etc	System configuration files.
/var	Variable data like logs and caches.
/tmp	Temporary files (may be deleted on reboot).
/usr	User programs and utilities.
/lib	Shared libraries and kernel modules.
4. File Permissions
Linux is a multi-user operating system, so understanding file permissions is important for security.

Each file or directory has three types of permissions:

Read (r): Permission to view the file contents.
Write (w): Permission to modify or delete the file.
Execute (x): Permission to run a file as a program (for files) or access a directory (for directories).
You can view permissions using the ls -l command:

bash
Copy
ls -l
Example output:

csharp
Copy
-rwxr-xr-- 1 user group 1234 Mar  3 10:00 file.txt
Explanation:

rwx: The owner has read, write, and execute permissions.
r-x: The group has read and execute permissions.
r--: Others have read-only permission.
Changing File Permissions
chmod: Change file permissions.
bash
Copy
chmod 755 file.txt   # Gives full permissions to the owner, and read-execute permissions to group and others.
chmod +x script.sh   # Adds execute permission to the script.
chown: Change file owner.
bash
Copy
chown user:group file.txt
chgrp: Change file group.
bash
Copy
chgrp group file.txt
5. Package Management
Linux distributions often use package managers to install, update, and remove software. The package manager depends on the Linux distro you are using.

Debian-based (Ubuntu, Mint, etc.)
apt: Package manager for installing, upgrading, and removing packages.
Update package list:
bash
Copy
sudo apt update
Install a package:
bash
Copy
sudo apt install <package_name>
Remove a package:
bash
Copy
sudo apt remove <package_name>
Upgrade packages:
bash
Copy
sudo apt upgrade
Red Hat-based (CentOS, Fedora, etc.)
yum (older systems) or dnf (newer systems): Used for managing packages.
Install a package:
bash
Copy
sudo dnf install <package_name>
Update package list:
bash
Copy
sudo dnf update
6. Process Management
ps: Shows currently running processes.
bash
Copy
ps aux
top: Displays a dynamic list of processes and resource usage.
bash
Copy
top
kill: Terminate a process.
bash
Copy
kill <PID>
killall: Kill a process by name.
bash
Copy
killall process_name
7. Networking Basics
ip: Displays network interfaces and settings.
bash
Copy
ip addr show
ping: Test network connectivity.
bash
Copy
ping google.com
ifconfig: Show network interface configurations (older command, often replaced by ip).
bash
Copy
ifconfig
netstat: View network connections and routing tables.
bash
Copy
netstat -tuln
8. Text Editors
In Linux, there are several command-line text editors you can use to edit files.

nano: A beginner-friendly text editor.
bash
Copy
nano filename
vim or vi: More advanced text editor with extensive features.
bash
Copy
vim filename
9. System Monitoring and Disk Usage
df: Shows disk space usage.
bash
Copy
df -h
du: Shows disk usage for files and directories.
bash
Copy
du -sh *
free: Displays memory usage.
bash
Copy
free -h
10. Creating and Managing Users
adduser: Add a new user.
bash
Copy
sudo adduser username
passwd: Change a user's password.
bash
Copy
sudo passwd username
userdel: Delete a user.
bash
Copy
sudo userdel username
11. Archives and Compression
tar: Create and extract archive files.

Create a tar archive:
bash
Copy
tar -cvf archive.tar folder/
Extract a tar archive:
bash
Copy
tar -xvf archive.tar
gzip/gunzip: Compress and decompress files.

Compress:
bash
Copy
gzip file.txt
Decompress:
bash
Copy
gunzip file.txt.gz
12. Finding Files
find: Search for files in the system.
bash
Copy
find /path/to/search -name "filename"
locate: Locate a file by name (requires updated database).
bash
Copy
locate filename
grep: Search within files for a pattern.
bash
Copy
grep "search_pattern" file.txt
