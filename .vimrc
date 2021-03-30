if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

:set number relativenumber
:set rtp+=~/.fzf

:set tabstop=4
:set shiftwidth=4
:set softtabstop=4

:colorscheme nimda

" au VimEnter *  NERDTree
let g:NERDTreeWinSize=50
let NERDTreeWinPos=1

let g:airline#extensions#tabline#formatter = 'default'
set laststatus=2

call plug#begin()
        Plug 'ycm-core/YouCompleteMe'
        Plug 'preservim/nerdtree'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-gitgutter'
        Plug 'itchyny/lightline.vim'
call plug#end()
