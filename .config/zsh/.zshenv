# zshenv


# load custom environment variables
if [ -f $HOME/.config/ewhd/ewhd-env ] ; then
    . $HOME/.config/ewhd/ewhd-env
fi

# Plugins
fpath=($ZDOTDIR/plugins $fpath) && if [ ! -d $ZDOTDIR/plugins ]; then mkdir -p $ZDOTDIR/plugins; fi

# Prompts
fpath=($ZDOTDIR/prompt $fpath)  && if [ ! -d $ZDOTDIR/prompt ]; then mkdir -p $ZDOTDIR/prompt; fi

export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$XDG_STATE_HOME/zsh/history && touch $HISTFILE
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE                  # Maximum events in history file

# Man pages
# export MANPAGER='emacs +Man!'

# open man pages with emacs
# https://www.reddit.com/r/emacs/comments/kzspes/open_man_pages_in_emacs/
# This currently doesn't work
# if [[ -z ${INSIDE_EMACS+1} ]]; then
#     function man() {
# 	    emacs '' -cne "(let ((buf (man \"$1\"))) (delete-other-windows) (switch-to-buffer buf) (evil-local-set-key 'normal \"q\" (lambda () (interactive) (kill-current-buffer) (delete-frame))))" > /dev/null
#     }
# fi




