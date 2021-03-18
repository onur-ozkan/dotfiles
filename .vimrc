if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

:set number relativenumber
au VimEnter *  NERDTree
let g:NERDTreeWinSize=50
let NERDTreeWinPos=1

call plug#begin()
        Plug 'preservim/nerdtree'
call plug#end()
