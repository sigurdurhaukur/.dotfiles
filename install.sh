# check sudo

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# check machine os

if [ "$(uname)" == "Darwin" ]; then
  
  # check if brew is installed
  if ! command -v brew &> /dev/null
  then
    echo "brew is not installed, installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # install required packages
  
  brew install git wget curl stow zsh neovim ripgrep
  brew install --cask emacs

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  # install required packages
  apt-get install git wget curl stow zsh neovim ripgrep emacs

  

fi

# clone dotfiles

if [ -d ~/.dotfiles/.git ]; then
  git -C ~/.dotfiles pull
else
  git clone https://github.com/sigurdurhaukur/.dotfiles.git ~/.dotfiles
fi

# stow dotfiles
stow -d ~/.dotfiles -t ~ nvim

# install spacemacs (config is stowed from emacs/.spacemacs)
if [ ! -d ~/.emacs.d ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
else
  git -C ~/.emacs.d pull
fi
stow -d ~/.dotfiles -t ~ emacs


# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
