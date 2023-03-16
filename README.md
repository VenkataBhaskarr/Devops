# Devops

## THE ROADMAP

LINUX -> 

### Linux

> what happens when we start a computing device?

the programs present in the firmware or BIOS which inturn are pre installed on the hardware runs the program checks what input devices are connected whether the ram loaded or not and things like that and finally initilizes and bootloader which will initilizes the operating system software.

the operating system software differs from the other softwares in following manner
1. it contains a kernel
2. it contains a file system
3. it manipulates the hardware based on our commands
4. generally an user interface

> what is a terminal/console?

generally it is built on top of shell [ shell is a command line interpreter which takes the input from the keyboard and sends it to the kernal and most of the shells follow th bash programming language].

> basic commands

root directory - "/"
home directory - "~" - that is home directory is /users/apple in my system.

## Standard streams in Linux (streams in general mean to transfer the data)

There are three standard streams in linux

1. standard input. stdin. - 0
2. standard output.  stdout (can be of terminal, file or a pipe formats) - 1
3. standard error. stderr - 2

## some commands 

1. ls
2. ls > output.txt (the '>' symbol is used to create/transfers ouptut from one format to another.)
3. ls >> output.txt (the '>>' symbol modifies the existing file)
... more to be added


## Linux system administration

# User Management

> Users

there are multiple users of a system and for them there are multiple permissions that we can assign individually to the users or make use of groups 
for grouping and giving the permissions to the users

Apart from the regukar human users in linux or ingeneral in any operating system there exists other users also which are the system daemons(the god tier process which starts running from the boot time and ends at the system shutdown stage which are responsible for a correct running of proceess and they can be available to one or more child processes)

``` The Root user ```
one of the daemons/users is root and it the most powerful user in linux operating system and it has every right to do whatever it needed generally we the users get access to the root through *SUDO* command

``` sudo su ```

sudo su command makes you(user) as the default root user and trust me this is the thing you should never never never do until it is neccessary

``` /etc/sudoers ```

this file contains the root users and details about them

``` /etc/passwd ```

This command would give every user running on our operating system and the user details is in the following manner

root:*:0:0:System Administrator:/var/root:/bin/sh

where root is the name of user , 
* is encrypted password
0 is the user ID
0 is the group ID
system administrator is the additional message for the user
var/root is the home direcotry of the user
bin/sh is the shell of the user


``` /etc/shadow ```

this contains all the encrypted passwords of the users




``` /etc/group ```

this contains all the groups present in our Operating system

daemon:*:1:root

daemon is the group name
* is the password
* 1 is the group id
* root is the user present in that group


## Adding and deleting a user

to add any extra user we should use the command 
``` sudo useradd username ```

to delete the user we should use the command
``` sudo userdel username ```


# Permissions

 In order to get the details about the file/directory permission we should use the command  ``` ls -l dirname ``` the result is of the format
 
 drwxr-xr-x  29 apple  staff      928 Feb 13 21:00 opensource
 
 where , 
 
 drwxr-xr-x is a 10bit where 1 bit tells whetherit is a dir(d) , file(-) and link(l) the next three are permissions for the user, next three groups and next three are other permissions
 
 r - 4 w - 2 x - 1 
 
 ## Some important commands
 
 ``` chmod ugo+-rwx filename ``` used to change permissions for that file/directory
 
 ``` chmod 777 filename ``` to change permissions usung numbering
 
 ``` sudo chown user_name filename ``` changes the owner of filename to the user_name
 
 ``` sudo chgrp user_group filename ``` changes the group of the file
 
 ## set UID
 
 actually when we perform passwd we can change our password but wait the passwd belongs to root previleged file althugh it belongs to root we are somehow managing to makechange in it this is because the owner of the passwd file set the permissions as rws instead of rwe where we can achieve it through
 
 ``` sudo chmod 4755 filename ``` here 4 is the uid
 
 
 
 ## set GID
 
 ``` sudo chmod 2755 filename ``` here 2 is the gid
 
 ## sticky 
 
 
  ``` sudo chmod 1755 filename ``` here 1 is the sticky bit here any user can do anything he wants excpet deleting the file
 
 
 # Processes In Linux
 
 
 
 
 
