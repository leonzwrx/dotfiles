" Startup Settings
  let NERDTreeShowHidden=1
  let g:auto_save = 1
  let g:auto_save_events = ["InsertLeave", "TextChanged"]
  if executable('fdfind')
    let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow --exclude .git --ignore-file ~/.fzfignore'
  elseif executable('fd')
    let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git --ignore-file ~/.fzfignore'
  else
    echo "Neither fdfind nor fd is available"
  endif
 set mouse=a "Allows mouse usage inside vim. Great for noobs.
  set clipboard=unnamedplus "Remaps default copy paste to system clipboard
  set cursorline
  highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
	set noerrorbells
  set splitbelow splitright
	set tabstop=2 softtabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent
"Folding Settings
  set nofoldenable "in the past, left enabled
	set foldcolumn=1
  set foldmethod=marker
  set foldmarker={,} 

  set nowrap
	set smartcase
	set noswapfile
	set nobackup
	set incsearch
	set hlsearch
  set history=5000
	set nocompatible
  set number relativenumber
  set background=dark
	filetype plugin on
	set encoding=utf-8
	set wildmenu
	set wildmode=longest,list,full
	set laststatus=2 " Ensure the statusline is always visible
	if !has('gui_running')
	  set t_Co=256
  endif
	set guifont=Ubuntu\ Mono:h11

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	set spell spelllang=en_us

" Neovide extras
  let g:neovide_cursor_vfx_mode="pixiedust"

" Persistent_undo
	set undodir=~/.config/nvim/undodir"
	set undofile
	let g:undotree_WindowLayout = 2

" ----- vim-pandoc Conceal Settings -----
let g:pandoc#syntax#conceal#use = 1       " Enable conceal
let g:pandoc#syntax#conceal#blacklist = ['codeblock_start', 'codeblock_delim'] " Keep ``` visible

" Auto-toggle conceal on mode change
augroup pandoc_conceal
  autocmd!
  autocmd FileType markdown,pandoc setlocal conceallevel=2
  autocmd FileType markdown,pandoc autocmd InsertEnter * setlocal conceallevel=0
  autocmd FileType markdown,pandoc autocmd InsertLeave * setlocal conceallevel=2
augroup END

" Manual toggle with <leader>m (same as before)
nnoremap <leader>m :set conceallevel=<c-r>=&conceallevel == 0 ? 2 : 0<cr><cr>
