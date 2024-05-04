" Startup Settings
	syntax on
  " let mapleader=" " "Maps Leader to space
  " let NERDTreeShowHidden=1
  let g:auto_save = 1
  let g:auto_save_events = ["InsertLeave", "TextChanged"]
  " let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow --exclude .git --ignore-file ~/.ignore'
  set mouse=a "Allows mouse usage inside vim. Great for noobs.
  set clipboard=unnamedplus "Remaps default copy paste to system clipboard
  "set clipboard+=unnamed  " WINDOWS SETTING - use the clipboards of vim and win
  "set paste               " WINDOWS SETTING - Paste from a windows or from vim
  set go+=a                " Makes the Menu bar permanently visible in gVIM 
  set cursorline
  highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
	set noerrorbells
  set splitbelow splitright
	set tabstop=2 softtabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent
"  set nofoldenable
	set foldcolumn=1
  set foldmethod=marker
  set foldmarker={,} 
	set nowrap
	set smartcase
	set noswapfile
	set nobackup
	set incsearch
	set history=5000
	set nocompatible
  set number relativenumber
  " old one desert
  colorscheme habamax
  set background=dark
  set termguicolors
	filetype plugin on
	set encoding=utf-8
	set wildmenu
	set wildmode=longest,list,full
	set laststatus=2
	if !has('gui_running')
	  set t_Co=256
	endif
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	set spell spelllang=en_us
