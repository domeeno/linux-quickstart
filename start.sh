#!/bin/bash

# 0. Installing some deps

echo "****************************"
echo "*  PACKAGE MANAGER START   *"
echo "****************************"

get_package_manager() {
  # Check known files to determine the package manager
  declare -A osInfo=(
    [/etc/redhat-release]=yum
    [/etc/arch-release]=pacman
    [/etc/gentoo-release]=emerge
    [/etc/SuSE-release]=zypp
    [/etc/debian_version]=apt-get
    [/etc/alpine-release]=apk
  )

  for f in "${!osInfo[@]}"; do
    if [[ -f $f ]]; then
      echo "${osInfo[$f]}"
      return 0
    fi
  done

  echo "No supported package manager found" >&2
  exit 1
}

package_manager=$(get_package_manager)
echo "Package manager: $package_manager"

get_install_command() {
  case $1 in
    apt-get)
      echo "sudo apt-get install -y"
      ;;
    pacman)
      echo "sudo pacman -S --noconfirm"
      ;;
    *)
      echo "Unsupported package manager: $1" >&2
      exit 1
      ;;
  esac
}

echo "Getting install command"
install_command=$(get_install_command "$package_manager")
echo "Install command: $install_command"

echo "Installing packages..."

echo "xclip: for nvim copy to clipboard and other clipboard funcs"
echo "$install_command xclip"
eval "$install_command xclip"

echo "ripgrep: for nvim search functionality"
echo "$install_command ripgrep"
eval "$install_command ripgrep"

# 1. Git setup

chmod +x ./git-start.sh

./git-start.sh

chmod +x ./nvim-start.sh

./nvim-start.sh


echo "****************************"
echo "*         OPTIONALS        *"
echo "****************************"

# Installing nvm for node and npm, required by Copilot and react projects

# Installing NVM for Node and npm, required by Copilot and React projects
if [[ ! -d "$HOME/.nvm" ]]; then
  echo "Installing NVM (Node Version Manager)..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

  # Load NVM immediately after installation
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && echo "${HOME}/.nvm" || echo "${XDG_CONFIG_HOME}/nvm")"
  if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    # shellcheck source=/dev/null
    source "$NVM_DIR/nvm.sh"
  fi
else
  echo "NVM is already installed."
fi

chmod +x ./kitty-start.sh

./kitty-start.sh

