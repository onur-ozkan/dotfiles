call plug#begin()
	" Nimda
	Plug 'ozkanonur/nimda-vim'

	" Text surrounding
	Plug 'tpope/vim-surround'

	" Fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" File Explorer
	Plug 'preservim/nerdtree'

	" Statusline
	Plug 'itchyny/lightline.vim'

	" Vim Search
	Plug 'eugen0329/vim-esearch'

	" Illuminate
	Plug 'RRethy/vim-illuminate'

	" Vim Move
	Plug 'matze/vim-move'

	" Nvim LspConfig
	Plug 'neovim/nvim-lspconfig'

	" Completion Nvim
	Plug 'nvim-lua/completion-nvim'
call plug#end()

" Functions {
	function TrimWhiteSpace()
	  %s/\s*$//
	  ''
	endfunction
" Functions }

" Mappings {
	" surround selected gap
	nmap = ysiw
	" Open file explorer
	nnoremap <silent> ` :NERDTreeToggle <CR>
	" File search
	nnoremap <silent> <Enter> :Files <CR>
	" Show open tabs
	nnoremap <BS> :Windows <CR>
	" Search in current file
	nnoremap <C-f> :BLines <CR>
	" Trim white spaces
	nnoremap <F5> :call TrimWhiteSpace() <CR>
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
	let NERDTreeIgnore = ['\.swp$', '\.swo$', '.git']

	" Open the existing NERDTree on each new tab.
	autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
	" Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


	let NERDTreeMinimalUI=1
	let NERDTreeWinSize=50
	let NERDTreeWinPos=1
	let NERDTreeShowHidden=1
	let NERDTreeQuitOnOpen=1
" NERDTree }

" vim-illuminate {
	augroup illuminate_augroup
		autocmd!
		autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
	augroup END
" vim-ulluminate }

" Settings {
	colorscheme nimda

	set shortmess-=S

	hi! Normal ctermbg=NONE guibg=NONE
	hi! NonText ctermbg=NONE guibg=NONE

	silent verbose setlocal omnifunc

	filetype indent plugin on
	if !exists('g:syntax_on') | syntax enable | endif
	set encoding=utf-8
	scriptencoding utf-8

	set number relativenumber

	" Highlight extra white spaces
	match Error /\s\+$/
	autocmd BufWinEnter * match Error /\s\+$/
	autocmd BufWinLeave * call clearmatches()

	set backspace=indent,eol,start
	set autoindent noexpandtab tabstop=4 shiftwidth=4
	" set textwidth=80
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


	inoremap <Tab> "\<C-p>"

	" Set completeopt to have a better completion experience
	set completeopt=menuone,noinsert,noselect

	" Avoid showing message extra message when using completion
	set shortmess+=c

	let g:completion_enable_auto_popup = 0
	let g:completion_enable_auto_hover = 1
	autocmd BufEnter * lua require'completion'.on_attach()

	imap <tab> <Plug>(completion_smart_tab)
" Settings }

" Lightline {
	let g:lightline = {
	      \ 'colorscheme': 'ayu_dark',
	      \ 'active': {
	      \   'left': [ [ 'mode', 'paste' ],
	      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	      \ },
	      \ 'component_function': {
	      \   'gitbranch': 'FugitiveHead'
	      \ },
	      \ }
" Lightline }

" vim-move }
	let g:move_key_modifier = 'C'
" vim-move }

lua require('config/lsp')
