" Mappings {
	" surround selected gap 
	nmap = ysiw
	" Open file explorer
    nnoremap <silent> ` :NERDTreeToggle <CR>
    " Open nnn
	nnoremap <silent> <Enter> :NnnPicker <CR>
	" Show open tabs
	nnoremap <C-w> :Windows <CR>
	" Search in current file
	nnoremap <C-f> :BLines <CR>
	" Show commit history of current file
	nnoremap <C-g> :BCommits <CR>
	" Show available commands
	nnoremap <C-c> :Commands <CR>
    
	" Window sizing
	noremap <silent> <S-Left> :vertical resize +3<CR>
	noremap <silent> <S-Right> :vertical resize -3<CR>
	noremap <silent> <S-Up> :resize +3<CR>
	noremap <silent> <S-Down> :resize -3<CR>

	" Paste mode toggling
	set pastetoggle=<F2>

    " Commit message of the line
    nmap <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>
" Mappings }

" Fzf {
	set rtp+=~/.fzf
" Fzf }

" NERDTree {
	let g:NERDTreeWinSize=50
	let NERDTreeWinPos=1
	let NERDTreeShowHidden=1
" NERDTree }

" ALE {
	let g:ale_sign_error = ''
	let g:ale_sign_warning = ''
	let g:ale_sign_info = ''
	let g:ale_sign_style_error = ''
	let g:ale_sign_style_warning = ''

	let g:ale_linters = { 'cs': ['OmniSharp'] }
" ALE }

" Settings {
	set term=xterm-256color
	colorscheme nimda

    silent verbose setlocal omnifunc

	filetype indent plugin on
	if !exists('g:syntax_on') | syntax enable | endif
	set encoding=utf-8
	scriptencoding utf-8

	set number relativenumber

	set completeopt=menuone,noinsert,noselect,popuphidden
	set completepopup=highlight:Pmenu,border:off

	set backspace=indent,eol,start
	set expandtab
	set shiftround
	set shiftwidth=4
	set softtabstop=-1
	set tabstop=4
	set textwidth=80
	set title

	set hidden
	set nofixendofline
	set nostartofline
	set splitbelow
	set splitright

	set hlsearch
	set incsearch
	set laststatus=2
	set noruler
	set noshowmode
	set signcolumn=yes

	set mouse=a
	set updatetime=1000
" Settings }

" OmniSharp {
	let g:OmniSharp_popup_position = 'peek'

	let g:OmniSharp_popup_options = {
	\ 'highlight': 'Normal',
	\ 'padding': [0, 0, 0, 0],
	\ 'border': [1]
	\}

	let g:OmniSharp_popup_mappings = {
	\ 'sigNext': '<C-n>',
	\ 'sigPrev': '<C-p>',
	\ 'pageDown': ['<C-f>', '<PageDown>'],
	\ 'pageUp': ['<C-b>', '<PageUp>']
	\}

	let g:OmniSharp_highlight_groups = {
	\ 'ExcludedCode': 'NonText'
	\}
" OmniSharp }

" GoLang }
    " Syntax highlighting
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_operators = 1

    " Status line types/signatures
    let g:go_auto_type_info = 1
    
    " Show autocomplete window when press '.'
    au filetype go inoremap <buffer> . .<C-x><C-o>
" GoLang }

" n³ }
    " let g:nnn#command = 'tmux new -s "nnn-vim" nnn -P p'
    let g:nnn#command = 'nnn -C -P f'
    let g:nnn#layout = 'new'
    let g:nnn#action = {
      \ '<Enter>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
" n³ }

call plug#begin()
	" Text surrounding
	Plug 'tpope/vim-surround'

	" Fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

    " File Explorer
	Plug 'preservim/nerdtree'

	" Statusline
	Plug 'itchyny/lightline.vim'

	" Omnisharp for C#
	Plug 'OmniSharp/omnisharp-vim'
	
	" Autocompletion
	Plug 'prabirshrestha/asyncomplete.vim'

	" Linting/error highlighting
	Plug 'dense-analysis/ale'
	
	" GoLang
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    
    " SuperTab
	Plug 'ervandew/supertab'

	" Vim Search
	Plug 'eugen0329/vim-esearch'

	" n³
	Plug 'mcchrish/nnn.vim'
call plug#end()
