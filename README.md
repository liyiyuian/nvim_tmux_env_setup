# Introduction
There is no better working environment than vim plus tmux.

# bpytop setup
* Install with ```pip3 install bpytop --upgrade``` or ```sudo snap install bpytop```

# NeoVim setup
* Step1: Download the neovim ```sudo apt-get install neovim```. If neovim is not in the repository, then:
  - ```sudo apt-get install software-properties-common; sudo add-apt-repository ppa:neovim-ppa/stable; sudo apt-get update```
  - prerequisites for python modules: ```sudo apt-get install python-dev python-pip python3-dev python3-pip```
* Step2: Downlaod the neovim-plug from [here](https://github.com/junegunn/vim-plug)
  - ```sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'```
* Step3: Install NodeJS version > v12 with [this](https://phoenixnap.com/kb/update-node-js-version) method.
  - Install nvm (node version manager): 
    - ```sudo apt update; curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash; ```
    - check current nodejs version: ```nvm ls```
    - check remote versions: ```nvm ls-remote```
    - install the required version: ```nvm install [version.number]```
* Step4: Open the nvim and do ":PlugInstall"
* Step5: checkhealth provider, install pynvim packages
  - Install pip: 
    - ```curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py```
    - ```curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip2.py```
    - ```python get-pip2.py; python3 get-pip.py```
    - Then add the path to the $PATH
    - ```pip2 install pynvim; pip3 install pynvim```

# fzf and fd setup
* ```sudo apt install fzf```
* ```sudo apt-get install fd-find```
* Might need to do some changes in .bashrc for fd depends on environment setup.

# bat setup
* ```apt install bat```

# Tmux setup
* This configuration file works with tmux version 3.0a
* Download the tmux.conf to home directory, and change the name to .tmux.conf


*(Basic knownledge of vim and tmux will be added soon...)*
