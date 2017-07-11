let $VIMRC=expand('$XDG_CONFIG_HOME/vim')

" -------------------------------------
" Setting load
"
execute 'source $VIMRC/edit.rc.vim'
execute 'source $VIMRC/encoding.rc.vim'
execute 'source $VIMRC/keymap.rc.vim'
execute 'source $VIMRC/unset.rc.vim'
execute 'source $VIMRC/view.rc.vim'

" -------------------------------------
" Plugin load
"
execute 'source $XDG_CONFIG_HOME/dein/rc.vim'

