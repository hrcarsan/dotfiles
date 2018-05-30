
  let mapleader = ","

  " save a file
  nnoremap <leader>w :w<cr>:<cr>

  " quit
  nnoremap <leader>q :qa<cr>

  " open vim configuration in a new window
  nnoremap <leader>ve :vsplit $MYVIMRC<cr>

  " source vim configuration
  nnoremap <leader>vs :source $MYVIMRC<cr>:noh<cr>h

  " add \v (magic regex) to do normal regex searchs
  nnoremap / /\v
  vnoremap / /\v
  nnoremap ? ?\v
  vnoremap ? ?\v

  " remove search higlight
  nnoremap <leader><space> :noh<cr>

  " buffers: previous, next, close
  nnoremap <c-h> :silent bp<cr>
  nnoremap <c-l> :silent bn<cr>
  nnoremap <c-x> :bd<cr>

  " move lines down/up
  nnoremap - :m .+1<cr>==
  nnoremap _ :m .-2<cr>==

  " enclosed width quotes
  nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
  nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

  " return to normal mode
  inoremap <c-c> <esc>
  nnoremap <c-c> :<c-c>
  
  " cut/copy/paste
  vnor <C-X> "+x
  vnor <C-Y> "+y
  inor <C-V> <C-O>:set paste<CR><C-R>+<C-O>:set nopaste<CR>
  vnor <C-V> :<C-U>set paste<CR>gvc<C-R>+<C-O>:set nopaste<CR><ESC>

  " save workspace
  "nnoremap <leader>tw :ToggleWorkspace<CR>

  nnoremap <leader>n *N
  nnoremap <leader>c :GitGutterToggle<cr>
  nnoremap <leader>z Vi{zfkj

  nnoremap <leader>i :IndentLinesToggle<cr>
  
  " search
  "function! FindDefinition(pattern)
    "let pattern1 = 'function[\s\n\f\r\t ]\+'.a:pattern.'[\s\n\f\r\t ]*('
    "let pattern2 = '\<'.a:pattern.'[\s\n\f\r\t ]*=[\s\n\f\r\t ]*function[\s\n\f\r\t ]\+'
    "let pattern3 = 'class[\s\n\f\r\t ]\+'.a:pattern.'\>'

    "let cmd  = 'silent grep! -sRnI --exclude-dir=.git . '
    "let cmd .= ' -e '''.pattern1.''''
    "let cmd .= ' -e '''.pattern2.''''
    "let cmd .= ' -e '''.pattern3.''''

    "execute cmd
    "cw
    "redraw!
    "let @/ = a:pattern
  "endfunction

  "command! -nargs=1 FindDef call FindDefinition(<f-args>) | normal n
  "nnoremap <leader>d :execute "FindDef ".expand("<cword>")<cr>

  map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

