let g:auto_save = 1
let g:auto_save_silent = 1

let g:auto_save_presave_hook = 'call AbortAutoSave()'

function! AbortAutoSave()
  if &filetype == 'go'
    let g:auto_save_abort = 1
  endif
endfunction
