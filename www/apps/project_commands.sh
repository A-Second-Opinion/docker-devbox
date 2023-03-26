#!/bin/bash

command=
run=true

if [ -z "$1" ]
then
	echo "No command found."
else
	while [ -n "$1" ]
	do
		case "$1" in
			composer) echo "Running composer update."
				command="composer update";;

			migrate) echo "Running migrations."
				command="php artisan migrate";;

			pull) echo "Running git pull."
				command="git pull";;

			push) echo "Running git push."
				command="git push --no-verify";;

			status) echo "Running git status."
				command="git status";;

			help)
				echo "AVAILABLE COMMANDS:"
				echo "composer: Executes a composer update command"
				echo "migrate: Executes php artisan migrate command"
				echo "pull: Executes a git pull command"
				echo "push: Executes a git push command"
				echo "status: Executes a git status command"
				run=false
				;;
			--) shift
				break ;;
			*) echo "$1 is not a valid option"
				run=false;;
		esac
		shift
	done

	if [ $run ]
	then
		find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && $command" \;
	fi
fi