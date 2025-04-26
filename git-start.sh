#!/bin/bash

# All the commands related to github setup

echo "****************************"
echo "* Configuring Git & Github *"
echo "****************************"

echo "Getting .env file"

# get from file .env
if [ -f .env ]; then
    source .env
else
    echo ".env file not found"
    exit 1
fi

echo "Setting global user name and email"

echo "Name: $GIT_USER_NAME"
echo "Email: $GIT_USER_EMAIL"
echo "Default branch: main"

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global init.defaultBranch main

# config editor to vim
git config --global core.editor "vim"

# set git aliases
git config --global alias.lg log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative


# verify if ssh key exists

if [ -f ~/.ssh/id_ed25519.pub ]; then
  echo "SSH key already exists"

else
  echo "Generating ssh key"
  ssh-keygen -t ed25519 -C "$GIT_USER_EMAIL"
  echo "Generated ssh key and copied to clipboard,"
fi

echo "add it to ssh keys: https://github.com/settings/keys."
xclip -sel clip < ~/.ssh/id_ed25519.pub
echo "ssh copied to keyboard"

# open default browser with the github url
xdg-open "https://gith.com/settings/keys" &

echo "Done with github for now"

echo "Press enter once done to continue the setup"
read -r

