# Command Prompt Settings
PS1="
[\`if [ \$? = 0 ];
  then
    echo \[\e[32m\]✔\[\e[0m\];
  else
    echo \[\e[31m\]✘\[\e[0m\];
fi\`][\[\e[1;49;34m\]\W\[\e[0m\]] "

# Prioritize homebrew installations over system installations
# (e.g. use homebrew's git version vs Apple's git version)
export PATH=/usr/local/bin:$PATH

# Access to Python 3 for pip3
export PATH=/usr/local/share/python:$PATH

# Node Version Manager - required for nvm to work
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NVIM / VIM settings
export VISUAL=nvim # nvim is the default editor

alias vim=nvim
alias vi=nvim
alias v=nvim

export VIMCONFIG=~/.vim
export VIMDATA=~/.vim

# Fuzzy finder
export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin
export FZF_DEFAULT_COMMAND='rg --files --hidden' # ignore files in .gitignore
