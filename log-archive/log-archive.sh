#!/bin/bash

#Get OS on which the script is executed
. /etc/os-release

#store the name of the box in os_name variable
os_name="$NAME"

if [[ "$os_name" == "Ubuntu" ]]; then
       echo "Its Ubuntu $VERSION"
else
       echo "nothing"	
fi
