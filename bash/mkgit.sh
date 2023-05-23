#!/bin/bash

# Make a local git repo and link it to a new GitHub repo
function mkgit () {
    # Check if folder exists already
    if test -d "$1"; then
        echo "Echo: folder already exists."
        return 1
    fi

    # Make sure this is running in the Documents folder
    if ! [[ "$(pwd)" =~ ~/Documents.*$ ]]; then
        echo "Error: please navigate to the documents folder before running this script."
        return 1
    fi

    # Make sure arguments were passed
    if [ "$#" -ne 2 ]; then
        echo "Error: this script requires two arguments."
        return 1
    fi

    # Create a local directory
    mkdir "$1"
    cd "$1" || return

    # Add README, gitignore, and .vscode
    echo "# Hello world!" > README.md
    echo ".vscode/" > .gitignore
    mkdir ".vscode"
    ( cd ".vscode" || return
    touch settings.json )

    # Initialize local git repo
    git init -b main
    git add .
    git commit -m "Initial commit"

    # Link local repo to GitHub
    gh repo create --source=. --"$2" --remote=upstream --push
}