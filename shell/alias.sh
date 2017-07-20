# Cute shell shortcuts
# alias ls='ls --sort=extension --color=auto'
alias ls='ls --color=auto'
alias l='ls -CF'
alias ll='ls -lFh'
alias la='ls -A'
alias lla='ls -alFh'
alias cls='clear && ll'
alias md='mkdir -p'
alias grep='grep --color'
alias h='history'
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# alias less='~/.linuxbrew/share/nvim/runtime/macros/less.sh'
alias tmux='tmux -2'
alias vn='nvim'
alias gti='git'

# This one is to take care of make
# Give me a nice, distinguishable make output
alias make='clear && make'
alias m='make'
alias smi='sudo make install'

# Some more, to avoid mistakes
alias rm='rm -i'

# Some quick shourtcuts
alias reload='source ~/.bashrc'
alias reboot='sudo shutdown -r now'
alias off='sudo shutdown -h now'
alias keys='ssh-add -l'

