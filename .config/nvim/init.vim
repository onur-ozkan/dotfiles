call plug#begin()
	" Nimda
	Plug 'ozkanonur/nimda-vim'

	" Telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" File Explorer
	Plug 'preservim/nerdtree'

	" Vim Search
	Plug 'eugen0329/vim-esearch'

	" Illuminate
	Plug 'RRethy/vim-illuminate'

	" Vim Move
	Plug 'matze/vim-move'

	" Nvim LspConfig
	Plug 'neovim/nvim-lspconfig'

	" Nvim Cmp
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'

	" Lualine
	Plug 'hoob3rt/lualine.nvim'
call plug#end()


" Mappings {
	" Open file explorer
	nnoremap <silent> ` :NERDTreeToggle <CR>
	" File search
	nnoremap <silent> <space>` :Telescope find_files <CR>
	" Display git status
	nnoremap <BS> :Telescope git_status <CR>
	" Grep for string that is under the cursor
	nnoremap <C-n> :Telescope grep_string <CR>
	" Grep in whole workspace
	nnoremap <C-f> :Telescope live_grep <CR>
	" Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
	nnoremap <C-g> :Telescope git_commits <CR>
	" Copy to clipboard
	vnoremap  <leader>y  "+y

	" Window sizing
	noremap <silent> <S-Left> :vertical resize +3<CR>
	noremap <silent> <S-Right> :vertical resize -3<CR>
	noremap <silent> <S-Up> :resize +3<CR>
	noremap <silent> <S-Down> :resize -3<CR>

	" Switch tabs easier
	for i in range(1, 12)
	  execute "nmap ".i."T ".i."gt"
	endfor
" Mappings }

" NERDTree {
	let NERDTreeIgnore = ['\.swp$', '\.swo$', '.git$', '.cache', '\~$']

	" Open the existing NERDTree on each new tab.
	autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
	" Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

	let g:NERDTreeStatusline = '%#NonText#'

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
	set termguicolors
	colorscheme nimda

	set showtabline=2
	set tabline=%!DisplayTabId()

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

	set ttyfast
	set lazyredraw

	" Set completeopt to have a better completion experience
	set completeopt=menuone,noinsert,noselect
" Settings }

" vim-move }
	let g:move_key_modifier = 'C'
" vim-move }

" Functions }
	function! DisplayTabId()
		let s = ''
		for i in range(tabpagenr('$'))
			let tab = i + 1
			let winnr = tabpagewinnr(tab)
			let buflist = tabpagebuflist(tab)
			let bufnr = buflist[winnr - 1]
			let bufname = bufname(bufnr)
			let bufmodified = getbufvar(bufnr, "&mod")

			let s .= '%' . tab . 'T'
			let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
			let s .= ' [' . tab .'] '
			let s .= (bufname != '' ?  fnamemodify(bufname, ':t') . ' ' : '[No Name] ')
			if bufmodified
				let s .= '• '
			endif
		endfor

		let s .= '%#TabLineFill#'
		if (exists("g:tablineclosebutton"))
			let s .= '%=%999XX'
		endif
		return s
	endfunction
" Functions }

lua require('config/lsp')
lua require('ui/statusline')

