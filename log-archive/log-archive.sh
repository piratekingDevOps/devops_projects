#!/bin/bash

#Get OS on which the script is executed

. /etc/os-release

#store the name of the box in os_name variable
os_name="${NAME}"
VERSION="${VERSION_ID}"
PACKAGE_NAME="tar"
FILE_NAME="$1"
NOW=$(date +'%Y%m%d_%H%M%S')

#checking if file given with the script is valid or not

if [[ -z ${FILE_NAME} || ! -e ${FILE_NAME} ]]; then
	echo "please provide a valid file. the given file is invalid or does not exists"
	exit 1
fi

echo "Checking OS..."
echo
sleep 2
if [[ "$os_name" == "Ubuntu" ]]; then
       echo "It is a ${os_name}${VERSION} box"
       echo
       if ! dpkg -s tar &> /dev/null ; then
	       echo "$PACKAGE_NAME not installed, Installing package on $os_name"
	       echo
	       sudo apt update -qq > /dev/null 2>&1
	       sudo apt install -y $PACKAGE_NAME > /dev/null 2>&1
	       echo "$PACKAGE_NAME installed"
	       apt list $PACKAGE_NAME -a
	       echo
       fi
else
       echo "It is a ${os_name}${VERSION} box"
       echo
       if ! rpm -qav |grep -i tar &> /dev/null; then
	       echo "Installing Tar package on $os_name"
               sudo yum install -y $PACKAGE_NAME > /dev/null 2>&1
	       echo "$PACKAGE_NAME installed"
               rpm -qav |grep -i $PACKAGE_NAME
       fi       
fi

echo "Creating Log Archive of $FILE_NAME, output will be stored to /var/tmp/tar_logs_${NOW}"
tar -czvf ${FILE_NAME}_log_archive_$NOW.tar.gz ${FILE_NAME} >> /var/tmp/tar_logs_${NOW}
echo

echo "Log Archive created for ${FILE_NAME}"
ls -ltrh ${FILE_NAME}_log_archive_${NOW}.tar.gz
