" MIT License. Copyright (c) 2013-2018 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

" we don't actually want this loaded :P
"finish

" Due to some potential rendering issues, the use of the `space` variable is
" recommended.
let s:spc = g:airline_symbols.space

" Extension specific variables can be defined the usual fashion.
if !exists('g:airline#extensions#example#number_of_cats')
  let g:airline#extensions#example#number_of_cats = 1
endif


" First we define an init function that will be invoked from extensions.vim
function! airline#extensions#example#init(ext)

  " Here we define a new part for the plugin.  This allows users to place this
  " extension in arbitrary locations.
  call airline#parts#define_raw('cats', '%{airline#extensions#example#get_cats()}')

  " Next up we add a funcref so that we can run some code prior to the
  " statusline getting modifed.
  call a:ext.add_statusline_func('airline#extensions#example#apply')

  " You can also add a funcref for inactive statuslines.
  " call a:ext.add_inactive_statusline_func('airline#extensions#example#unapply')
endfunction

" This function will be invoked just prior to the statusline getting modified.
function! airline#extensions#example#apply(...)

  if &filetype !=# 'fif' | return | endif

    " Let's say we want to append to section_c, first we check if there's
    " already a window-local override, and if not, create it off of the global
    " section_c.
    "let w:airline_section_c = get(w:, 'airline_section_c', g:airline_section_c)
    "let w:airline_section_c = s:spc.g:airline_left_alt_sep.s:spc.'%{airline#extensions#example#get_cats()}'

  if !exists('b:fif_pattern') | let b:fif_pattern = 'pattern' | endif
    " Then we just append this extenion to it, optionally using separators.
    "let w:airline_section_b = 'Find in Files'
    "let w:airline_section_c = '%{airline#extensions#example#get_cats()}'
    let w:airline_section_c = 'Find in files'.s:spc.g:airline_left_alt_sep.s:spc.b:fif_pattern
    let w:airline_section_x = '' 
endfunction

" Finally, this function will be invoked from the statusline.
function! airline#extensions#example#get_cats()

  if !exists('b:fif_pattern') | let b:fif_pattern = 'pattern' | endif

  return b:fif_pattern
  "let cats = ''
  "for i in range(1, g:airline#extensions#example#number_of_cats)
    "let cats .= '(,,,)=(^.^)=(,,,) '
  "endfor
  "return cats
endfunction
