# Linux Quickstart

This repository contains bash scripts that get me quickly started with a fresh Linux install. 

It automates things like Git setup, Git ssh setup, NVIM, node/npm package manager and some other dependencies.

To run first time:

```bash
chmod +x ./start.sh # Allows execution of script
# Entry point of the whole script.
# But the other scripts could be run independently if one is specifically required
./start.sh
```

## List of features

- Installs xclip and ripgrep on Arch/Debian based systems
- It sets git username and email from a `.env` file. The env file should reside in the same folder.
  - For username, add `GIT_USER_NAME="your beautiful username"` to `.env`
  - For email, add `GIT_USER_EMAIL="your beautiful email"` to `.env`
- Adds some aliases to .gitconfig and sets default branch to `main` and default editor to `vim`
- Generates an ssh key from `GIT_USER_EMAIL`, copies it to clipboard and opens default browser to keys setting. Just CTRL + V in a new key and you're set.
- Installs `kitty` terminal. Sets it up. A reboot of the user session is required to use terminal (Just the way kitty is).

## To add.

- Oh-my-zsh/p10k/zsh
