### -----------------------------------------------------------------------
### Werkzeug 1.2.3 by Linus Preiss, Licenced under MIT
### -----------------------------------------------------------------------




#	 ***            **
#	*   *            *
#	*                *
#	*       ****     *     ****   * **
#	*      *    *    *    *    *   *
#	*      *    *    *    *    *   *
#	*      *    *    *    *    *   *
#	*   *  *    *    *    *    *   *
#	 ***    ****   *****   ****    *

NC="\033[0m"		#
RED="\033[0;31m"	#
GREEN="\033[0;32m"	# Make something pop
ORANGE="\033[0;33m"	#
BLUE="\033[0;34m"	# Promt the user
PURPLE="\033[0;35m"	# Initialisation of stuff
CYAN="\033[0;36m"	# Done




#	*     *                                **
#	**   **            *                    *                      *
#	* * * *                                 *
#	*  *  *   ****    **    * ***           *     ****    *** *   **     ****
#	*     *       *    *    **   *          *    *    *  *   *     *    *    *
#	*     *   *****    *    *    *          *    *    *  *   *     *    *
#	*     *  *    *    *    *    *          *    *    *   ***      *    *
#	*     *  *   **    *    *    *          *    *    *  *         *    *    *
#	*     *   *** *  *****  *    *        *****   ****    ****   *****   ****
#	                                                     *    *
#	                                                      ****

# greet the user
greeting (){
	clear
	echo -e ""
	banner Werkzeug
	echo -e " Werkzeug 1.0.1 by Linus Preiss, Licenced under MIT"
}


# show the options to the user
showOptions (){
	echo -e "${BLUE} Select one of the folowing options by typing its number.${NC}"
	echo -e ""
	echo -e "${GREEN}=============== pacman/yay ===============${NC}"
	echo -e "01:	${GREEN}Update n' Clean${NC}"
	echo -e "02:	${GREEN}Clean${NC}"
	echo -e "03:	${GREEN}Update${NC}"
	echo -e "04:	${GREEN}Fix broken PGP-signatures${NC}"
	echo -e "05:	${GREEN}${NC}"
	echo -e "06:	${GREEN}${NC}"
	echo -e "07:	${GREEN}${NC}"
	echo -e "08:	${GREEN}${NC}"
	echo -e "09:	${GREEN}${NC}"
	echo -e "10:	${GREEN}${NC}"
	echo -e "11:	${GREEN}${NC}"
	echo -e "12:	${GREEN}${NC}"
	echo -e "13:	${GREEN}${NC}"
	echo -e "14:	${GREEN}${NC}"
	echo -e "15:	${GREEN}${NC}"
	echo -e "16:	${GREEN}${NC}"
	echo -e "17:	${GREEN}${NC}"
	echo -e "18:	${GREEN}${NC}"
	echo -e "19:	${GREEN}${NC}"
	echo -e "20:	${GREEN}${NC}"
	echo -e ""
}


# ask witch funktion the user wahnts to use
askOption (){
	read -p "Coose an option: " chosenOption
	echo -e ""
}


# run the option the user chose
runOption (){
	if [ $chosenOption -eq 1 ]
	then
		clear
		banner "Update n' Clean"
		UpdateNClean

	elif [ $chosenOption -eq 2 ]
	then
		clear
		banner "Clean"
		Clean

	elif [ $chosenOption -eq 3 ]
	then
		clear
		banner "Update"
		Update

	elif [ $chosenOption -eq 4 ]
	then
		clear
		banner "Fix broken PGP-signatures"
		PGP
	fi

}


# show the outro
outro (){
	echo -e ""
	read -p "Press enter to exit "
}




#	*     *               *           **
#	**   **               *            *
#	* * * *               *            *
#	*  *  *   ****    *** *  *    *    *     ****    ****
#	*     *  *    *  *   **  *    *    *    *    *  *    *
#	*     *  *    *  *    *  *    *    *    ******   **
#	*     *  *    *  *    *  *    *    *    *          **
#	*     *  *    *  *   **  *   **    *    *    *  *    *
#	*     *   ****    *** *   *** *  *****   ****    ****

echo -e "${CYAN}Done${NC}"
UpdateNClean (){
	Update
	Clean
}


Clean (){
	echo -e ""
	echo -e "${PURPLE}Removing orphans${NC}"
	yay -R --noconfirm $(yay -Qdtq)
	echo -e "${CYAN}Done${NC}"

	echo -e ""
	echo -e "${PURPLE}Clearing cash${NC}"
	sudo paccache -r
	echo -e "n\nn\ny\ny" | yay -Sc
	echo -e "${CYAN}Done${NC}"
}


Update (){
	echo -e ""
	echo -e "${PURPLE}Updating all systems${NC}"
	sudo pacman -Syu --noconfirm
	yay -Syu
	echo -e "${CYAN}Done${NC}"
}


PGP (){
	echo -e ""
	echo -e "${PURPLE}Updating archlinux-keyring${NC}"
	sudo pacman -Sy --noconfirm archlinux-keyring
	echo -e "${CYAN}Done${NC}"

	echo -e ""
	echo -e "Refreshing the keys"
	sudo pacman-key --refresh-keys
	echo -e "${CYAN}Done${NC}"
}




#	***                  *
#	 *             *     *
#	 *                   *
#	 *   * ***    **    ****
#	 *   **   *    *     *
#	 *   *    *    *     *
#	 *   *    *    *     *
#	 *   *    *    *     *  *
#	***  *    *  *****    **

greeting
showOptions
askOption
runOption
outro
