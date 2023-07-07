#!/bin/bash

# Define color and formatting codes
bold=$(tput bold)
underline=$(tput smul)
reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)

# Make a local git repo and prepare for linking it to a new GitHub repo
function mkgit() {
    # Ask for the directory name
    echo -n "${bold}${blue}Please enter the directory name: ${reset}"
    read directory
    if test -d "$directory"; then
        echo "${bold}${red}Error: folder already exists.${reset}"
        return 1
    fi

    # Make sure this is running in the Documents folder
    if ! [[ "$(pwd)" =~ ~/Documents.*$ ]]; then
        echo "${bold}${red}Error: please navigate to the documents folder before running this script.${reset}"
        return 1
    fi

    # Create a local directory
    mkdir "$directory"
    cd "$directory" || return

    # Ask for repository visibility (public or private)
    echo -n "${bold}${blue}Should the repository be public or private? (public/private)${reset} "
    read visibility
    while [[ "$visibility" != "public" && "$visibility" != "private" ]]; do
        echo "${bold}${red}Invalid input. Please enter either 'public' or 'private'.${reset}"
        read visibility
    done

    # Ask for contents of README
    echo -n "${bold}${blue}What would you like the README to say?${reset} "
    read readme_content
    echo "$readme_content" > README.md

    # Ask for files/directories to ignore
    echo ".vscode/" >> .gitignore

    # Ask for vscode settings
    echo -n "${bold}${blue}Would you like to add a .vscode/settings.json file? (yes/no)${reset} "
    read vscode_answer
    while [[ "$vscode_answer" != "yes" && "$vscode_answer" != "no" ]]; do
        echo "${bold}${red}Invalid input. Please enter either 'yes' or 'no'.${reset}"
        read vscode_answer
    done

    if [ "$vscode_answer" = "yes" ]; then
        mkdir ".vscode"
        (cd ".vscode" || return
        touch settings.json)
    fi

    # Initialize local git repo
    if ! command -v git &> /dev/null; then
        echo "${bold}${red}Git could not be found. Please install it before proceeding.${reset}"
        return 1
    fi

    git init -b main
    git add .
    git commit -m "Initial commit"

    # Prepare for linking local repo to GitHub
    if ! command -v gh &> /dev/null; then
        echo "${bold}${red}GitHub CLI could not be found. Please install it before proceeding.${reset}"
        return 1
    fi

    if gh repo create "$directory" --source=. --remote=upstream --push --${visibility}; then
        echo "${bold}${green}Created the repo $directory on GitHub!${reset}"
    else
        echo "${bold}${red}Failed to create the GitHub repo. Please check your network connection and try again.${reset}"
        return 1
    fi
}