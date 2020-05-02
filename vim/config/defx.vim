function! SideBarToggle()
    "if 0 == argc()
      Defx
      TagbarToggle
      resize 20
      "exe "normal \<c-w>="
      "exe "normal \<c-w>20+"
      exe "normal \<c-w>h"
    "end
endfunction

autocmd VimEnter * call SideBarToggle()

nnoremap <c-n> :Defx <CR> :TagbarToggle <CR>

let g:tagbar_vertical = 19
let NERDTreeWinPos = 'left'

autocmd VimEnter * noremap <c-f> <c-w>l<c-w>k
autocmd VimEnter * noremap <c-t> <c-w>l<c-w>j

autocmd FileType tagbar nnoremap <c-c> <c-w>h
autocmd FileType tagbar setlocal cursorline

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  setlocal cursorline

  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory()? defx#do_action('open_or_close_tree'):
  \ defx#do_action('drop')

  nnoremap <c-c> <c-w>h

  "nnoremap <silent><buffer><expr> o defx#do_action('drop')
  "nnoremap <silent><buffer><expr> c
  "\ defx#do_action('copy')
  "nnoremap <silent><buffer><expr> m
  "\ defx#do_action('move')
  "nnoremap <silent><buffer><expr> p
  "\ defx#do_action('paste')
  "nnoremap <silent><buffer><expr> l
  "\ defx#do_action('open')
  "nnoremap <silent><buffer><expr> E
  "\ defx#do_action('open', 'vsplit')
  "nnoremap <silent><buffer><expr> P
  "\ defx#do_action('open', 'pedit')
  "nnoremap <silent><buffer><expr> za
  "\ defx#do_action('open_or_close_tree')
  "nnoremap <silent><buffer><expr> K
  "\ defx#do_action('new_directory')
  "nnoremap <silent><buffer><expr> N
  "\ defx#do_action('new_file')
  "nnoremap <silent><buffer><expr> M
  "\ defx#do_action('new_multiple_files')
  "nnoremap <silent><buffer><expr> C
  "\ defx#do_action('toggle_columns',
  "\                'mark:indent:icon:filename:type:size:time')
  "nnoremap <silent><buffer><expr> S
  "\ defx#do_action('toggle_sort', 'time')
  "nnoremap <silent><buffer><expr> d
  "\ defx#do_action('remove')
  "nnoremap <silent><buffer><expr> r
  "\ defx#do_action('rename')
  "nnoremap <silent><buffer><expr> !
  "\ defx#do_action('execute_command')
  "nnoremap <silent><buffer><expr> x
  "\ defx#do_action('execute_system')
  "nnoremap <silent><buffer><expr> yy
  "\ defx#do_action('yank_path')
  "nnoremap <silent><buffer><expr> .
  "\ defx#do_action('toggle_ignored_files')
  "nnoremap <silent><buffer><expr> ;
  "\ defx#do_action('repeat')
  "nnoremap <silent><buffer><expr> h
  "\ defx#do_action('cd', ['..'])
  "nnoremap <silent><buffer><expr> ~
  "\ defx#do_action('cd')
  "nnoremap <silent><buffer><expr> q
  "\ defx#do_action('quit')
  "nnoremap <silent><buffer><expr> <Space>
  "\ defx#do_action('toggle_select') . 'j'
  "nnoremap <silent><buffer><expr> *
  "\ defx#do_action('toggle_select_all')
  "nnoremap <silent><buffer><expr> j
  "\ line('.') == line('$') ? 'gg' : 'j'
  "nnoremap <silent><buffer><expr> k
  "\ line('.') == 1 ? 'G' : 'k'
  "nnoremap <silent><buffer><expr> <C-l>
  "\ defx#do_action('redraw')
  "nnoremap <silent><buffer><expr> <C-g>
  "\ defx#do_action('print')
  "nnoremap <silent><buffer><expr> cd
  "\ defx#do_action('change_vim_cwd')
endfunction

" Set appearance
call defx#custom#option('_', {
      \ 'winwidth': 35,
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
