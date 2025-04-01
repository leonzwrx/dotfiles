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
  set go+=a                " Makes the Menu bar permanently visible in gVIM 
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

" Markdown Conceal (preservim/vim-markdown)
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_strikethrough = 1

" Auto-toggle conceal on mode change
augroup markdown_conceal
  autocmd!
  autocmd FileType markdown setlocal conceallevel=2
  autocmd FileType markdown autocmd InsertEnter * setlocal conceallevel=0
  autocmd FileType markdown autocmd InsertLeave * setlocal conceallevel=2
augroup END

" Force visible conceal chars (if your theme hides them)
hi! link Conceal Comment  " Make concealed chars visible as comments

"" transparent bg
"if has("gui_running")
"    " GVim specific settings
"    autocmd vimenter * hi Normal 
"else
"    " Terminal Vim specific settings
"    autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"endif
