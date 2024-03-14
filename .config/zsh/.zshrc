#!/usr/bin/env zsh



# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# +------------+
# | NAVIGATION |
# +------------+

# setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECTALL              # Spelling correction for all arguments
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
# setopt GLOBDOTS              # Files beginning with a . be matched without explicitly specifying the dot.

source $ZDOTDIR/plugins/bd/bd.zsh


# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record adjacent duplicate events. 
# setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_FIND_NO_DUPS         # If history contains duplicates, do not show them while cycling
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.



# +-------+
# | OTHER |
# +-------+

setopt NOCLOBBER                 # Prevents you from accidentally overwriting an existing file.

# No bell: Shut up Zsh
unsetopt beep

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line



# +------+
# | ROOT |
# +------+

if [[ $UID -eq 0 ]]; then
  HISTFILE="${HISTFILE%_history}_root_history"
fi

# +---------+
# | ALIASES |
# +---------+

source $XDG_CONFIG_HOME/ewhd/ewhd-aliases


# +---------+
# | SCRIPTS |
# +---------+

source $XDG_CONFIG_HOME/ewhd/ewhd-scripts.sh

source $XDG_CONFIG_HOME/ewhd/ewhd-scripts.zsh


# +--------+
# | PROMPT |
# +--------+

autoload -Uz prompt_purification_setup && prompt_purification_setup

autoload -Uz prompt_kali_mod_setup && prompt_kali_mod_setup

autoload -Uz promptinit

promptinit



# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# +------------+
# | COMPLETION |
# +------------+
#source $ZDOTDIR/plugins/zsh-completions/zsh-completions.plugin.zsh

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# +-----------------+
# | AUTOSUGGESTIONS |
# +-----------------+

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# +-----+
# | Git |
# +-----+

# Add command gitit to open Github repo in default browser from a local repo
source $ZDOTDIR/plugins/git-it-on/git-it-on.zsh



#EOF
