#!/bin/bash
## This script will create executeable .sh files with the /bin/bash ready, creation time, and creating user as comment. ##
function generate_script() {
read -p "Please enter script name: " scriptname
scriptname=$scriptname".sh"
echo "Please choose where to create your script: "
echo "1. Present Working Directory."
echo "2. Enter your own path."
read button

if [ $button -eq 1 ]; then
	touch $( pwd )/$scriptname
chmod +x $scriptname
printf "#!/bin/bash\n##Automatically Created Script ##\n## Created By: %s ##\n## Creation Time: $(date) ##\n## " $USER >> $scriptname
printf "\nDONE.\n"

elif [ $button -eq 2 ]; then
	read -p "Please enter your path: " newpath
	touch $newpath/$scriptname
	chmod +x $newpath/$scriptname
	printf "##Automatically Created Script ##\n## Created By: %s ##\n## Creation Time: $(date) ##\n## " $USER >> $newpath/$scriptname
	printf "\nDONE.\n"
else
	echo "Error. Thank you come again!"

fi
}
