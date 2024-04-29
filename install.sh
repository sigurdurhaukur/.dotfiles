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
  
  brew install git wget curl stow zsh neovim

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  # install required packages
  apt-get install git wget curl stow zsh neovim

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Install Oh My Zsh and automatically answer 'Yes' to change the default shell
  echo "y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Explicitly change the default shell to Zsh
  chsh -s $(which zsh)

  # Optionally: Inform the user to log out and log back in
  echo "Installation complete. Please log out and log back in for the default shell change to take effect, or start a new Zsh shell manually."

  # Start a new Zsh shell
  exec zsh
fi

# clone dotfiles

git clone https://github.com/sigurdurhaukur/.dotfiles.git ~/.dotfiles

# stow dotfiles
stow -d ~/.dotfiles -t ~ nvim

