#! /bin/bash

function script_create_menu {
echo "Bash script generator activated."
echo "1.Create script in current work directory. "
echo "2. Create script in costume location. "
read scriptlocation
scriptcreator
}

function scriptcreator
{
case $scriptlocation in
        1)
                read -p "Please enter script name - " scriptname
                scriptfull=$scriptname'.sh'
		touch $scriptfull
		chmod +x $scriptfull
		echo "#! /bin/bash" > $scriptfull
		if [ -e $scriptfull ] && [ -x $scriptfull ] ; then echo "Done Successfully" ; fi
                ;;


        2)      read -p "Please enter script desired location (directory) : " scriptpath
                if [ -d $scriptpath ] ; then read -p "Please enter script name - " scriptname ;
		else
			echo "Error with file location, please try again."
			exit 1
	       
		fi
                scriptfull=$scriptpath$scriptname'.sh'
                touch $scriptfull
                chmod +x $scriptfull
                echo  "#! /bin/bash" > $scriptfull
	        if [ -e $scriptfull ] && [ -x $scriptfull ] ; then echo "Done Successfully" ; fi
	       	;;
                
                
esac

}
function script_again {
read -p "Create another script? y/n " useranswer
case $useranswer in
	y) scriptcreator ;;
	n) echo "Goodbye."
		exit 0;;
	*) echo "Try again."
esac
                
}
script_create_menu
script_again
while [ $useranswer == y ] ; do
	script_again
done
