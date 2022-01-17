#  _________  _   _ ____   ____ 
# |__  / ___|| | | |  _ \ / ___|
#   / /\___ \| |_| | |_) | |    
#  / /_ ___) |  _  |  _ <| |___ 
# /____|____/|_| |_|_| \_\\____|
                              
# if not interactive -> do nothing
[[ $- != *i* ]] && return 

# ------- #
# General #
# ------- #
# {{{
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments # ignore comments
# Cache  
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
# }}}

# -------------- #
# Complications  #
# -------------- #
#{{{

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.
# }}}

# -------------- #
# Vim            #
# -------------- #
#{{{

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# }}}

# ------ #
# Looks  #
# ------ #
#{{{
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# if inside tmux

if [ -n "${TMUX}" ]; then
  #picture=$(ls -d -1 '/home/obxd/Pictures/waifus/waifus/images'/* | shuf -n 1)
  #~/scripts/random_color_art # color thingy
  #~/scripts/image-show 2 1 40 40 $picture
  picture=$(ls -d -1 '/home/obxd/Pictures/anime/minimalisic_art_anime'/* | shuf -n 1)
  neofetch --crop_mod fit --ueberzug $picture
  clear
fi
#}}}

# ------ #
# loads  #
# ------ #
#{{{
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc" # aliases
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh # <CTRL+T> files+folders <CTRL+R> history <ALT+C> fuzzy cd
source ~/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh # Load syntax highlighting; should be last.
#}}} 

# ------ #
# Tmux   #
# ------ #
#{{{
# if tmux is executable and not inside a tmux session
#  start a new session
[ -x "$(command -v tmux)" ] \
  && [ -z "${TMUX}" ] \
  && { tmux; } >/dev/null 2>&1
# }}}

# vim: foldmethod=marker
