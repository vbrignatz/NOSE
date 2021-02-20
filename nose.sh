#!/bin/bash

# NOSE : Notify On Script End
# This program will send you a telegram message when a script ends
# To use, simply add nose after your command :
# ./my_script.sh ; ./nose.sh [message]
# Exemple : sleep 2 ; ./nose.sh "I have slept for 2 sec !"

# PUT YOUR OWN TOKEN AND CHAT ID HERE
token=1234567890:AAAAAABBBBBBCCCCCCDDDDDDEEEEEEEFFFF
chat_id=123456789

if [[ "$1" = "-h" ]]; then
    echo "[NOSE] Notify On Script End, send a telegram message when script ends."
    echo "[NOSE] usage   : $ ./my_script.sh ; ./nose.sh [message]"
    echo "[NOSE] Exemple : $ sleep 2 ; ./nose.sh \"I have slept for 2 sec !\""
    exit
fi

message=$1
if [ -z "$1" ]; then
    # No argument supplied, using default message
    message="Script on $(hostname) has ended"
fi

echo [NOSE] Sending $message
curl -s -o /dev/null -X POST https://api.telegram.org/bot${token}/sendMessage \
  -F chat_id=${chat_id} -F text="${message}"