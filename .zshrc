zstyle ":completion:*:commands" rehash 1
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

bindkey '^k' autosuggest-accept

############################################
# export PATH
############################################
export TERM=xterm-256color

############################################
# Setting for pyenv     
############################################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export CPATH="/opt/homebrew/include:$CPATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# skip one line
add_newline() {
  if [[ -z $PS1_NEWLINE_LOGIN ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
precmd() { add_newline }

############################################
# Setting for alias 
############################################
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias keiossh="ssh ub775650@logex02.educ.cc.keio.ac.jp"
alias vi="vim"
alias resp9="ssh -XY -i ~/.ssh.ny.lab/id_rsa asahi@resp9.rt.k2.keio.ac.jp"
alias nygwy="ssh -XY -i ~/.ssh.ny.lab/id_rsa asahi@nygwy.ny.ics.keio.ac.jp"
alias vlsi="ssh -XY vlsi2508@katsuo.arc.ics.keio.ac.jp"

alias ls="ls --color=auto"

############################################
# Setting for Color
############################################
#plain="%{\033[0m%}"
#blue="%{\033[0;34m%}"
#cyan="%{\033[0;36m%}"
#green="%{\033[0;32m%}"
#magenta="%{\033[0;35m%}"
#red="%{\033[0;31m%}"
#white="%{\033[0;37m%}"
#yellow="%{\033[0;33m%}"

############################################
# Setting for PROMPT
############################################
PROMPT='%F{cyan}ash%f%F{white}:$ (%f%F{magenta}%~%f%F{white})%f
%F{cyan}>%f %F{plain}'

############################################
# Setting for homebrew
############################################
source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:/opt/homebrew/bin/"

############################################
# Setting for fzf
############################################
# Flutter SDK
export PATH=”$PATH”:"$HOME/.pub-cache/bin"

# nvim local
export PATH=/Users/ash/.local/bin:$PATH


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# my own bin && my own command
export PATH="$HOME/bin:$PATH" 

# ros environment
# source ~/ros2_m1_native/install/setup.zsh
# export ROS_VERSION=2
# export ROS_PYTHON_VERSION=3
# export ROS_DISTRO=humble
