echo "****************************"
echo "*       NVIM    START      *"
echo "****************************"

if [[ ! -d ~/.config/nvim ]]; then
  echo "Cloning Neovim configuration repository..."
  git clone git@github.com:domeeno/neovim-config.git ~/.config/nvim
fi

