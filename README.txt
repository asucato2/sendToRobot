April 3, 2018 
sendToRobot.sh 
Developed by Andrew Sucato 
Usage: send filename 

Overview 
	This program sends a compiled version of the file specified to the corresponding location on the robot. 
The specified file will compile on your computer, then use SCP to transfer it to the robot. 

Installation instructions: 
	1. Create a folder named bin in home directory 
	2. Download and save “sendToRobot.sh” in bin 
	3. In bin directory, type “chmod +x sendToRobot.sh” to make executable 
	4. From home directory, type “vim .bash_aliases” to open file where aliases are stored 
	1. Press ‘I’ to insert text 
	2. Type “ alias send=’sendToRobot.sh’ ” 
	3. To save and close, press esc, then “:wq” 
	5. From home directory, “vim .bashrc” 
	6. At the end of the file, add “PATH=$PATH:~/bin/” 
	7. Run “source .bashrc” to update aliases 
	8. 
To set up SSH key (optional): 
	If you do not have an SSH key 
		1. From home directory, run “ssh-keygen -t rsa” 
		2. Press enter when asked where you want to save the key (this will use default location) 
		3. Enter a passphrase for your key 
		4. Now follow the instructions for if you already have a SSH key 

	If you already have a SSH key (ex. For git) 
		1. From home directory, “cat .ssh/id_rsa.pub” 
		2. Copy entire public key, starting with ssh and ending with email address 
		3. SSH into robot 
		4. From home directory, “cd .ssh” 
		5. Run “vim authorized_keys” 
		6. Add your SSH key to the end of the file 

Behavior expectations 
-Should send usage message if no file specified or file does not exist 
-Should send error message if CMake fails 
-Should send error message if SCP transfer fails 
-Error messages should be red 
-If successful, a message should be displayed saying the file was sent successfully (in green) 
-Prompt installation of mpg132 if not installed
-Should play success sound if successful and error sound if error (except incorrect usage error)

Disclaimer: By using this product, you agree that you are solely responsible for any changes and/or damages to the robot.
