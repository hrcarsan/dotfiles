" maps
nnoremap <c-c> :call CtrlC()<cr>
nnoremap <c-s> :call sidebar#toggle()<cr>
nnoremap <c-f> :call sidebar#goto_files_win()<cr>
nnoremap <c-t> :call sidebar#goto_outline_win()<CR>
nnoremap <leader>gd :call sidebar#open_git_diff()<cr>
nnoremap <leader>gs :call sidebar#open_git()<cr>

" sidebar
autocmd! VimEnter * call sidebar#init()

let g:sb_editor_win_id = 0
let g:sb_files_win_id = 0
let g:sb_outline_win_id = 0
let g:sb_git_win_id = 0

let g:sb_open = 0
let g:sb_git_open = 0
let g:sb_git_diff_open = 0


function! sidebar#init() abort
  if g:sb_editor_win_id
    return
  endif

  let g:sb_editor_win_id = win_getid()

  call sidebar#open()
endfunction


function! sidebar#open() abort
  if g:sb_open
    return
  endif

  if !g:sb_editor_win_id
    call sidebar#init()
    return
  endif

  Defx
  let g:sb_files_win_id = win_getid()

  split __vista__
  setlocal nobuflisted
  let g:sb_outline_win_id = win_getid()

  call sidebar#goto_editor_win()
  Vista

	call timer_start(100, {timer-> sidebar#resize()})

  let g:sb_open = 1
endfunction


function! sidebar#resize() abort
  let l:cur_win_id = win_getid()
  let l:height     = winheight(g:sb_editor_win_id)/(g:sb_git_open == 1? 3: 2)

  call sidebar#goto_files_win()
  exe "resize ".l:height

  call sidebar#goto_outline_win()
  exe "resize ".l:height

  call win_gotoid(l:cur_win_id)
endfunction


function! sidebar#close() abort
  if !g:sb_open
    return
  endif

  call sidebar#goto_editor_win()
  exe "normal \<c-w>o"
  let g:sb_open = 0
  let g:sb_git_open = 0
endfunction


function! sidebar#toggle()
  if g:sb_open
    call sidebar#close()
    return
  endif

  call sidebar#open()
endfunction


function! sidebar#goto_editor_win() abort
  call win_gotoid(g:sb_editor_win_id)
endfunction


function! sidebar#goto_files_win() abort
  call win_gotoid(g:sb_files_win_id)
endfunction


function! sidebar#goto_outline_win() abort
  call win_gotoid(g:sb_outline_win_id)
endfunction


function! sidebar#goto_git_win() abort
  call win_gotoid(g:sb_git_win_id)
endfunction


function! sidebar#open_git() abort
  if g:sb_git_open
    call sidebar#close_git()
  endif

  Git
  let g:sb_git_win_id = win_getid()
  let g:sb_git_open = 1
  setlocal nobuflisted
  setlocal signcolumn=no
  setlocal nonumber

  call sidebar#goto_editor_win()
  exe "normal \<c-w>H"
  vertical resize 130
  call sidebar#goto_git_win()
	call timer_start(100, {timer-> sidebar#resize()})
endfunction


function! sidebar#close_git() abort
  if !g:sb_git_open
    return
  endif

  exe "close ".g:sb_git_win_id
  let g:sb_git_open = 0
endfunction


function! sidebar#open_git_diff() abort
  if g:sb_git_diff_open
    return
  endif

  call sidebar#close()
  Gvdiff
  let g:sb_git_diff_open = 1
  setlocal nobuflisted
  setlocal nomodifiable
  call sidebar#goto_editor_win()
endfunction


function! sidebar#close_git_diff() abort
  if !g:sb_git_diff_open
    return
  endif

  call sidebar#goto_editor_win()
  exe "normal \<c-w>o"
  let g:sb_git_diff_open = 0
  call sidebar#open()
endfunction


function! CtrlC() abort
  if g:sb_git_diff_open
    call sidebar#close_git_diff()
  endif

  if  win_getid() != g:sb_editor_win_id
    call sidebar#goto_editor_win()
  endif

  exe "normal :\<c-c>"
endfunction







autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  setlocal cursorline

  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory()? defx#do_action('open_or_close_tree'):
    \ defx#do_action('drop')
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

