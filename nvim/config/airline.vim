
  " vim-airline
  "let g:airline_theme = 'native'
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = 
  \{
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'VL',
    \ '' : 'VB',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
  \}

  let g:airline_skip_empty_sections = 1
  "let g:airline_section_c = '%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
  let g:airline_section_c = '%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
  let g:airline_section_y = ''
  let g:airline_section_z = 'Column %-3v %{g:airline_symbols.linenr}%L Line(s)'
  let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
  let g:airline#extensions#wordcount#enabled = 0
  let g:airline#extensions#tagbar#enabled = 0
  "let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#whitespace#enabled = 0
  " Just show the filename (no path) in the tab
  "let g:airline#extensions#tabline#fnamemod = ':t'

  autocmd BufEnter * :AirlineRefresh
