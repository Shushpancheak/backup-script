#!/bin/bash

archive_name="BACKUP.tar"
path="~/"
extensions="*"

while getopts "e:n:p:" opt; do
	case $opt in
		e)
			extensions=$OPTARG
		;;

		n)
			archive_name=$OPTARG
		;;

		p)
			path=$OPTARG
		;;

		\?)
			echo "Invalid option: -$OPTARG."
		;;

		:)
			echo "Option -$OPTARG requiers an argument."
		;;
	esac
done




echo "Done."
