# Introduction
There is no better working environment than vim plus tmux.

# bpytop setup
IMHO, better than htop.
* Install with ```pip3 install bpytop --upgrade``` or ```sudo snap install bpytop``` or ```conda install -c conda-forge bpytop```

# NeoVim setup
* Step 1: Download the neovim.
  - If you are root, simply do ```sudo apt-get install neovim```. If neovim is not in the repository, then:
    - ```sudo apt-get install software-properties-common; sudo add-apt-repository ppa:neovim-ppa/stable; sudo apt-get update```
  - If not, download the prebuilt version: from [here](https://github.com/neovim/neovim/releases/tag/v0.6.1), and add an alias **nvim** to where the neovim program saved. Or add the program to the PATH.
  - Prerequisites for python modules: ```sudo apt-get install python-dev python-pip python3-dev python3-pip```
* Step 2: Downlaod the neovim-plug from [here](https://github.com/junegunn/vim-plug)
  - ```sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'```
* Step 3: init.vim
  - Move the init.vim file to ~/.config/nvim/
* Step 4: Install NodeJS version > v12 with [this](https://phoenixnap.com/kb/update-node-js-version) method.
  - Install with nvm (node version manager): 
    - ```sudo apt update; curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash; ```
    - check current nodejs version: ```nvm ls```
    - check remote versions: ```nvm ls-remote```
    - install the required version: ```nvm install [version.number]```
  - Or install with conda and install yarn with conda
    - Then, cd ~/.config/nvim/pack/coc.nvim
    - yarn install
    - yarn build
* Step 5: Open the nvim and do ```:PlugInstall```
  - If there is any problem with NodeJS, try any method to install a running version of it and do ```:CocUpdate```.
* Step 6: Install pynvim packages
  - Install pip and pip3 if it's not installed yet: 
    - ```curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py```
    - ```curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip2.py```
    - ```python get-pip2.py; python3 get-pip.py```
    - Then add the path to the $PATH
  - Install pynvim
    -  ```pip2 install pynvim; pip3 install pynvim```
* Step 7: checkhealth provider, 

* Step 8: CocConfig
  - pyright sometimes cannot understand the imported packages, and raises erors. One solution is to install everything with pip/pip3, then coc should be able to naturally understand the packages from the default environment.
  - However, if you are using virtual environment, i.e. conda. I am not sure the perfect solution but this is what I do to solve this problem in certain level:
    - do ```:CocConfig``` and add the following lines into the coc-setting.json file.
    ```
    {
        "python.linting.pylintArgs": ["--generate-members=numpy.*,torch.*", "--errors-only"],
        "python.pythonPath": "PATH-TO-PYTHON-IN-CURRENT-VIRTUAL-ENVIRONMENT",
        "python.analysis.typeCheckingMode": "off" <- this solve the torch problem. pyright cannot properly parse the torch lib.
    }
    ```



# fzf and fd setup
* ```sudo apt install fzf``` or ```conda install -c conda-forge fzf```
* ```sudo apt-get install fd-find``` or ```conda install -c conda-forge fd-find```
* Might need to do some changes in .bashrc for fd depends on environment setup.
```
Bash
====

Append this line to ~/.bashrc to enable fzf keybindings for Bash:

   source /usr/share/doc/fzf/examples/key-bindings.bash

Append this line to ~/.bashrc to enable fuzzy auto-completion for Bash:

   source /usr/share/doc/fzf/examples/completion.bash
   ```

# bat setup
* ```apt install bat``` or ```conda install -c conda-forge bat```

# tree setup
* ```conda install -c conda-forge tree```

# Tmux setup
* This configuration file works with tmux version 3.0a (and potentially above)
* Download the tmux.conf to home directory, and change the name to ```.tmux.conf```
* Downlaod tmux plugin manager: [link](https://github.com/tmux-plugins/tpm), run prefix + I in tmux session.

# OpenAI Codex Plugin
* https://github.com/tom-doerr/vim_codex



*(Basic knownledge of vim and tmux will be added soon...)*

# Gruxbox theme for linux terminal
* https://reposhub.com/linux/shell-customization/Mayccoll-Gogh.html

# Interactive jupyter notebook in neovim
## jupytext
* Install jupytext: ```pip install jupytext```
* Now, open a ipynb file, and do set syntax=python to enable syntax.

## Iron.vim
Install Lua from [here](http://www.lua.org/download.html)
Follow the steps [here](https://maxwellrules.com/misc/nvim_jupyter.html).
Basically, create a file ```plugins.lua``` under ```$HOME/.config/nvim/``` with this script:
```lua
local iron = require "iron.core"
iron.setup({
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
  },
  keymaps = {
    send_motion = "ctr",
    visual_send = "ctr",
  },
})
```
# ssh server setup
1. Install with ```sudo apt install openssh-server```
2. Edit config file with ```sudo nvim /etc/ssh/sshd_config```
  1. enable the ```HostKey``` want to use, and enable ```AuthorizedKeysFile```.
  2. create the authorized key file and put local machine's public key to the file
  3. copy the public key from ```/etc/ssh/sshd_config``` on the host to the ```.ssh``` folder on local machine.
3. sudo systemctl restart ssh
