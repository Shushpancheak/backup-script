#!/bin/bash

while getopts "e:n:p:" opt; do
	case $opt in
		e)
			echo "Extension!"
		;;

		n)
			echo "Name!"
		;;

		p)
			echo "Path!"
		;;

		\?)
			echo "Invalid option: -$OPTARG"
		;;
	esac
done


echo "Done."
