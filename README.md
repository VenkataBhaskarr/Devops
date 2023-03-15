# Devops

## THE ROADMAP

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

> Users

there are multiple users of a system and for them there are multiple permissions that we can assign individually to the users or make use of groups 
for grouping and giving the permissions to the users

Apart from the regukar human users in linux or ingeneral in any operating system there exists other users also which are the system daemons(the god tier process which starts running from the boot time and ends at the system shutdown stage which are responsible for a correct running of proceess and they can be available to one or more child processes)

``` The Root user ```
one of the daemons/users is root and it the most powerful user in linux operating system

``` sudo su ```

``` /etc/sudoers ```

``` /etc/passwd ```

``` /etc/shadow ```

``` /etc/group ```

