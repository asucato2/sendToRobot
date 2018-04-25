#!/bin/bash
#SENDTOROBOT#
#DEVELOPED BY ANDREW SUCATO#
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [ ! -e  $1 ] || [ $# -eq 0 ]
then
	printf "${RED}Usage: send filename${NC}\n"
	exit 
fi

if ! which mpg123 > /dev/null; then
	echo -e ${RED}Please install mpg123. Run \'sudo apt-get install mpg123\'${NC}
	exit
fi

# run cmake in current local directory
make -j4

if [ $? -ne 0 ]
then
        printf "${RED}ERROR: CMAKE failed${NC}\n"
        mpg123 ~/bin/sendToRobot/lib/sounds/missionFailed.mp3 &> /dev/null &
	exit
fi

myDir=$PWD
# set dir equal to structure of robot
robotDir=`echo $PWD | sed 's/.*\(autonomy\)/\1/g'`

# send file to robot *setup ssh key so that you don't need to enter password*
scp $1 astrobot@192.168.11.10:~/$robotDir

if [ $? -ne 0 ]
then
	printf "${RED}ERROR: scp failed${NC}\n"
	mpg123 ~/bin/sendToRobot/lib/sounds/missionFailed.mp3 &> /dev/null &
	exit
fi

printf "${GREEN}$1 sent successfully!${NC}\n"
canberra-gtk-play --file=~/bin/sendToRobot/lib/sounds/yipee.wav

