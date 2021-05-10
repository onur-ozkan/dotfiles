" Mappings {
	" surround selected gap 
	nmap = ysiw
	" Open file explorer
	nnoremap <silent> <Tab> :NERDTreeToggle <CR>
	" Open file window
	nnoremap <Enter> :GFiles <CR>
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
	noremap <silent> <S-Left> :vertical resize +3<CR>
	noremap <silent> <S-Right> :vertical resize -3<CR>
	noremap <silent> <S-Up> :resize +3<CR>
	noremap <silent> <S-Down> :resize -3<CR>

	" Paste mode toggling
	set pastetoggle=<F2>
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

call plug#begin()
	" Text surrounding
	Plug 'tpope/vim-surround'
	
	" File Explorer
	Plug 'preservim/nerdtree'

	" Fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

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

call plug#end()
