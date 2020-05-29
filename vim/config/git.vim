" vim-gitgutter
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager    = 0
"let g:gitgutter_enabled  = 0
    "autocmd! gitgutter CursorHold 
    ",CursorHoldI
    "autocmd BufWritePost * GitGutter

let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_override_sign_column_highlight = 0

nnoremap <leader>gs :Git<cr>
"nnoremap <leader>gs :call g:OpenGit()<cr>
nnoremap <leader>gd :Gvdiff<cr>

"autocmd FileType fugitive call s:OnFugitive()

"function! s:OnFugitive() abort
  "setlocal nobuflisted
  "exe "normal \<c-w>k"
  "exe "normal \<c-w>H"
  "vertical resize 130
"endfunction

function! g:OpenGit() abort

  let gitwinnr = bufwinnr('__git__')

  if gitwinnr != -1
    exe "normal ".gitwinnr."\<c-w>\<c-w>"
    return
  endif

  Git
  setlocal nobuflisted
  setlocal signcolumn=no
  setlocal nonumber
  file __git__
  exe "normal \<c-w>k"
  exe "normal \<c-w>H"
  vertical resize 130
endfunction
