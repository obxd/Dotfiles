#
# ~/.bashrc
#

# TODO it need to have the same bloat level as my zshrc

# nvm
source /usr/share/nvm/init-nvm.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Path
#export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH" 

# exta stuff
# my aliaces
if [ -f ~/.aliasrc ]; then
    source .aliasrc
fi
# vi mode
set -o vi


PS1='[\u@\h \W]\$ '

# color thingy
~/scripts/random_color_art
