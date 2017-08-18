# -------------------------------------
# Editor
#
export XDG_CONFIG_HOME="$HOME/.config"

# -------------------------------------
# Work
#
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# golang
export GOPATH="$HOME/workspace"
export PATH="$GOPATH/bin:$HOME/.linuxbrew/opt/go/libexec/bin:$PATH"
# glide
[ -f $GOPATH/bin/glide ] && export GO15VENDOREXPERIMENT=1

# rust
source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"

# -------------------------------------
# Package
#
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

# -------------------------------------
# shell
#
# enhancd
source "$HOME/bin/enhancd/init.sh"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="
  --ansi
  --reverse
  --exit-0
  --color info:183,prompt:110,spinner:107,pointer:167,marker:215
"

# direnv
[ -f $GOPATH/bin/direnv ] && eval "$(direnv hook bash)"
