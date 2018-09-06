" Find in files config

augroup fif
  au!
  au filetype fif IndentLinesDisable
  au filetype fif DisableWhitespace
augroup END

nnoremap <c-_> :FindInFiles<space>
nnoremap <leader>f :exec "FiF ".expand("<cword>")<cr>

