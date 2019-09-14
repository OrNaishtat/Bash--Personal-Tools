#! /bin/bash
##################################
# Author: NewLight #
# Purpose: Like most bash scripts, this little bash script is used to add a script you created to the terminal to be used by all users. #
# It will test if the script exists, if it's executable, and if it is it will check collisions with same named scripts in /sbin and if all is well it will copy it there #
# In the end, it will source $PATH, and ask the user to restart the terminal for the changes to take effect."
##################################

function script_test {
if [ -e $scadd ]; then
	echo "Script exists . . ."
else
	echo "Script does not exist . . ."
	exit 1
fi
if [ -x $scadd ];then
	echo "Script is executable . . . "
else
	echo "Script is not executable, exiting. . ."
	exit 1
fi
}

function folder_test {
if [ -e /sbin/$scadd ];then
	echo "script name already exists in folder."
	exit 1
else
	echo "File does not exist in /sbin/ please enter sudo password to copy it there - "
fi
}



read -p "Which script do you want to add to terminal? " scadd
script_test
folder_test
sudo cp $scadd /sbin/
read -p "How would you like to name the command for the script " scommand
echo alias $scommand="'"/sbin/$scadd"'"  >> ~/.bashrc
source ~/.bashrc
echo "Complete."
sleep 2
exit 0

