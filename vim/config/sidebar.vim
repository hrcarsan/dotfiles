function! g:ToggleSidebar()

  if bufwinnr('defx') != -1
    exe "normal \<c-w>o"
    return
  endif

  Defx
  split __vista__
  exe "normal \<c-w>k"
  exe "normal \<c-w>19_"
  exe "normal \<c-w>j"
  exe "normal \<c-w>h"
  Vista
endfunction

" open at the start
autocmd VimEnter * call ToggleSidebar()

nnoremap <c-s> :call g:ToggleSidebar()<cr>
autocmd VimEnter * noremap <c-f> <c-w>l<c-w>k
autocmd VimEnter * noremap <c-t> <c-w>l<c-w>j

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  setlocal cursorline

  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory()? defx#do_action('open_or_close_tree'):
    \ defx#do_action('drop')

  nnoremap <c-c> <c-w>h
endfunction

" Set appearance
call defx#custom#option('_', {
      \ 'winwidth': 39,
      \ 'split': 'vertical',
      \ 'direction': 'botright',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'columns': 'icon:indent:icons:filename',
      \ 'resume': 0,
      \ })

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ })

