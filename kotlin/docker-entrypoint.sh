#!/bin/bash
set -e
if [ "${1##*.}" = 'kt' ]; then
	if [ -e "$1" ]; then
		kotlinc $1 -include-runtime -d tmp.jar
		java -jar tmp.jar ${@:2}
		rm -f tmp.jar
	fi
else
	exec "$@"
fi
