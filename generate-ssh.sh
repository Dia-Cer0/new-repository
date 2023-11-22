#check for existing ssh keys
ls -all ~/.ssh

#prompt user to enter their email address
echo "enter your email address:"
read email_address
echo $email_address



#generate public and private key for entered email address
#The three piped echos after the keygen command are optional and can be changed if non-default settings are desired
ssh-keygen -t ed25519 -b 4096 -C email_address | echo "\n" | echo "\n" | echo "\n"

#check for running ssh agents and notify the user
echo "Currently running ssh agents"
ps -a | grep ssh-agent | grep -v grep

#set agent up (commented out for now)
#eval $(ssh-agent -s)

#bind the private ssh key (in this case the name is id_ed25519)
#ssh-add ~/.ssh/id_ed25519

#to copy the public key (in windows)
#clip < id_ed25519.pub

#to verify key setup (after adding the public key manually from the github online interface)
#ssh -T git@github.com

#this command can be used to check current generated ssh keys
#ls -al ~/.ssh