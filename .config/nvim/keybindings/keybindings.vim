" Plugin Shortcuts
	nnoremap <Leader>n :NERDTreeToggle<CR>
  nnoremap <Leader>g :Goyo<CR>
  nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
  nnoremap <Leader>f :Files!<CR>
  nnoremap <Leader>h :History<CR>
  nnoremap <Leader>l :Tabularize /

" Tabedit keybinds
  nnoremap <Leader>1 1gt<CR>
  nnoremap <Leader>2 2gt<CR>
  nnoremap <Leader>3 3gt<CR>
  nnoremap <Leader>4 4gt<CR>
  nnoremap <Leader>5 5gt<CR>
  nnoremap <Leader>t :tabnew<CR>
  nnoremap <Leader>c :tabclose<CR>

" Disable arrow keys in normal mode
  nnoremap <Up>    <Nop>
  nnoremap <Down>  <Nop>
  nnoremap <Left>  <Nop>
  nnoremap <Right> <Nop>

" Toggle Markdown conceal
  nnoremap <Leader>m :set conceallevel=<c-r>=&conceallevel == 0 ? 2 : 0<cr><cr
