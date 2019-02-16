#!/bin/bash

archive_name="BACKUP.tar.gz"
path="default"
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

# Choosing the catalogue where we would copy files to.
if [ "$path" == "default" ]; then
	path="$PWD/BACKUP"
fi
mkdir -p "$path"

# The copying algorithm with identical names conflicts handling.
find $HOME -not -path "$path*" -name "*.$extensions" -type f -exec cp -f --backup --suffix=_COPY -t "$path" '{}' &>/dev/null \;

# Compressing every file in folder to our archive.
tar -czf "$PWD/$archive_name" -C "$path" . &>/dev/null

echo "Done."
