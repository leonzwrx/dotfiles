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
  nnoremap <Leader>m :set conceallevel=<c-r>=&conceallevel == 0 ? 2 : 0<cr><cr>

" ----------------------------
" Checkbox cycling (sticky notes)
" ----------------------------

function! CycleCheckbox()
  let line = getline('.')

  " Strip any existing list / checkbox prefix
  let text = substitute(line, '^\s*-\s*\[[ x-]\]\s*', '', '')
  let text = substitute(text, '^\s*-\s*', '', '')

  " Cycle states:
  " text -> [ ] -> [-] -> [x] -> text
  if line =~ '^\s*-\s*\[ \]'
    call setline('.', '- [-] ' . text)

  elseif line =~ '^\s*-\s*\[-\]'
    call setline('.', '- [x] ' . text)

  elseif line =~ '^\s*-\s*\[x\]'
    call setline('.', text)

  else
    call setline('.', '- [ ] ' . text)
  endif
endfunction

nnoremap <leader>x :call CycleCheckbox()<CR>


" ----------------------------
" Checkbox highlighting (multi-state)
" ----------------------------

" Clear old matches (important on reload)
call clearmatches()

highlight CheckboxTodo guifg=#E5C07B
highlight CheckboxWIP  guifg=#61AFEF
highlight CheckboxDone guifg=#98C379

call matchadd('CheckboxTodo', '^\s*-\s*\[ \].*$')
call matchadd('CheckboxWIP',  '^\s*-\s*\[-\].*$')
call matchadd('CheckboxDone', '^\s*-\s*\[x\].*$')
