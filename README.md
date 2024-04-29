# dotfiles

## Installationt

Install wget

```bash
apt-get update; apt-get install wget
```

Download the install script. Give it permissions, and run it.

```bash
wget https://raw.githubusercontent.com/sigurdurhaukur/.dotfiles/main/install.sh; chmod +x install.sh; ./install.sh
```

Note: when after zsh has installed you need to exit it by running `exit` so that the install script can finish running
