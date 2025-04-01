 " Plugin Loading
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'itchyny/lightline.vim' "Highlights lines
Plug 'joshdick/onedark.vim' "The One Dark Theme
Plug 'nordtheme/vim' "Nord Theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "Fuzzy find plugin
Plug 'junegunn/goyo.vim' "Removes Line numbers for focusing
Plug 'mbbill/undotree' "Creates an undo tree
Plug 'preservim/nerdtree' "File browser inside vim
Plug 'godlygeek/tabular' "Auto formatting
Plug 'preservim/vim-markdown' " Corrected vim-markdown name
Plug 'ryanoasis/vim-devicons' "Cool icons for nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin' "nerd tree customization
Plug '907th/vim-auto-save' "auto saves files as you edit
Plug 'ap/vim-css-color' "color previews for CSS
Plug 'Raimondi/delimitMate' "automatic closing of quotes, parentheses, brackets, etc
call plug#end()
