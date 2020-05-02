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
nnoremap <leader>gd :Gvdiff<cr>
