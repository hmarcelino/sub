#!/bin/bash

SUB_NAME="sub"

CMD_FILE=""
if [ -f ~/".bashrc" ]; then
    CMD_FILE=".bashrc"
else
    CMD_FILE=".bash_profile"
fi

echo "============================================="
echo "Installing $SUB_NAME utils commands"
echo "============================================="

SUB_HOMEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SUB_HOMEDIR/share/utils/print.sh

# A check for jenkins. He doesn't have access to the shell.
if [[ -n `grep "$SUB_NAME init" ~/$CMD_FILE` ]]; then
   echo "$SUB_NAME commands are already installed in your $CMD_FILE"

elif command -v $SUB_NAME | grep "$SUB_NAME" &>/dev/null ; then
   echo "$SUB_NAME commands are already installed in your $CMD_FILE"
   echo
else
   echo "installed $SUB_NAME commands, have fun!"
   echo 'eval "$('$SUB_HOMEDIR'/bin/'$SUB_NAME' init -)"' >> ~/$CMD_FILE
fi

println_info "Start a new session to use $SUB_NAME"
