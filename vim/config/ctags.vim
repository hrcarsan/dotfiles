
function! g:GenerateTags()

  let ctags_exe = getcwd().'/ctags'

  call system('[ -x "'.ctags_exe.'" ] && '.ctags_exe.' >/dev/null 2>&1 &')
  echo 'Updating tags in background...'

endfunction


nnoremap <leader>gt :call g:GenerateTags()<cr>
