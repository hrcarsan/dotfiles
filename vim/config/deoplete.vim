let g:deoplete#enable_at_startup = 1

silent! call deoplete#custom#option('max_list', 20)

" fix cursor flashing after popup is shown
"let s:popup_visible = 0


"function! s:MapKeys()

  "let keys =
  "\[
    "\'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    "\'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    "\'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    "\'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    "\'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    "\'-', '_', '~', '^', '.', ',', ':', '!', '#', '=', '%', '$', '@',
    "\'<', '>', '/', '<space>', '<bs>'
  "\]

  "for key in keys
    "execute "inoremap <expr> ".key." <SID>KeyPress('".key."')"
  "endfor

"endfunction


"function! s:KeyPress(char)

  "let visible = pumvisible()
  "let char    = a:char

  "if s:popup_visible == 1 && !visible

    "let char = char."%\<bs>"
  "endif

  "let s:popup_visible = visible

  "return char
"endfunction


"call s:MapKeys()

