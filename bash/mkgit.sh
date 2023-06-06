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
    echo -n "${bold}${blue}Please enter the directory name:${reset} "
    read directory
    if test -d "$directory"; then
        echo "${red}Error: folder already exists.${reset}"
        return 1
    fi

    # Make sure this is running in the Documents folder
    if ! [[ "$(pwd)" =~ ~/Documents.*$ ]]; then
        echo "${red}Error: please navigate to the documents folder before running this script.${reset}"
        return 1
    fi

    # Create a local directory
    mkdir "$directory"
    cd "$directory" || return

    # Ask for repository visibility (public or private)
    echo -n "${bold}${blue}Should the repository be public or private? (public/private)${reset} "
    read visibility

    # Ask for contents of README
    echo -n "${bold}${blue}What would you like the README to say?${reset} "
    read readme_content
    echo "$readme_content" >README.md

    # Ask for files/directories to ignore
    echo ".vscode/" >> .gitignore

    # Ask for vscode settings
    echo -n "${bold}${blue}Would you like to add a .vscode/settings.json file? (yes/no)${reset} "
    read vscode_answer
    if [ "$vscode_answer" = "yes" ]; then
        mkdir ".vscode"
        (cd ".vscode" || return
        touch settings.json)
    fi

    # Initialize local git repo
    git init -b main
    git add .
    git commit -m "Initial commit"

    # Prepare for linking local repo to GitHub
    echo "${green}Prepared to link local repo to a new GitHub repo named:${reset}"
    gh repo create --source=. --${visibility} --remote=upstream --push
    echo "${bold}${green}Created the repo ankigpt on GitHub!${reset}"
}

mkgit
