## Set up in wsl

### Install Nvm Nodejs

```bash
sudo apt update
sudo apt install curl zip
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm ls
nvm install --lts
nvm install node
```

## Install Oh my Posh

```bash
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
```

## Download the themes

```bash
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip
```

## Git config

```bash
git config --global user.name "KNguyen1411b"
git config --global user.email nguyendinhkhanhnguyen1@gmail.com

ssh-keygen -t rsa -b 4096 -C "KNguyen1411b"
cat ~/.ssh/id_rsa.pub
---add key git
ssh -T git@github.com
```
