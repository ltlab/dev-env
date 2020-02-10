#!/bin/bash

GROUP_LIST=" ftp \
	tftp \
	nfs \
	docker \
	ssh \
	xrdp \
	sambashare"

NETWORK_SUBNET=$(ip a|grep -m 1 global | awk '{print $2}')

DOCKER="Y"

find_group()
{
	group=$1
	ret=1

	if [[ -z $(grep $group /etc/group) ]] ; then
		ret=0
	fi

	echo "$ret"
}

for group in ${GROUP_LIST}
do
	if [[ $(find_group $group) -eq 1 ]] ; then
		echo "Group $group is found!!!"
	fi
done

echo "DOCKER: $DOCKER"
if [[ "$DOCKER" != "Y" ]] ; then
	echo "DOCKER: $DOCKER"
fi

echo "NETWORK_SUBNET: $NETWORK_SUBNET"

#####
POWERLINE_FILE="/usr/share/powerline/bindings/bash/powerline.sh"
PS_LINE=$(grep PS1 $POWERLINE_FILE)

echo "PS1 => $PS_LINE"
PS_LINE=$PS_LINE"\n$ "
echo "PS1 => $PS_LINE"

for (( i = 1 ; i <= $(nproc) ; i = $(( i<<1 )) ))
do
	echo "i: $i"
done
LIST=$( for (( i = 1 ; i <= $(nproc) ; i = $(( i<<1 )) )) ; do echo -n "$i " ; done )
echo "LIST: $LIST"
