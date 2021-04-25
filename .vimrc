set term=xterm-256color
colorscheme nimda

" visual mode
nmap ` vi
" surround selected gap 
nmap = ysiw
" Open file explorer
nnoremap <Tab> :NERDTree <CR>
" Open file window
nnoremap <Enter> :Files <CR>
" Show open tabs
nnoremap <BS> :Windows <CR>
" Search in current file
nnoremap <C-f> :BLines <CR>
" Search in loaded buffers
nnoremap <C-a> :Lines <CR>
" Show loaded buffers
nnoremap <C-b> :Buffers <CR>
" Show commit history of current file
nnoremap <C-g> :BCommits <CR>
" Show available commands
nnoremap <C-c> :Commands <CR>

" Window sizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Paste mode toggling
set pastetoggle=<F2>

" enable line numbers
set number relativenumber

" tabbings
set tabstop=4
set shiftwidth=4
set softtabstop=4

" au VimEnter *  NERDTree
let g:NERDTreeWinSize=50
let NERDTreeWinPos=1

let g:airline#extensions#tabline#formatter = 'default'
set laststatus=2

set rtp+=~/.fzf

call plug#begin()
        Plug 'tpope/vim-surround'
        Plug 'preservim/nerdtree'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-gitgutter'
        Plug 'itchyny/lightline.vim'
call plug#end()
